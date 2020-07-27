---
title: "Register on-premises as an app in the Azure Management Portal"
author: edupont04
ms.author: edupont
ms.custom: na
ms.date: 07/23/2020
ms.reviewer: na
ms.service: "dynamics365-business-central"
ms.topic: article
---
# Register Your On-Premises Deployment in the Azure Management Portal

If you want to use services that are based on Microsoft Azure, you must register your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises in the Azure Management Portal. For example, the [Sales and Inventory Forecast](ui-extensions-sales-forecast.md) extension requires that you specify an API key and API URI, and other services require similar information. So where do you find that information?

> [!IMPORTANT]
> This applies to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises, only. [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online is automatically configured for integration with other online services.

You can use the **Set Up Azure Active Directory** guide to extract the information you need to use services such as the Sales and Inventory Forecast extension, Power BI, Office 365, and so on. But you must register in the Azure Management Portal first, and to do that, you must be an administrator or superuser in [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

The point of the registration is that your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises and the service that you want to connect to must know the Azure Active Directory (Azure AD) details about each other.

<!--temporary notice-->
> [!NOTE]
> In earlier versions of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], an **Azure AD Application Setup Wizard** guide has an action to automatically register [!INCLUDE [prodshort](../developer/includes/prodshort.md)] in Azure AD. In the 16.4 update, this action is removed, and the guide is updated to make it easier to enter the information that you get manually from the Azure Management Portal.

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

## See Also

[FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](FAQ-Intelligent-Cloud.md)  
[Deployment of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/Deployment.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
