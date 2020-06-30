---
title: User Authentication with Azure AD for Single Sign-on
description: Associate an existing Microsoft account with user account to achieve single sign-on between the Web client and Office 365.
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

## Setting up Azure Key Vault for on-prem installations 

Follow these steps to configure a local installation to use the App Key Vault feature. 

### Prerequisite

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
    >

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

### Register an application for reading from key vaults

Next, register a new application on your Azure AD tenant for reading secrets from the key vaults.

When Azure AD authentication was set up, an Azure AD tenant was created in Azure. Reading key vaults requires a separate application registration with the Azure AD tenant.

There are a couple steps involved in this task. The steps in this task are done from the the [Azure portal](https://portal.azure.com).Certificates & secrets


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

2. Upload the security certificate to the registered application.

    In this step, you upload the certificate file that you obtained as part of the prerequisites.

    From the registered applications overview page, select **Certificates & secrets** > **Upload certificate**, and follow instructions. 


In the Azure portal, create one or two Key Vaults in your Azure subscription. 

Add the secrets to the key vault(s), which you want to make available to your extension. 

 

Access the secrets in the key vaults from your extension 

Specify the key vaults in the extension manifest as illustrated above. 

Access the secrets in the AL code as illustrated above. 

 

If you execute the AL code at this point, it will fail to access the secrets, and the reason is that the key vaults haven't granted anybody permission to read secrets in the key vaults. This must be done using the Access Policies on the key vaults. Specifically, we must grant an AAD application permission to read secrets from the key vaults. 

 

Create an AAD application 

In the Azure portal, register a new AAD application by following these steps: 

Open the Azure Active Directory blade 

Click "App registrations" 

Click "New registration" 

Give a name such as "Business Central Key Vault Reader" 

Click "Register" 
s
Make a note of the "Application (client) ID" guid. 

Click "Certificates & secrets" 

We need to add a certificate here - see next step 

 

Register a certificate on the AAD application 

Obtain a certificate as you normally obtain certificates. 

 

You can also generate a self-signed certificate, for example using the following commands: 

Generate a new self-signed certificate: 

$cert = New-SelfSignedCertificate -Subject "BusinessCentralKeyVaultReader" -Provider "Microsoft Strong Cryptographic Provider" 

The generated certificate will be placed in the LocalMachine\My certificate store. 

You can print the certificate's thumbprint (you will need it later) using this command: 

$cert.Thumbprint 

Next, export the certificate to a .cer file: 

Export-Certificate -Cert $cert -FilePath BusinessCentralKeyVaultReader.cer 

 

Go back to the Azure portal, locate the AAD application, and click on the "Certificates & secrets" page. Upload the .cer file. 

 

Grant the AAD application permission to read secrets from the key vaults 

In the Azure portal, locate the key vaults again, and perform the following steps for each of them: 

Click "Access policies" 

Click "Add Access Policy" 

Select "Secret permission": "Get" 

Click "Select principal" and search for the AAD application above, either using its application/client ID or using its name 

Click "Select" 

Click "Add" 

Click "Save" 

 

Configure the NST 

Finally, it's time to configure the NST to use the AAD application and its certificate when authenticating to the key vaults. This is done by setting the following values: 

 

AzureKeyVaultClientCertificateStoreLocation        

LocalMachine 

AzureKeyVaultClientCertificateStoreName            

My 

AzureKeyVaultClientCertificateThumbprint           

<the thumbprint that you printed above> 

AzureKeyVaultClientId                              

<the application/client ID from the Azure portal> 

AzureKeyVaultAppSecretsPublisherValidationEnabled  

false 

 

Caution: Setting the AzureKeyVaultAppSecretsPublisherValidationEnabled to false means the NST will not perform any additional validation that the extension has the right to read secrets from the key vaults that it specified. This implies some risk of unauthorized access to key vaults that you should be aware of. Please see the "Security considerations" section below for more details. 

 

At this point, you can run your extension and read secrets from key vault. For troubleshooting, please look in the Event Log and configure App Insights telemetry. 

 

 

Instructions for SaaS 

In Business Central SaaS, the App Key Vault feature is available for all App Source apps, however, there are onboarding steps. 

 

Note: Why isn't the App Key Vault feature available for PTEs (Per-Tenant Extensions) and developer extensions in SaaS? For security reasons. Since the Business Central SaaS service has permission to access key vaults from different ISVs, it needs a way to determine if a given extension has the right to access the key vaults that it specifies in the extension manifest. And since the Business Central SaaS service has no way of verifying who authored a given PTE or developer extension, it also cannot restrict access to only the author's key vaults. 

 

Some steps are the same as for on-premises installations. You need to create one or two key vaults, and you need to adjust your extension manifest and AL code to read from these key vaults. 

 

Grant a Business Central SaaS AAD application permission to read secrets from your key vaults 

When Business Central runs in SaaS, it is configured to use an AAD application that Microsoft manages, and this AAD application needs permission to read secrets from your key vaults. Perform these steps to grant it access: 

Install-Module AzureAD 

Import-Module AzureAD 

Connect-AzureAD 

New-Azureadserviceprincipal 

New-AzureADServicePrincipal -AppId 7e97dcfb-bcdd-426e-8f0a-96439602627a 

These step provision Microsoft's centralized AAD application into your AAD tenant, where it now "lives" together with your key vaults. 

The next step is to grant the AAD application permissions to your key vaults. 

Please follow the same steps as for on-premises installations, as described under "Grant the AAD application permission to read secrets from the key vaults". 

 

Contact Microsoft to enable the App Key Vault feature for your App Source app 

Please send an email to TODO@microsoft.com to start the onboarding process. This should be done before you publish your updated extension to Partner Center. 

 

The onboarding process involves a manual verification step that verifies that you own the AAD tenant that contains the key vaults. 

 

 

Security considerations 

Please keep the following in mind when you use the App Key Vault feature. 

 

Use NonDebuggable 

As always when your code works with secrets, whether from a key vault or from Isolated Storage, remember to mark the functions as NonDebuggable. This prevents other partners from debugging into your code and seeing the secrets. 

 

Don't pass the App Key Vault Secret Provider to untrusted code 

Once the App Key Vault Secret Provider codeunit has been initialized, it can be used to get secrets. If you pass the codeunit to another function, then that function can also use it. If you pass the codeunit to a function in another extension, then the other extension can also use the secret provider to get secrets. This may not be what you want, so be careful with who you pass the secret provider to. 

 

Run with publisher validation 

In the on-premises steps above, you configured the NST to run with publisher validation disabled. You should only do this if you trust all extensions that get installed to not do malicious things like read secrets they are not supposed to. If you don't trust all extensions that might get installed, you should enable publisher validation. This is how the Business Central SaaS service is configured. 

 

When publisher validation is enabled, and an extension tries to initialize the App Key Vault Secret Provider codeunit, the following check will be performed: 

Extension.KeyVaultUrls.AadTenantId == Extension.PublisherAadTenantId 

Only if this check is satisfied will the initialization succeed. 

How does the NST know an extension publisher's AAD tenant ID? The value can be specified when publishing an extension, like this: 

Publish-NavApp … -PublisherAzureActiveDirectoryTenantId <guid> 

In SaaS, this value will always be empty for PTEs and dev extensions, and it will only be non-empty for App Source apps if they have been onboarded. 

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: The SAML2 token is not valid because its validity period has ended](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  