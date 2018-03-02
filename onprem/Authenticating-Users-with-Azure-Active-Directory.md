---
title: User Authentication with Azure AD
description: Associate an existing Microsoft account with Dynamics NAV user account to achieve single sign-on between the Web client and Office 365.
ms.custom: na
ms.date: 10/17/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Authenticating Dynamics NAV Users with Azure Active Directory
Azure Active Directory \(Azure AD\) is a cloud service that provides identity and access capabilities, such as for applications on Microsoft Azure, Microsoft Office 365, and for applications that install on-premises. If the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured to use the AccessControlService credential type, you can associate the [!INCLUDE[navnow](includes/navnow_md.md)] user accounts with Azure AD accounts that users use to access the [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_windows](includes/nav_windows_md.md)], Office 365, and SharePoint.  

 For example, your users access a website, such as a SharePoint site. From there, they have single sign-on access to [!INCLUDE[navnow](includes/navnow_md.md)] because you have configured [!INCLUDE[navnow](includes/navnow_md.md)] for Azure AD.  

## Azure AD and [!INCLUDE[navnow](includes/navnow_md.md)]  
 You can use the Azure AD service to associate your existing Microsoft account with your [!INCLUDE[navnow](includes/navnow_md.md)] user account and achieve single sign-on between the [!INCLUDE[nav_web](includes/nav_web_md.md)] and Office 365. Also, if you use [!INCLUDE[navnow](includes/navnow_md.md)] in an app for SharePoint, you can use Azure AD to achieve single sign-on between the [!INCLUDE[nav_web](includes/nav_web_md.md)] and SharePoint. You can still host the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]on-premises. You do not have to deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Azure to use Azure AD for user authentication.

 The following sections describe the tasks involved in setting up Azure AD authentication for authenticating [!INCLUDE[navnow](includes/navnow_md.md)] users.

