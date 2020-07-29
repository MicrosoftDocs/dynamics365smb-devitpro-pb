---
title: "Register on-premises as an app in the Azure Management Portal"
author: jswymer
ms.author: jswymer
ms.custom: na
ms.date: 07/23/2020
ms.reviewer: na
ms.service: "dynamics365-business-central"
ms.topic: article
ROBOTS: NOINDEX
---

# Registering Business Central On-Premises in Azure AD for Integrating with Other Services

> **APPLIES TO** [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises. [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online is automatically configured for integration with other online services.

This article describes how to set up [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises to use services that are based on Microsoft Azure. There are several services that you can integrate with [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises, like Cortana Intelligence and Power BI. Before using the services, you have to register Business Central on-premises in Azure Active directory and give it access to the services. For example, the [Sales and Inventory Forecast](https://docs.microsoft.com/dynamics365/business-central/ui-extensions-sales-forecast) extension requires that you specify an API key and API URI. Other services require similar information.

> [!NOTE]
> In earlier versions of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], an **Azure AD Application Setup Wizard** guide has an action to automatically register [!INCLUDE [prodshort](../developer/includes/prodshort.md)] in Azure AD. In the 16.4 update, this action is removed, and the guide is updated to make it easier to enter the information that you get manually from the Azure Management Portal.

## Prerequisites

- [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises is configured to use Azure Active Directory (AD) authentication.

    For more information, see [Authenticating [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md)
- An Azure AD account

    In most cases, this account is the same as your Business Central account. To complete the tasks in this article, you need access to the Azure Active AD tenant via the Azure portal.

## Register an application in Azure Active Directory

The first task is to use Azure portal to register an application for Business Central on your Azure AD tenant. As part of the registration, you'll also give the relevant services access to the application. The purpose of registration is to ensure [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises and the services to know each other's Azure Active Directory (Azure AD) details.

> [!TIP]
> The following steps describe how to register a new application. However, you already have a registered application for [!INCLUDE [prodshort](../developer/includes/prodshort.md)], because you're using Azure AD authentication. So instead of registering a new application, you can use the existing application. But if you do, make sure you modify it base on the information in the steps that follow. 

1. Sign in to the [Azure portal](https://portal.azure.com) and register an application for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises in Azure Active Directory tenant.

    1. Follow the general guidelines at [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

        When you add an application to an Azure AD tenant, you must specify the following information:
    
        |Setting|Description|
        |-------|-----------|
        |Name|Specify a name for your Business Central on-premises solution, such as *Business Central on-premises* or *Azure Services for Business Central on-premises*. |
        |Supported account types| Select <strong>Accounts in any organizational directory (Any Azure AD directory - Multitenant)</strong> |
        |Redirect URI|Set the first box to **Web** to specify a web application. Enter the URL for your Business Central on-premises browser client, followed by *OAuthLanding.htm*. For example, *https://MyServer:8080/BC160/OAuthLanding.htm*. This file is used to manage the exchange of data between Business Central on-premises and other services through Azure AD.|
    
        When completed, an **Overview** displays in the portal for the new application.

    2. Copy the **Application (Client) ID** that was assigned the application and also redirect URL that you specified. You'll use this information later.
2. Create a client secret for the registered application.

    1. Follow the general guidelines at [Add credentials to your web application](https://docs.microsoft.com/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-credentials-to-your-web-application).

    <!--
    1. From the application's **Overview** page, select **Certificates & secrets**, and then **New client secret**.
    2. Specify a description and expiration option.
    3. Select **Add** to generate the key.

    4. Copy the key value to a temporary location. You'll use this key later in your client application code. The key isn't accessible once you leave the  **Certificates & secrets** page.
    --> 

    2. Before you leave the **Certificates & secrets** page, copy the secret's value to a temporary location. The value isn't accessible once you leave the page. You'll use this key later in your client application code.

3. Grant the registered application delegated permission to access the required service APIs, like Power BI.

    Follow the general guidelines at [Add permissions to access web APIs](https://docs.microsoft.com/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-web-apis) for each service.

    Use the following table to help you set the minimum permissions:

    |API / Permission name|Type|Description|
    |---------------------|----|-----------|
    |Microsoft Graph / User.Read|Delegated|Sign in and read user profile|
    |Power BI Service / Report.Read.All|Delegated|View all reports|


<!--temporary notice-->


<!--
## To register Business Central on-premises in the Azure Management Portal

1. Log in to the Azure Management Portal at [https://portal.azure.com](https://portal.azure.com).
    If you are not familiar with the Azure Management Portal, you can find guidance in the [Azure documentation library](https://docs.microsoft.com/azure/).
2. In the left navigation pane, choose **More services**, and then choose **App registrations**.
3. In the top menu, choose **Add**, and then, in the **Create pane**, fill in the fields with the following information:
   - **Name**: Specify a name for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution, such as *Business Central on-premises*.
   - **Application Type**: Choose **Web app\* \/ API**.
   - **Sign-on URL**: Enter the URL for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] browser client, such as `https://MyServer:8080/BC160/WebClient/OAuthLanding.htm`.
       The OAuthLanding.htm file is a file that helps manage the exchange of data between [!INCLUDE [prodshort](../developer/includes/prodshort.md)] and other services through Azure AD.
4. Choose the **Create** button.
    This adds your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to the **App registrations pane**, so you can now add settings to it.
5. In the **App registrations list**, choose your new app. If this does not open the **Settings** pane, you should see an action to open **Settings**.
6. In the **Settings** pane, in the **API Access** section, choose **Keys**.
7. In the **Keys** pane, specify a description and when you want to let the key expire, and then choose **Save**.
8. Copy the generated key to a temporary location - you will need it in the next procedure.
9. In the **API Access** section, choose **Required Permissions**.
    - Add delegated permissions to view all reports to the Power BI Service
    - Add delegated permissions to Sign In and read user profile to Windows Azure Active Directory
    - Repeat for other services that you want to grant access to your Business Central on-premises solution
10. Close the **Settings** pane, and then, in the **Essentials** pane, copy the value of the **Application ID** to a temporary location.

You have now registered your Business Central on-premises solution in the Azure Management Portal, you have given access to the relevant services, and you have extracted the information that you need in [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

## To add the information to Business Central

1. In the top right corner, choose the ![Tell me](../developer/media/search-icon.png "Tell me what you want to do") icon, enter **Set Up Azure Active Directory**, and then choose the related link.
2. In the wizard, choose **Next**.  
3. In the **Client ID** field, specify the content that you copied from the **Application ID** field earlier.
4. In the **Secret Key** field, specify the content that you copied from the **Keys** pane earlier.
5. Choose **Next**. Unless you see an error message, you are now done.

Your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution is registered and ready to connect to services such as Cortana Intelligence, or embedding Power BI in [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

-->
## Set up the registered application in Business Central

After you've registered and configured the application in Azure AD, the next task is to configure the Business Central tenant to use the application. You'll need the the information about the application that you created in the previous task: redirect URL, application (client) ID, and client secret.

1. In the top-right corner, choose the ![Tell me](../developer/media/search-icon.png "Tell me what you want to do") icon, enter **Assisted Setup**, and then choose the related link.
2. Select **Set up Azure Active Directory**, then **Next**.

    The **Connect With Azure** page opens.

    ![Setting the Azure Active Directory](../developer/media/set-up-azure-ad.png)
3. In the **Redirect URL** field, make sure the URL matches the redirect URL that's assigned the registered Business Central application in Azure AD.
3. In the **Application ID** field, specify the application (client) ID of the Business Central application in Azure AD that you copied in the previous task.
4. In the **Key** field, specify the value of the client secret of the Business Central application in Azure AD that you copied in the previous task. 
5. Choose **Next**. Unless you see an error message, you're now done.

The [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution is registered and ready to connect to services such as Cortana Intelligence, or embedding Power BI in [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  


## See Also
[Enabling Your Business Data for Power BI](https://docs.microsoft.com/dynamics365/business-central/admin-powerbi)  
[FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](FAQ-Intelligent-Cloud.md)  
[Deployment of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/Deployment.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
