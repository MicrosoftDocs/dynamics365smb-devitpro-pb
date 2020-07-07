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
# Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises 

For authentication purposes, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] extensions can be developed to get for secrets from Azure Keys Vaults. This article describes the tasks required to set up Azure Keys Vaults for storing extension secrets and configure them in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment.

For more information about developing extensions and key vaults, see [Using App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions](extension-keyvaults).

## Prerequisites

- An Azure subscription with an Active Directory tenant.

    You sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com). For information about getting an Azure AD tenant, see [How to get an Azure Active Directory tenant](/azure/active-directory/develop/active-directory-howto-tenant).

- A security certificate

    As part of the setup later on, you'll have to register and configure an application in Azure AD for reading key vaults, which requires the use of a certificate. The certificate is used to prove the application's identity when requesting upon request. In a production environment, obtain a certificate from a certification authority or trusted provider. 

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

## Create the Azure Key Vault with secrets

Now, you create one or more key vaults in Azure, and add the secrets that you want to make available to your extensions. This step requires an Azure subscription. Because your solution is using Azure AD authentication, you should already have one.

<!--

1. Get an Azure subscription.

    Sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com).

2. Create one or more key vaults and add secrets that extensions will use.

-->

There are different ways to create an Azure key vault. For example, you can use the Azure portal, Azure CLI, and more.

- The easiest way is to use the Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal).

    After you create the key vault, add the secrets. 

- For using other methods, see [Azure Key Vault Developer's Guide](/azure/key-vault/general/developers-guide#creating-and-managing-key-vaults).

## Register a key vault reader application in Azure AD

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
    When completed, the **Overview** displays in the portal for the new application.

    Copt the **Display name** and/or **Application (client) ID**. You will use this information later.

2. Upload the security certificate to the registered application.

    In this step, you upload the certificate file that you obtained as part of the prerequisites.

    From the key vault reader application overview page, select **Certificates & secrets**, **Upload certificate**, and follow instructions to locate and upload the certificate.

## Grant the key vault reader application permission to key vaults

In this task, you grant the key vault reader application permission to read secrets from your key vaults.

The steps in this task are done from the the [Azure portal](https://portal.azure.com).

1. Open the key vault in the portal.
2. Select **Access policies**, then **Add Access Policy**.
3. Set **Secret Permissions** to **Get**.
4. Select **Select principal**, and on the right, search for either **Application (client) ID** or display name for the key vault reader application. 
5. Select **Add**.
6. Select **Save**.

At this point, the work in Azure is finished.

## Configure the Business Central Server for the Apps Key Vault

Next, you configure the [!INCLUDE[server](../developer/includes/server.md)] instance to use the key vault reader application and its certificate, which you registered in Azure AD, for authenticating to the key vaults.

To complete this task, you'll need the user name of the service account that runs the [!INCLUDE[server](../developer/includes/server.md)].

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
      
    4.  In the **Security** dialog box, choose **Add**.  
      
    5.  In the **Select Users, Computers, Service Accounts, or Groups** dialog box, enter the name of the dedicated domain user account that is associated with [!INCLUDE[server](../developer/includes/server.md)], for example, NETWORK SERVICE. Then, choose the **OK** button.  
      
    6.  In the **Full Control** field, select **Allow**, and then choose the **OK** button.  

3. Make a note of the certificate thumbprint because you'll need it in the next step. See [How to: Retrieve the Thumbprint of a Certificate](/dotnet/framework/wcf/feature-details/how-to-retrieve-the-thumbprint-of-a-certificate).

4. Configure the [!INCLUDE[server](../developer/includes/server.md) instance.

    Now, you'll configure App Key Vault settings on the server instance. The following table describes the settings that you must configure to enable Azure key vault on the server instance:
     
    |Setting<br />(key name)|Value|Example|
    |--------|-------------------------------|-----|-------|
    |Client Certificate Store Location<br />(AzureKeyVaultClientCertificateStoreLocation)|Set to the certificate store location where key vault certificate was stored.|LocalMachine|
    |Client Certificate Store Name<br />(AzureKeyVaultClientCertificateStoreName)|Set to the certificate store name where key vault certificate was stored.|MY|
    |Client Certificate Thumbprint<br />(AzureKeyVaultClientCertificateThumbprint)|Set to the thumbprint for the key vault certificate.|649419e4fbb87340f5a0f995e605b74c5f6d943e|
    |Client ID<br />(AzureKeyVaultClientId)|Set to the **Application (client) ID** of the key vault reader application registered in your Azure AD tenant. |ed4129d9-b913-4514-83db-82e305163bec|
    |Enable Publisher Validation<br />(AzureKeyVaultAppSecretsPublisherValidationEnabled)|Specifies whether extensions can only use key vaults that belong to their publishers. An extension publisher's identity is specified when the extension is published. Enabling this setting blocks attempts in AL to read secrets from another publisher's key vault.<br /><br />**Important** If not enabled (`false`), the server instance won't do any additional validation to ensure extensions have the right to read secrets from the key vaults that they specify. This condition implies some risk of unauthorized access to key vaults that you should be aware of. For more information, see [App Key Vaults - Security considerations](extension-key-vault.md#security). |false|

    You can configure the instance using the [[!INCLUDE[admintool](../developer/includes/admintool.md)](administration-tool.md) or [Set-NAVServerConfiguration cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).
      
    For example, to use the Set-NAVServerConfiguration cmdlet, start the [[!INCLUDE[admintool](../developer/includes/admintool.md)] as an administrator, and run the following commands one at a time. Substitute brackets with your own values. 

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientCertificateStoreLocation -KeyValue <certificate store location>    
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientCertificateStoreName -KeyValue <certifcate store>    
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientCertificateThumbprint -KeyValue <certificate thumbprint> 
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultClientId -KeyValue <application ID of key vault reader app in Azure> 
    Set-NAVServerConfiguration -ServerInstance <serverInstance> -KeyName AzureKeyVaultAppSecretsPublisherValidationEnabled -KeyValue false 
    Restart-NAVServerInstance -ServerInstance <serverInstance> 
    ```

<!--
    > [!IMPORTANT]
    > Setting the `AzureKeyVaultAppSecretsPublisherValidationEnabled` to false means the server instance won't do any additional validation to ensure extensions have the right to read secrets from the key vaults that they specify. This condition implies some risk of unauthorized access to key vaults that you should be aware of. Please see the "Security considerations" section below for more details.
-->

At this point, you can run your extensions that use key vault secrets to read secrets from key vault. For troubleshooting, please look in the Event Log and configure App Insights telemetry.


## Monitoring and Troubleshooting

Extensions 

The initialization failures provide information about problems with the set up of the App Key Vault. 

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Configuring Business Central Server](configure-server-instance.md)  