---
title: Azure Key Vaults with Business Central
description: Describes how to use an Azure Key vault with Business Central extensions.
ms.custom: na
ms.date: 07/08/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Using App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions

Some [!INCLUDE[prodshort](../developer/includes/prodshort.md)] extensions make web service calls to non-[!INCLUDE[prodshort](../developer/includes/prodshort.md)] services. For example, one extension might call Azure Storage to read/write blobs. Another extension might call the extension publisher's web service to do an operation. 

These web service calls are typically authenticated, which means the extension must provide a credential in the call. The credentials enable the other service to accept or reject the call. You can consider the credentials as a kind of secret to the extension. A secret shouldn't be leaked to customers, partners, or anybody else. So where can the extension get the secret from? Here is where Azure Key Vaults is used. Azure Key Vault is a cloud service that works as a secure secrets store. It provides centralized storage for secrets, enabling you to control access and distribution of the secrets.

## Getting started

Getting extensions to use secrets from Azure Key Vault involves two areas of work:

### Setting up and configuring Azure Key Vaults

An extension can retrieve secrets from one or two different Azure Key Vaults. These key vaults must be created in Azure, and the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service configured to access key vaults. The setup process is different for online and on-premises. For more information, see:

- [Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online](setup-app-key-vault.md)
- [Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises](setup-app-key-vault-onprem.md)

### Developing the extensions to use secrets from Azure Key Vault

Once you have an Azure Key Vault, you can develop [!INCLUDE[prodshort](../developer/includes/prodshort.md)] extensions to retrieve secrets from the key vault. In short, this work involves specifying the key vault's URL and adding code to retrieve a secret from the key vault.

For more information, see [Using App Key Vaults with Extensions](developer/devenv-app-key-vault.md).


<!--
## Specify the Azure Key Vault in extensions

You specify the key vaults for an extension in the extension's manifest file (app.json). To specify a key vault, you add the `"keyVaultUrls"` to the app.json, and set the value to the key vault's URL. The following code snippet .: , like this: 

```
    "keyVaultUrls": [ 
        "https://mykeyvault.vault.azure.net" 
    ] 
```

You can specify up to two key vaults in the app.json, as shown in the following code snippet: 

``` 
    "keyVaultUrls": [ 
        "https://myfirstkeyvault.vault.azure.net", 
        "https://mysecondkeyvault.vault.azure.net" 
    ] 
```

Specifying two key vaults ensures a higher availability of secrets. At runtime, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform will iterate both key vaults until the secret is successfully retrieved. If one of the key vaults is unavailable for any reason, the extension will continue to execute because the other key vault will most likely be available.


## Add code to retrieve secrets the key vault

Next, you add code to the extension for reads secrets from the key vault at runtime. To read secrets, you use the **Secrets** module of the System Application, specifically codeunit **3800 "App Key Vault Secret Provider"**. 

, like this. The system  

```
page 50100 HelloWorldPage
{
    var
        SecretProvider: Codeunit "App Key Vault Secret Provider";
        SecretValue: Text;

    trigger OnOpenPage();
    begin
        if SecretProvider.TryInitializeFromCurrentApp() then begin
            if SecretProvider.GetSecret('<nameofsecret>', SecretValue) then
                Message('Retrieved secret: ' + SecretValue)
            else
                Message('Failed to retrieve secret')
        end
        else
            Message('ERROR: ' + GetLastErrorText());
    end;
}

```

The call to the `TryInitializeFromCurrentApp` method determines the extension that is currently being executed, then determines the extension's key vaults as specified in the extension manifest. After initialization, you can call the `GetSecret` method to read secrets from the key vault.



## Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises 

Follow the tasks in this section to configure an on-premises installation to use the Azure Key Vault feature. 

### Prerequisites

- An Azure subscription with an Active Directory tenant.

    You sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com). For information about getting an Azure AD tenant, see [How to get an Azure Active Directory tenant](/azure/active-directory/develop/active-directory-howto-tenant).

