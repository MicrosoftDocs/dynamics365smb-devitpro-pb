---
title: "Register on-premises as an app in the Azure Management Portal"
description: Learn what to do when you want to use Business Central on-premises with online offerings.
author: jswymer
ms.author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.service: "dynamics365-business-central"
ms.topic: conceptual
---

# Registering Business Central On-Premises in Azure AD for Integrating with Other Services

> **APPLIES TO** [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online is automatically configured for integration with other online services.

This article describes how to set up [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises to use services that are based on Microsoft Azure. There are several services that you can integrate with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises, like Cortana Intelligence and Power BI. Before using the services, you have to register Business Central on-premises in Azure Active directory and give it access to the services. For example, the [Sales and Inventory Forecast](/dynamics365/business-central/ui-extensions-sales-forecast) extension requires that you specify an API key and API URI. Other services require similar information.

> [!NOTE]
> In [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version earlier than 16.4, the **Set up Azure Active Directory** wizard has an **Auto register** action. Previously, you could use this action to automatically register [!INCLUDE [prod_short](../developer/includes/prod_short.md)] in Azure AD. The auto-register functionality has since been removed. Now, you must register the application manually, regardless of your version. The wizard in earlier versions still includes the **Auto register** link. But the link now opens this article, which guides you through the manual registration.

## Prerequisites

- An Azure Active Directory (AD) tenant.

   You'll need a tenant on Azure AD that has at least one user. For more information, see [Quickstart: Set up a tenant](/azure/active-directory/develop/quickstart-create-new-tenant).

   If the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] deployment is using Azure AD authentication, then you already have a tenant with users. See [Authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).

   If your deployment uses NavUserPassword authentication, you'll need the credentials (sign in email and password) of a user account later in this article.

- An Azure portal account

    You'll need an account for accessing the Azure portal. In most cases, this account is the same as your Business Central account. You'll use this account to access Azure Active AD tenant via the Azure portal. The account must have application administrator permissions to create and manage app registrations.

## Register an application in Azure Active Directory

The first task is to use Azure portal to register an application for Business Central on your Azure AD tenant. As part of the registration, you'll also give the relevant services access to the application. The purpose of registration is to ensure [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises and the services know each other's Azure Active Directory (Azure AD) details.

> [!TIP]
> The following steps describe how to register a new application. However, if you're using Azure AD authentication, you already have a registered application for [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. So instead of registering a new application, you can use the existing application. But if you do, make sure you modify it based on the information in the steps that follow.

1. Sign in to the [Azure portal](https://portal.azure.com) and register an application for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises in Azure Active Directory tenant.

    1. Follow the general guidelines at [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

        When you add an application to an Azure AD tenant, you must specify the following information:

        |Setting|Description|
        |-------|-----------|
        |Name|Specify a name for your Business Central on-premises solution, such as *Business Central on-premises* or *Azure Services for Business Central on-premises*. |
        |Supported account types| Select <strong>Accounts in any organizational directory (Any Azure AD directory - Multitenant)</strong> |
        |Redirect URI|Set the first box to **Web** to specify a web application. Enter the URL for your Business Central on-premises browser client, followed by *OAuthLanding.htm*, for example: `https://MyServer/BC180/OAuthLanding` or `https://cronus.onmicrosoft.com/BC180/OAuthLanding.htm`. This file is used to manage the exchange of data between Business Central on-premises and other services through Azure AD.<br> <br>**Important:** The URL must match the URL of Web client, as it appears in the browser address. For example, even though the actual URL might be `https://MyServer:443/BC180/OAuthLanding`, the browser typically removes the port number `:443`.|

        When completed, an **Overview** displays in the portal for the new application.

    2. Copy the **Application (Client) ID** that was assigned the application and also redirect URL that you specified. You'll use this information later.

2. Create a client secret for the registered application.

    1. Follow the general guidelines at [Add credentials to your web application](/azure/active-directory/develop/quickstart-register-app#add-a-client-secret).

    2. Before you leave the **Certificates & secrets** page, copy the secret's value to a temporary location. The value isn't accessible once you leave the page. You'll use this key later in your client application code.

3. Grant the registered application delegated permission to access the required service APIs, like Power BI.

    Follow the general guidelines at [Add permissions to access web APIs](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-web-apis) for each service.

    Use the following table to help you set the minimum permissions:

    |Feature|API | Permission name|Type|Description|
    |----|----|----------------|----|-----------|
    |All|Microsoft Graph | User.Read|Delegated|Sign in and read user profile|
    |[Universal Print integration](/dynamics365/business-central/ui-specify-printer-selection-reports#set-up-universal-print)|Microsoft Graph |PrinterShare.ReadBasic.All|Delegated|Read basic information about printer shares. Required for using Universal Print printers.|
    |||PrintJob.Create|Delegated|Create print jobs. Required for using Universal Print printers|
    |||PrintJob.ReadBasic|Delegated|Read basic information of user's print jobs. Required for using Universal Print printers.|
    |[Power BI Integration](/dynamics365/business-central/admin-powerbi-setup)|Power BI Service|Report.Read.All|Delegated|View all reports. Required for viewing Power BI reports in Business Central.|

## Set up the registered application in Business Central

After you create the application registration, the next task is to configure the Business Central tenant to use it. You'll need the following information about the application registration: redirect URL, application (client) ID, and client secret. 

1. In the top-right corner, choose the ![Tell me](../developer/media/search-icon.png "Tell me what you want to do") icon, enter **Assisted Setup**, and then choose the related link.
2. Select **Set up Azure Active Directory**, then **Next**.

    The **Connect With Azure** page opens.
<!--
![Setting the Azure Active Directory](../developer/media/set-up-azure-ad.png)
-->
3. In the **Redirect URL** field, make sure the URL matches the redirect URL that's assigned the registered Business Central application in Azure AD.
4. In the **Application ID** field, specify the application (client) ID of the Business Central application in Azure AD that you copied in the previous task.
5. In the **Key** field, specify the value of the client secret that's used by the Business Central application in Azure AD.
6. Choose **Next**.

    If you're using NavUserPassword authentication, you're prompted to sign in to the Azure AD tenant. In this case, enter the sign-in email and password of a valid account.

Unless you see an error message, you're now done. The [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises solution is registered and ready to connect to services such as Cortana Intelligence, or embedding Power BI in [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

## Next step

The first time a feature that uses the registered application is accessed from [!INCLUDE [prod_short](../developer/includes/prod_short.md)], consent must be given to the Azure service. Consent can only be given by Azure admin user account. So, after you set up the registered the application in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], make the initial connection to these services and give consent. As an example, see [Connect to Power BI from Business Central- one time only](/dynamics365/business-central/across-working-with-powerbi#connect-to-power-bi-from-business-central--one-time-only).

## Fixing problems

This section provides solutions to problems that might occur.

### Sorry, but we're having trouble signing you in

When you try to connect, you get a message similar to the following text:  

**AADSTS50011: The reply URL specified in the request does not match the reply URLs configured for the application: '1111111-aaaa-2222-bbbb-333333333333'**

To fix this issue, verify that the **Reply URL** in the Setup Azure AD page is correct. It must match the Reply URL set on the registered app in Azure AD.

### Couldn't connect to service

After authorizing the Azure service, you get a message similar to the following text:  

**We couldn't connect to [service name] using your Azure AD application registration. Run the Set Up Azure Active Directory assisted setup again, and make sure all values are set correctly.**

This issue indicates there's a problem with the configuration of the Azure registered application used by the service. The problem is typically causes by incorrect values for either the **Redirect URL**, **Application ID**, or **Key** fields in the application registration. A common problem deals with the redirect URLs. Make sure the **Redirect URL** matches the redirect URL in the Azure portal and the URL of the Web client. To fix this issue, run the **Set Up Azure Active Directory** assisted setup and compare the values with the app registration in Azure.
 

## See Also
[Business Central and Power BI](/dynamics365/business-central/admin-powerbi)  
[FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](FAQ-Intelligent-Cloud.md)  
[Deployment of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../deployment/Deployment.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
