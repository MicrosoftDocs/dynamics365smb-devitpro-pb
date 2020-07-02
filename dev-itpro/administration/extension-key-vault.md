---
title: Azure Key Vaults with Business Central
description: Describes how to use an Azure Key vault with Business Central extensions.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions

Some [!INCLUDE[prodshort](../developer/includes/prodshort.md) extensions make web service calls to non-[!INCLUDE[prodshort](../developer/includes/prodshort.md) services. For example, one extension might call Azure Storage to read/write blobs. Another extension might call the extension publisher's web service to do an operation. 

These web service calls are typically authenticated, which means the [!INCLUDE[prodshort](../developer/includes/prodshort.md) extension must provide a credential in the call. These credentials enable the other service to accept or reject the call.

The credential is a kind of secret. It is secret to the extension. It shouldn't leak to customers, partners, or anybody else. So where does the extension get the secret from? Well, this is where Azure Key Vaults comes into play. Azure Key Vault is a cloud service that works as a secure secrets store. It provides centralized storage for secrets, like passwords and database connection strings, enabling you to control access and distribution of the secrets.

Once you have an Azure Key Vault, you can develop [!INCLUDE[prodshort](../developer/includes/prodshort.md)] extensions to retrieve secrets from the key vault.

## Specifying Azure Key Vault in extensions

To use an Azure Key Vault for an extension, you specify the key vault the extension's manifest file (app.json), like this: 

```
 

    "keyVaultUrls": [ 

        "https://mykeyvault.vault.azure.net" 

    ] 

```

Then, you can add code to the extension to read secrets from the key vault at runtime, like this: 

```
page 50100 HelloWorldPage 

{ 

    var 

        SecretProvider: Codeunit "App Key Vault Secret Provider"; 

        SecretValue: Text; 

    trigger OnOpenPage(); 

    begin 

        if SecretProvider.TryInitializeFromCurrentApp() then begin 

            SecretProvider.GetSecret('secret1', SecretValue); 

            Message('retrieved secret: ' + SecretValue); 

        end 

        else 

            Message('ERROR: ' + GetLastErrorText()); 

    end; 

} 

```

The call to the `TryInitializeFromCurrentApp` method determines the extension that is currently being executed, then determines the extension's key vaults as specified in the extension manifest. After initialization, you can call the `GetSecret` method to read secrets from the key vault.


## Specifying two Azure Key Vaults 

An extension manifest can specify up to two Azure Key Vaults, like this: 

``` 

    "keyVaultUrls": [ 

        "https://myfirstkeyvault.vault.azure.net", 

        "https://mysecondkeyvault.vault.azure.net" 

    ] 
```
 
The use case for specifying two key vaults is to ensure high availability. At runtime, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform will iterate the key vaults until the secret is successfully retrieved. If one of the key vaults is unavailable for any reason, the extension will continue to execute without impact because the other key vault will most likely be available.

## Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises 

Follow the tasks in this section to configure an on-premises installation to use the Azure Key Vault feature. 

### Prerequisites

- Configure Azure Active Directory (Azure AD) authentication for authenticating [!INCLUDE[prodshort](../developer/includes/prodshort.md)] users.

    For more information, see [Authenticating Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).

- Obtain a security certificate

    As part of the setup later on, you'll have to register and configure an application in Azure AD for reading key vault, which requires the use of a certificate. The certificate is used prove the application's identity when requesting upon request. In a production environment, obtain a certificate from a certification authority or trusted provider. In a test environment, if you don't have a certificate, then you can create your own self-signed certificate.

<!-- 
```powershell
    $cert = New-SelfSignedCertificate -Subject "BusinessCentralKeyVaultReader" -Provider "Microsoft Strong Cryptographic Provider"

    $cert.Thumbprint

    Export-Certificate -Cert $cert -FilePath c:\certs\BusinessCentralKeyVaultReader.cer
```
-->


### Create the Azure Key Vault with secrets

Now, you create one or more key vaults in Azure, and add the secrets that you want to make available to your extensions. This step requires an Azure subscription. Because your solution is using Azure AD authentication, you should already have one.

<!--

1. Get an Azure subscription.

    Sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com).

2. Create one or more key vaults and add secrets that extensions will use.

-->

There are different ways to create an Azure key vault. For example, you can use the Azure portal, Azure CLI, and more.

The easiest way is to use the Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](/azure/key-vault/secrets/quick-create-portal). 

For using other methods, see [Azure Key Vault Developer's Guide](/azure/key-vault/general/developers-guide#creating-and-managing-key-vaults).

### Register a key vault reader application in Azure AD

Next, register a new application on your Azure AD tenant for reading secrets from the key vaults.

When Azure AD authentication was set up, an Azure AD tenant was created in Azure. Reading key vaults requires a separate application registration with the Azure AD tenant.

The steps in this task are done from the the [Azure portal](https://portal.azure.com).

1. Register an Azure AD application for the reading key vault.

    You add the new application by using the [Azure portal](https://portal.azure.com). For guidelines, see [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).
    
    When you add an application to an Azure AD tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|The name of your application as it will display to your users, such as *Business Central Key Vault Reader*.|
    |Supported account types|Specifies which accounts that you would like your application to support. For purposes of this article, select **Accounts in this organizational directory only**. |

    <!--
        |Directory Access|Choose **Single Sign-On**.|
            |App ID URI|The URI to a domain in your Azure AD tenant, such as *https://solutions.onmicrosoft.com/ExcelAddinforBusinessCentral*. **Important:**  The App ID URI must be unique within the Azure AD tenant and not the same as you specified for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution.|
                |Sign-on URL (App URL)|The URI for signing in to your [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)], such as `https://www.solutions.com/BC`|
    -->
    When completed, the **Overview** displays in the portal for the new application.

    Make a note of the **Display name** and/or **Application (client) ID**. You will use this information later.

2. Upload the security certificate to the registered application.

    In this step, you upload the certificate file that you obtained as part of the prerequisites.

    From the key vault reader application overview page, select **Certificates & secrets**, **Upload certificate**, and follow instructions to locate and upload the certificate.

### Grant the key vault reader application permission to key vaults

In this task, you grant the key vault reader application permission to read secrets from your key vaults. The steps in this task are done from the the [Azure portal](https://portal.azure.com).

1. Open the key vault in the portal.
2. Select **Access policies**, then **Add Access Policy**.
3. Set **Secret Permissions** to **Get**.
4. Select **Select principal**, and on the right, search for either **Application (client) ID** or display name for the key vault reader application. 
5. Select **Add**, then **Save**.

At this point, the work in Azure is finished.

### Configure the Business Central Server for the Apps Key Vault

Next, you configure the [!INCLUDE[prodshort](../developer/includes/prodshort.md) instance to use the key vault reader application and its certificate, which you registered in Azure AD, for authenticating to the key vaults.

1. If not already done, import your key vault certificate to the local certificate store for your [!INCLUDE[prodshort](../developer/includes/prodshort.md) server computer.

    1. You can import the certificate either using the [MMC snap-in](/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in) orr [Import-Certificate cmdlet](/powershell/module/pkiclient/import-certificate) from a Windows PowerShell prompt.

      For example, the following PowerShell command installs a certificate to the local machine's personal store: 
    
        ```powershell
        Import-Certificate -FilePath "C:\certificates\BusinessCentralKeyVaultReader.cer" -CertStoreLocation Cert:\LocalMachine\My
        ```

    2.     Make a note of the certificate thumbprint because you'll need it in the next step. For instructions on getting the thumbprint using the MMC snap-in, see [How to: Retrieve the Thumbprint of a Certificate](/dotnet/framework/wcf/feature-details/how-to-retrieve-the-thumbprint-of-a-certificate).

2. Configure the server instance.

    Now, you'll configure App Key Vault settings on the server instance. You can use any of the following methods:
    
    - [!INCLUDE[admintool](../developer/includes/admintool.md)
    - [Set-NAVServerConfiguration cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) of the [!INCLUDE[adminshell](../developer/includes/adminshell.md).
    - Manually modifying the server instances CustomSetting.config file. 
    
    For more information about using these tools, see [Configuring Business Central Server](configure-server-instance.md).
    
    The following table describes the settings that you configure to enable Azure key vault on the server instance:
     
    |Setting|Key name in CustomSetting.config|Value|Example|
    |--------|-------------------------------|-----|-------|
    |Client Certificate Store Location|AzureKeyVaultClientCertificateStoreLocation|Set to the certificate store location where key vault certificate was stored.|LocalMachine|
    |Client Certificate Store Name|AzureKeyVaultClientCertificateStoreName|Set to the certificate store name where key vault certificate was stored.|MY|
    |Client Certificate Thumbprint|AzureKeyVaultClientCertificateThumbprint|Set to the thumbprint for the key vault certificate.|649419e4fbb87340f5a0f995e605b74c5f6d943e|
    |Client ID|AzureKeyVaultClientId|Set to the **Application (client) ID** of the key vault reader application registered in your Azure AD tenant. |ed4129d9-b913-4514-83db-82e305163bec|
    |Enable Publisher Validation|AzureKeyVaultAppSecretsPublisherValidationEnabled| Specifies whether extensions can only use key vaults that belong to their publishers. An extension publisher's identity is specified when the extension is published. Enabling this setting blocks attempts in AL to read secrets from another publisher's key vault.|false|

    > [!IMPORTANT]
    > Setting the `AzureKeyVaultAppSecretsPublisherValidationEnabled` to false means the server instance won't do any additional validation to ensure extensions have the right to read secrets from the key vaults that they specify. This condition implies some risk of unauthorized access to key vaults that you should be aware of. Please see the "Security considerations" section below for more details.

At this point, you can run your extensions that use key vault secrets to read secrets from key vault. For troubleshooting, please look in the Event Log and configure App Insights telemetry.

## Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online

In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the Azure Key Vault feature is available for all App Source apps. However, there are some onboarding tasks required. 

### Create the Azure Key Vault with secrets

Now, you create one or more key vaults in Azure, and add the secrets that you want to make available to your extensions.
<!--

1. Get an Azure subscription.

    Sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com).

2. Create one or more key vaults and add secrets that extensions will use.

-->

There are different ways to create an Azure key vault. For example, you can use the Azure portal, Azure CLI, and more.

The easiest way is to use the Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](/azure/key-vault/secrets/quick-create-portal). 

For using other methods, see [Azure Key Vault Developer's Guide](/azure/key-vault/general/developers-guide#creating-and-managing-key-vaults).

### Provision the key reader application in your Azure AD tenant

Your Business Central online solution is configured to use an Azure AD application for reading key vault secrets. The application is called **Dynamics 365 Business Central ISV Key Vault Reader**. Microsoft manages the key vault reader application, however, there are a couple tasks that you have to do to enable it. First, the application must be provisioned on your Azure AD tenant, as described here.

To provision the key vault reader application, use the [Azure Active Directory PowerShell module](/powershell/module/azuread).

1. Open Windows PowerShell as an administrator.
2. Install the Azure Active Directory PowerShell module.

    ```powershell
    Install-Module AzureAD 
    ```
3. Import the Azure AD module.

    ```powershell
    Import-Module AzureAD 
    ```
4. Connect to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Azure AD tenant.

    1. Run the following command:

       ```powershell
       Connect-AzureAD 
       ```
    2. Provide your sign-in name and password when prompted.

4. Create an Azure AD service principal using the following command:
      
    ```powershell
    New-AzureADServicePrincipal -AppId 7e97dcfb-bcdd-426e-8f0a-96439602627a
    ```
    
    7e97dcfb-bcdd-426e-8f0a-96439602627a is the Application (client) ID of Microsoft's centralized Azure AD application.
    
    This step provisions the application in your Azure AD tenant, where it now "lives" together with your key vaults.

### Grant the key vault reader application permission to your key vaults

The next task is to grant the key vault reader application permission to read secrets from your key vaults. The steps in this task are done from the the [Azure portal](https://portal.azure.com).

1. Open the key vault in the portal.
2. Select **Access policies**, then **Add Access Policy**.
3. Set **Secret Permissions** to **Get**.
4. Select **Select principal**, and on the right, search for either the application (client) ID **7e97dcfb-bcdd-426e-8f0a-96439602627a** or the display name **Dynamics 365 Business Central ISV Key Vault Reader**. 
5. Select **Add**, then **Save**.

### Contact Microsoft to enable the App Key Vault feature

Send an email to TODO@microsoft.com to start the onboarding process. This should be done before you publish your updated extension to Partner Center.

The onboarding process involves a manual verification step that verifies that you own the AAD tenant that contains the key vaults. 

## Security considerations 

Keep the following information in mind when you use the App Key Vault feature. 

### Use NonDebuggable

As always when your code works with secrets, whether from a key vault or from Isolated Storage, remember to mark the methods as NonDebuggable. This prevents other partners from debugging into your code and seeing the secrets. 

### Don't pass the App Key Vault Secret Provider to untrusted code 

Once the App Key Vault Secret Provider codeunit has been initialized, it can be used to get secrets. If you pass the codeunit to another function, then that function can also use it. If you pass the codeunit to a function in another extension, then the other extension can also use the secret provider to get secrets. This may not be what you want, so be careful with who you pass the secret provider to. 

### Run with publisher validation 

In the on-premises steps above, you configured the NST to run with publisher validation disabled. You should only do this if you trust all extensions that get installed to not do malicious things like read secrets they are not supposed to. If you don't trust all extensions that might get installed, you should enable publisher validation. This is how the Business Central SaaS service is configured. 

When publisher validation is enabled, and an extension tries to initialize the App Key Vault Secret Provider codeunit, the following check will be performed: 

`Extension.KeyVaultUrls.AadTenantId == Extension.PublisherAadTenantId`

Only if this check is satisfied will the initialization succeed. 

So how does the NST know an extension publisher's AAD tenant ID? The value can be specified when publishing an extension, like this: 

Publish-NavApp … -PublisherAzureActiveDirectoryTenantId <guid> 

In SaaS, this value will always be empty for PTEs and dev extensions, and it will only be non-empty for App Source apps if they have been onboarded. 

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: The SAML2 token is not valid because its validity period has ended](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  