- A security certificate

    As part of the setup later on, you'll have to register and configure an application in Azure AD for reading key vault, which requires the use of a certificate. The certificate is used to prove the application's identity when requesting upon request. In a production environment, obtain a certificate from a certification authority or trusted provider. 

    In a test environment, if you don't have a certificate, then you can create your own self-signed certificate. For example, on your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server computer, start Windows PowerShell as an administrator. Then at the prompt, run the following commands, one at a time:
        
    ```powershell
    $cert = New-SelfSignedCertificate -Subject "BusinessCentralKeyVaultReader" -Provider "Microsoft Strong Cryptographic Provider"
    ```

    ```powershell
    $cert.Thumbprint
    ```

    ```powershell
    Export-Certificate -Cert $cert -FilePath c:\certs\BusinessCentralKeyVaultReader.cer
    ```

    These commands add a certificate called BusinessCentralKeyVaultReader to the computer's **LocalMachine** > **Personal (My)** certificate store.

### Create the Azure Key Vault with secrets

Now, you create one or more key vaults in Azure, and add the secrets that you want to make available to your extensions. This step requires an Azure subscription. Because your solution is using Azure AD authentication, you should already have one.

<!--

1. Get an Azure subscription.

    Sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com).

2. Create one or more key vaults and add secrets that extensions will use.

-->
<!--
There are different ways to create an Azure key vault. For example, you can use the Azure portal, Azure CLI, and more.

The easiest way is to use the Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal). 