## Create an Azure AD Tenant  
 If you have an Office 365 subscription that is based on a domain such as *solutions.onmicrosoft.com*, you are already using Azure AD because the user accounts are based on Azure AD. Then, if you add the email addresses for those user accounts to the user accounts in [!INCLUDE[navnow](includes/navnow_md.md)], the users experience seamless integration between your SharePoint site and the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 If you want to sign up for an Office 365 plan, you can use a plan such as Office 365 Enterprise E1 as your test site, or sign up for a trial developer plan. A trial plan includes an administrative account which you will use to access the Azure management portal. For example, if your Office 365 site is *Solutions.onmicrosoft.com*, your administrative account can be *admin@solutions.onmicrosoft.com*. For more information, see [Select an Office 365 plan for business](http://go.microsoft.com/fwlink/?LinkId=309050).  

 Alternatively, you can sign up for an Azure subscription that is not associated with an Office 365 subscription. You can sign up in the Azure management portal at [http://manage.windowsazure.com](http://manage.windowsazure.com). Then, you can configure an Active Directory, which creates an Azure AD tenant. For more information, see [Administering your Azure AD tenant](http://go.microsoft.com/fwlink/?LinkId=317423).  

 When you create a directory in the Azure management portal, you must specify a domain name that identifies your Azure AD tenant, such as *solutions.onmicrosoft.com* or *CRONUSInternationLtd.onmicrosoft.com*. You will use the domain name when you add users to your Azure AD.  

 When you have created the Azure AD tenant, you must add users. For more information, see [Add new users or users with Microsoft accounts to Azure Active Directory](http://go.microsoft.com/fwlink/?LinkId=317435). 

## Add an Application for [!INCLUDE[navnow](includes/navnow_md.md)] to the Azure AD Tenant  
 You must register your [!INCLUDE[navnow](includes/navnow_md.md)] solution as an application in Azure AD tenant. Then, you can choose to make it available to other Azure AD tenants.  

 You can add the Azure AD application by using the [Azure portal](http://go.microsoft.com/fwlink/?LinkID=317944). For more specific guidelines about how to use the Azure portal, see [Register your application with your Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration). When you add an application to an Azure AD tenant, you must specify the following information.

|Setting/option|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|-----------------|---------------------------------|---------------------------------------|
|Name|The name of your application as it will display to your users, such as **Financial App by Solutions**.|
|Type|Choose **Web application and/or web app**.|
|Sign-on URL (App URL)|The URI for signing on to the [!INCLUDE[nav_web](includes/nav_web_md.md)], such as ```https://CRONUSInternationLtd.onmicrosoft.com/DynamicsNAV``` or ```https://CRONUSInternationLtd.onmicrosoft.com/DynamicsNAV/WebClient/``` (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).|
|App ID URI|The URI to a domain in your Azure AD tenant, such as **https://CRONUSInternationLtd.onmicrosoft.com/Financials**. <BR /><BR />**Important:**  The App ID URI must be unique within the Azure AD tenant. However, if you want to share your [!INCLUDE[navnow](includes/navnow_md.md)] solution with other Azure AD tenants, the App ID URI must be unique in Azure AD. <br /><br /> This URI is appended to the **WS-Federation Login Endpoint** setting in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration and **ACSURI** setting in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] configuration. Additionally, in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration, it must be specified in the **Azure AD App ID URI** setting for SOAP and OData web services.|
|Directory Access|Choose **Single Sign-On**.|
|Reply URL|Add a reply URL for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The reply URL for the [!INCLUDE[nav_web](includes/nav_web_md.md)] is the same as the Sign-on URL. The reply URL for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is the URL for opening the client, such as ```https://dynamicsnavwinclient/```.|

Your [!INCLUDE[navnow](includes/navnow_md.md)] solution is now registered in your Azure AD tenant. To enable single sign-on with Azure AD, you must copy the App ID URI and the federation metadata document URL to a document of your choice for future reference. Both values are available in the overview page for the application in Azure management portal, and you will use them to configure your [!INCLUDE[nav_server](includes/nav_server_md.md)] instances.  

Next, you must configure the application to be externally available. Also, you can change the logo to reflect the functionality of the application. From the overview page for [!INCLUDE[navnow](includes/navnow_md.md)] as an application, you can change configuration settings by choosing **Configure**. Then, save your changes.  

## Make [!INCLUDE[navnow](includes/navnow_md.md)] Available to Azure AD Tenants (for SharePoint app only)  
In the overview page for the application, the **URL for Granting Access** field contains a URL that you can send to users in other Azure AD tenants. Then, when they choose the link, a page displays where they must agree to trust the application. If they accept, the app is added to their SharePoint site.  

## Configure [!INCLUDE[nav_server](includes/nav_server_md.md)] for Azure AD

You can configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] and by using [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).

1.	Configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances that must support Azure AD to use AccessControlService as the credential type.

	The AccessControlService credential type for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance includes support for Azure AD so that you can achieve single sign-on between the SharePoint site and [!INCLUDE[navnow](includes/navnow_md.md)].  

2.	Specify the location of the federation metadata.

	The federation metadata is used to establish a trust relationship between [!INCLUDE[navnow](includes/navnow_md.md)] and Azure AD. You must specify the federation metadata document URL that you retrieved from the Azure AD overview page in the configuration settings for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances. The federation metadata location is part of the client services section of the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration. For example, in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], on the **Azure Active Directory** tab, the **WS-Federation Metadata Location** field specifies the location, such as **https://login.windows.net/Solutions.onmicrosoft.com/FederationMetadata/2007-06/FederationMetadata.xml**.  

3.	Specify the WS-federation login endpoint.

	The WS-federation login endpoint is the URL of the sign-on page that [!INCLUDE[navnow](includes/navnow_md.md)] redirects to when users sign on from a client. You must specify a URL in the following format:

	```
    https://login.windows.net/[AAD TENANT ID]/wsfed?wa=wsignin1.0%26wtrealm=[APP ID URI]%26wreply=[APP REPLY URL]
    ```

	Example:

	```
    https://login.windows.net/CRONUSInternationLtd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://CRONUSInternationLtd.onmicrosoft.com/Financials%26wreply=https://CRONUSInternationLtd.onmicrosoft.com/DynamicsNAV/SignIn.aspx
    ```

    (For [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions, include `/WebClient`after `/DynamicsNAV`.)

	Description:

	[AAD TENANT ID] is the ID of the Azure AD tenant, for example "CRONUSInternationLtd.onmicrosoft.com". To ensure that [!INCLUDE[navnow](includes/navnow_md.md)] redirects to the right sign-in page, substitute [AAD TENANT ID] with a value according to the following:

    - If the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured for as a single tenant server instance, the value is typically the domain name for the Azure AD tenant, and the URL is similar to the example above.
    - If the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured for multitenancy, and each [!INCLUDE[navnow](includes/navnow_md.md)] tenant corresponds to an Azure AD tenant that has a service principal, use ```{AADTENANTID}``` as the value. For example, ```https://login.windows.net/{AADTENANTID}/wsfed?wa=wsignin1.0%26wtrealm=...%26wreply=...```. [!INCLUDE[nav_server](includes/nav_server_md.md)] will automatically replace ```{AADTENANTID}``` with the correct Azure AD tenant.
    - If the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured as a multitenant instance and the corresponding [!INCLUDE[navnow](includes/navnow_md.md)] application in Azure AD has external access and configured as a multitenant application, substitute [AAD TENANT ID] with ```common```. Tenant ID parameter that is specified when mounting a tenant replaces the placeholder.

	[APP ID URI] is the ID that was assigned to the [!INCLUDE[navnow](includes/navnow_md.md)] application when it was registered in Azure AD, for example ```https://localhost/``` or ```https://CRONUSInternationLtd.onmicrosoft.com/Financials```.

	[APP REPLY URL] is the reply URL that was assigned to the [!INCLUDE[navnow](includes/navnow_md.md)] application when it was registered in the Azure AD tenant. This parameter must point to the SignIn.aspx page of the [!INCLUDE[nav_web](includes/nav_web_md.md)], which in most cases, this is the same as the **Sign-On URL** for the application. For example, ```https://CRONUSInternationLtd.onmicrosoft.com/DynamicsNAV/SignIn.aspx``` or ```https://CRONUSInternationLtd.onmicrosoft.com/DynamicsNAV/WebClient/SignIn.aspx``` (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions). The wreply parameter is optional. The wreply query parameter tells the Azure AD authentication service where to send the authentication token. If you do not specify the wreply parameter, it will be deducted from the URL in the browser.

  >[!IMPORTANT]
  >The query string parameter must be URI-encoded. This means, for example, use "%26" instead of "&".

4.	To configure SOAP and OData web services for Azure AD authentication, specify the App ID URI that is registered for [!INCLUDE[navnow](includes/navnow_md.md)] in the Azure AD.

	 In the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], you do this by setting the **Azure AD App URI** field on the **Azure Active Directory** tab. The App ID URI is typically the same as the *wtrealm* parameter value of the **WS-Federation Endpoint** setting in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration and the **ACSUri** setting in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] configuration.   

 You can configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] and by using [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

## Configure [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] for Azure AD  
 You must configure The [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] that must support Azure AD must also be configured to use AccessControlService as the credential type.  

For more information see, [Configure Authentication of Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md).

## Configure [!INCLUDE[nav_windows](includes/nav_windows_md.md)] for Azure AD  
 The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] must also be configured to use AccessControlService as the credential type in order to support Azure AD. In addition, the **ACSUri** setting for Azure AD authentication must be set. The value should be that same as the **WS-Federation Login Endpoint** setting of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, except for the [App REPLY URL] parameter. The *ACSUri* setting has the following format:

