---
title: Setting up App Key Vaults for Business Central
description: Describes how to use an Azure Key vault with Business Central extensions for online.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

AppSource apps for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] can be developed to get secrets from Azure Keys Vaults. The app key vault feature is readily available for use on the service by all App Source apps. However, there are some onboarding tasks required. 

## Create the Azure Key Vault with secrets

In this task, you create a key vault in Azure, and add the secrets that you want to make available to your extensions. An extension can use up to two key vaults, so you can create more than one.
<!--

1. Get an Azure subscription.

    Sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com).

2. Create one or more key vaults and add secrets that extensions will use.

-->

There are different ways to create an Azure key vault. For example, you can use the Azure portal, Azure CLI, and more.

The easiest way is to use the Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](/azure/key-vault/secrets/quick-create-portal). 

For using other methods, see [Azure Key Vault Developer's Guide](/azure/key-vault/general/developers-guide#creating-and-managing-key-vaults).

## Provision the key reader application in your Azure AD tenant

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

## Grant the key vault reader application permission to your key vaults

The next task is to grant the key vault reader application permission to read secrets from your key vaults. The steps in this task are done from the [Azure portal](https://portal.azure.com).

1. Open the key vault in the portal.
2. Select **Access policies**, then **Add Access Policy**.
3. Set **Secret Permissions** to **Get**.
4. Choose **Select principal**, and on the right, search for either the application (client) ID **7e97dcfb-bcdd-426e-8f0a-96439602627a** or the display name **Dynamics 365 Business Central ISV Key Vault Reader**. 
5. Select **Add**, then **Save**.

## Contact Microsoft to enable the App Key Vault feature

Send an email to [bcappkeyvaultonboard@microsoft.com](mailto:bcappkeyvaultonboard@microsoft.com) to start the onboarding process. Do this step before you publish your updated extension to Partner Center.

The onboarding process involves a manual verification step that verifies that you own the AAD tenant that contains the key vaults. 

## See Also  

[Security Considerations With App Key Vaults](../developer/devenv-app-key-vault.md#security)  
[Monitoring and Troubleshooting App Key Vaults](../developer/devenv-app-key-vault.md#troubleshooting)  
[Configuring Business Central Server](configure-server-instance.md)  