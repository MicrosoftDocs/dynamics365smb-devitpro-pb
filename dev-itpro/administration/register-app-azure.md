---
title: "Register on-premises as an app in the Azure Management Portal"
author: edupont04
ms.author: edupont
ms.custom: na
ms.date: 07/17/2020
ms.reviewer: na
ms.service: "dynamics365-business-central"
ms.topic: article
---
# Register Your On-Premises Deployment in the Azure Management Portal

If you want to use services that are based on Microsoft Azure, you must register your Business Central on-premises in the Azure Management Portal. For example, the [Sales and Inventory Forecast](ui-extensions-sales-forecast.md) extension requires that you specify an API key and API URI, and other services require similar information. So where do you find that information?

You can use the **Set Up Azure Management Portal** guide to register Business Central on-premises in the Azure Management Portal and extract the information you need to use services such as the Sales and Inventory Forecast extension, Power BI, Office 365, and so on. You must register in the Azure Management Portal only once, and you must be an administrator or superuser in Business Central on-premises.

The point of the registration is that Business Central on-premises and the service that you want to connect to must know the Azure Active Directory (Azure AD) details about each other.

## To register Business Central on-premises in the Azure Management Portal

1. Log in to the Azure Management Portal at [https://portal.azure.com](https://portal.azure.com).
    If you are not familiar with the Azure Management Portal, you can find guidance in the [Azure documentation library](https://docs.microsoft.com/azure/).
2. In the left navigation pane, choose **More services**, and then choose **App registrations**.
3. In the top menu, choose **Add**, and then, in the **Create pane**, fill in the fields with the following information:
   - **Name**: Specify a name for your Business Central on-premises solution, such as *Business Central on-premises*.
   - **Application Type**: Choose <strong>Web app* / API</strong>.
   - **Sign-on URL**: Enter the URL for your Business Central on-premises browser client, such as *https://MyServer:8080/BC16/WebClient/OAuthLanding.htm*.
       The OAuthLanding.htm file is a file that helps manage the exchange of data between Business Central on-premises and other services through Azure AD.
4. Choose the **Create** button.
    This adds your Business Central on-premises to the **App registrations pane**, so you can now add settings to it.
5. In the **App registrations list**, choose your new app. If this does not open the **Settings** pane, you should see an action to open **Settings**.
6. In the **Settings** pane, in the **API Access** section, choose **Keys**.
7. In the **Keys** pane, specify a description and when you want to let the key expire, and then choose **Save**.
8. Copy the generated key to a temporary location - you will need it in the next procedure.
9. In the **API Access** section, choose **Required Permissions**.
    - Add delegated permissions to view all reports to the Power BI Service
    - Add delegated permissions to Sign In and read user profile to Windows Azure Active Directory
    - Repeat for other services that you want to grant access to your Business Central on-premises
10. Close the **Settings** pane, and then, in the **Essentials** pane, copy the value of the **Application ID** to a temporary location.

You have now registered your Business Central on-premises in the Azure Management Portal, you have given access to the relevant services, and you have extracted the information that you need in Business Central on-premises.  

## To add the information to Business Central on-premises

1. In the top right corner, choose the **Search for Page or Report** icon, enter **Azure AD Application Setup Wizard**, and then choose the related link.
2. In the wizard, choose **Next**.
3. In the **Client ID** field, specify the content that you copied from the **Application ID** field earlier.
4. In the **Secret Key** field, specify the content that you copied from the **Keys** pane earlier.
5. Choose **Next**. Unless you see an error message, you are now done.

Your Business Central on-premises is registered and ready to connect to services such as Cortana Intelligence and Power BI.

## See Also

[FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](FAQ-Intelligent-Cloud.md)  
[Deployment of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/Deployment.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