```
https://login.windows.net/[AAD TENANT ID]/wsfed?wa=wsignin1.0%26wtrealm=[APP ID URI]%26wreply=[APP REPLY URL]
```

The [APP REPLY URL] parameter in the URL must be equal to the sign in page for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], such as  ```https://dynamicsnavwinclient/```.  

For example:

```
<add key="ACSUri" value="https://login.windows.net/CRONUSInternationLtd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://CRONUSInternationLtd.onmicrosoft.com/Financials%26wreply=http://dynamicsnavwinclient/" />
```

## Associate the Azure AD Accounts with the [!INCLUDE[navnow](includes/navnow_md.md)] User Accounts  
 Each user in your Azure AD tenant that will access [!INCLUDE[navnow](includes/navnow_md.md)] must be set up in [!INCLUDE[navnow](includes/navnow_md.md)]. For example, create the users with Windows authentication or with user name/password authentication, depending on your deployment scenario. But you must also specify an authentication email address on the **Office 365 Authentication** FastTab in the **User Card** window. The authentication email address is the email account for that user in your Azure AD tenant. When you combine this with the relevant configuration of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, users achieve single sign-on when they access [!INCLUDE[nav_web](includes/nav_web_md.md)] from the SharePoint site, for example. For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  

> [!IMPORTANT]  
>  The single sign-on means that users are still signed in to Azure AD when they sign out from [!INCLUDE[navnow](includes/navnow_md.md)], unless they close all browser windows. However, if a user selected the **Keep me signed in** field when they signed in, they are still signed in when they close the browser window. To fully sign out from Azure AD, the user must sign out from each application that uses Azure AD, including [!INCLUDE[navnow](includes/navnow_md.md)] and SharePoint.  
>   
>  We recommend that you provide guidance to your users for signing out of their account when they’re done, so that you can keep your [!INCLUDE[navnow](includes/navnow_md.md)] deployment more secure.  

## See Also  
 [Users and Credential Types](Users-and-Credential-Types.md)   
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [How to: Sign Up for a Microsoft Account](How-to--Sign-Up-for-a-Microsoft-Account.md)   
 [How to: Sign Up for a Microsoft Azure Subscription](How-to--Sign-Up-for-a-Microsoft-Azure-Subscription.md)   
 [How to: Set up Microsoft Dynamics NAV for Single Sign-on With Office 365 using Windows PowerShell](How-to--Set-up-Microsoft-Dynamics-NAV-for-Single-Sign-on-With-Office-365-using-Windows-PowerShell.md)  
 [Configuring Dynamics NAV and the Excel Add-In](configuring-dynamics-nav-excel-addin.md)  