For using other methods, see [Azure Key Vault Developer's Guide](/azure/key-vault/general/developers-guide#creating-and-managing-key-vaults).

### Register a key vault reader application in Azure AD

Next, register an application on your Azure AD tenant for reading secrets from the key vaults. When Azure AD authentication was set up, an Azure AD tenant was created in Azure. Reading key vaults requires a separate application registration with the Azure AD tenant. You can use an existing application if you have one.

The steps in this task are done from the the [Azure portal](https://portal.azure.com).

1. Sign-in to Azure portal at [portal.azure.com](http://portal.azure.com) and set the portal to your Azure Active Directory tenant.
2. Register an Azure AD application for the reading key vault.

    You add the new application by using the [Azure portal](https://portal.azure.com). For guidelines, see [Register your application with your Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app).
    
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

<!--    When completed, the **Overview** displays in the portal for the new application.

    Make a note of the **Display name** and/or **Application (client) ID**. You will use this information later.

2. Upload the security certificate to the registered application.

    In this step, you upload the certificate file that you obtained as part of the prerequisites.

    From the key vault reader application overview page, select **Certificates & secrets**, **Upload certificate**, and follow instructions to locate and upload the certificate.

### Grant the key vault reader application permission to key vaults

In this task, you grant the key vault reader application permission to read secrets from your key vaults.

The steps in this task are done from the the [Azure portal](https://portal.azure.com).

1. Open the key vault in the portal.
2. Select **Access policies**, then **Add Access Policy**.
3. Set **Secret Permissions** to **Get**.
4. Select **Select principal**, and on the right, search for either **Application (client) ID** or display name for the key vault reader application. 
5. Select **Add**.
6. Select **Save**.

At this point, the work in Azure is finished.

### Configure the Business Central Server for the Apps Key Vault

Next, you configure the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] instance to use the key vault reader application and its certificate, which you registered in Azure AD, for authenticating to the key vaults.

1. If not already done, import your key vault certificate to the local certificate store for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] server computer.

    1. You can import the certificate either using the [MMC snap-in](/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in) or [Import-Certificate cmdlet](/powershell/module/pkiclient/import-certificate) from a Windows PowerShell prompt.

      For example, the following PowerShell command installs a certificate to the local machine's personal store: 
    
        ```powershell
        Import-Certificate -FilePath "C:\certificates\BusinessCentralKeyVaultReader.cer" -CertStoreLocation Cert:\LocalMachine\My
        ```

2. Give the service account used by the [!INCLUDE[server](../developer/includes/server.md) instance permission to access the certificates private key.

    To do this using the MMC:

    1.  Open the MMC snap-in for certificates. See [How to: View Certificates with the MMC Snap-in](https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).
    
    2. Expand the **Certificates \(Local Computer\)** node, expand the **Personal** node, and then select the **Certificates** subfolder.  
      
    3.  In the right pane, right-click the certificate, select **All Tasks**, and then choose **Manage Private Keys**.  
      
    4.  In the **Permissions** dialog box for the certificate, choose **Add**.  
      
    5.  In the **Select Users, Computers, Service Accounts, or Groups** dialog box, enter the name of the dedicated domain user account that is associated with [!INCLUDE[server](../developer/includes/server.md)], and then choose the **OK** button.  
      
    6.  In the **Full Control** field, select **Allow**, and then choose the **OK** button.  

3. Make a note of the certificate thumbprint because you'll need it in the next step. See [How to: Retrieve the Thumbprint of a Certificate](/dotnet/framework/wcf/feature-details/how-to-retrieve-the-thumbprint-of-a-certificate).

4. Configure the [!INCLUDE[server](../developer/includes/server.md) instance.

    Now, you'll configure App Key Vault settings on the server instance. The following table describes the settings that you must configure to enable Azure key vault on the server instance:
     
    |Admin Tool Setting|Key name for  CustomSetting.config|Value|Example|
    |--------|-------------------------------|-----|-------|
    |Client Certificate Store Location|AzureKeyVaultClientCertificateStoreLocation|Set to the certificate store location where key vault certificate was stored.|LocalMachine|
    |Client Certificate Store Name|AzureKeyVaultClientCertificateStoreName|Set to the certificate store name where key vault certificate was stored.|MY|
    |Client Certificate Thumbprint|AzureKeyVaultClientCertificateThumbprint|Set to the thumbprint for the key vault certificate.|649419e4fbb87340f5a0f995e605b74c5f6d943e|
    |Client ID|AzureKeyVaultClientId|Set to the **Application (client) ID** of the key vault reader application registered in your Azure AD tenant. |ed4129d9-b913-4514-83db-82e305163bec|
    |Enable Publisher Validation|AzureKeyVaultAppSecretsPublisherValidationEnabled| Specifies whether extensions can only use key vaults that belong to their publishers. An extension publisher's identity is specified when the extension is published. Enabling this setting blocks attempts in AL to read secrets from another publisher's key vault.|false|

    You can configure the instance using the [[!INCLUDE[admintool](../developer/includes/admintool.md)](administration-tool.md) or [Set-NAVServerConfiguration cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).
      
    For example, to use the Set-NAVServerConfiguration cmdlet, start the [[!INCLUDE[admintool](../developer/includes/admintool.md)] as an administrator, and run the following commands one at a time. Substitute brackets with your own values.

    ```powershell
    Import-Module Microsoft.Dynamics.Nav.Management.dll 
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientCertificateStoreLocation -KeyValue <certificate store location>    
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientCertificateStoreName -KeyValue <certifcate store>    
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientCertificateThumbprint -KeyValue <certificate thumbprint> 
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientId -KeyValue <application ID of key vault reader app in Azure> 
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultAppSecretsPublisherValidationEnabled -KeyValue false 
    Restart-NAVServerInstance -ServerInstance <serverInstance> 
    ```

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

<!--There are different ways to create an Azure key vault. For example, you can use the Azure portal, Azure CLI, and more.

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
    
    `7e97dcfb-bcdd-426e-8f0a-96439602627a` is the Application (client) ID of Microsoft's centralized Azure AD application.
    
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
-->


## See Also  

[Security Considerations With App Key Vaults](../developer/devenv-app-key-vault.md#security)  
[Monitoring and Troubleshooting App Key Vaults](../developer/devenv-app-key-vault.md#troubleshooting)  
[Configuring Business Central Server](configure-server-instance.md)  