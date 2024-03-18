---
title: "Integrating Microsoft Dynamics NAV in SharePoint Sites"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Integrating Microsoft Dynamics NAV in SharePoint Sites
You can set up [!INCLUDE[navnow](includes/navnow_md.md)] to be available as an app for SharePoint. This means that [!INCLUDE[navnow](includes/navnow_md.md)] data can be shown in a SharePoint site, and that you can modify the data on the SharePoint site through the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 You can deploy [!INCLUDE[navnow](includes/navnow_md.md)] as an app for SharePoint Online and SharePoint on-premises.  
  
## SharePoint and [!INCLUDE[navnow](includes/navnow_md.md)]  
 If you set up a SharePoint site, you can add [!INCLUDE[navnow](includes/navnow_md.md)] as an app to the site so that the [!INCLUDE[nav_web](includes/nav_web_md.md)] opens when the user chooses an icon. Then, you can add web parts that show [!INCLUDE[navnow](includes/navnow_md.md)] data, such as a list of sales invoices with overdue payments. Users can drill down into the data and the web parts will open the relevant page in the [!INCLUDE[nav_web](includes/nav_web_md.md)] when the user chooses an icon or a link.  
  
 For example, if you provide financial services to several subscribers, you want your subscribers to be able to see their data in a SharePoint site. In that case, you can create separate subsites for each subscriber so that they have access to only their data. Their data is stored in dedicated business databases, because you have deployed your [!INCLUDE[navnow](includes/navnow_md.md)] solution in a multitenant deployment architecture. You add [!INCLUDE[navnow](includes/navnow_md.md)] as an app so that users can open the [!INCLUDE[nav_web](includes/nav_web_md.md)] when they choose an icon, and they are signed in to [!INCLUDE[navnow](includes/navnow_md.md)] automatically. Then, you add parts to show the subscriber’s list of unpaid sales invoices, or a chart that reflects top sales. When the user chooses the list of unpaid sales invoices, the underlying page from [!INCLUDE[nav_web](includes/nav_web_md.md)] opens as a seamless part of the SharePoint site. The user can filter and modify the data without having to sign in to a new site.  
  
> [!WARNING]  
>  The users' access to [!INCLUDE[navnow](includes/navnow_md.md)] is not restricted to the page that you expose in SharePoint. You must assign the relevant permissions to each user in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 You can set up a site collection with a site for each subscriber to your services, or you can set up a single site with general information. In this scenario, your [!INCLUDE[navnow](includes/navnow_md.md)] implementation is most likely to be a multitenant deployment with a tenant for each of your subscribers. But you can choose other deployment scenarios, such as using [!INCLUDE[navnow](includes/navnow_md.md)] companies in shared databases for your subscribers. Similarly, you can deploy [!INCLUDE[navnow](includes/navnow_md.md)] as an app for SharePoint that is used internally exclusively by users in your own organization. In general, the configuration of the app and how [!INCLUDE[navnow](includes/navnow_md.md)] and SharePoint interact are the same in both scenarios.  
  
## Deploying [!INCLUDE[navnow](includes/navnow_md.md)] for Integration with SharePoint  
 To integrate with SharePoint, you must have a [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] Web Server instance. These components can be deployed on-premise or on a cloud service, such as Microsoft Azure.  
  
-   The [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that you want your app for SharePoint to access must be configured for multitenancy and configured with AccessControlService as the credential type. For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
  
-   The [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] instance that you want to use for your app for SharePoint must be configured to be able to run in the SharePoint site. The default configuration prevents the [!INCLUDE[nav_web](includes/nav_web_md.md)] from running inside an iframe in an external website. If you want to show [!INCLUDE[navnow](includes/navnow_md.md)] data in app parts, you must remove the X-FRAME-OPTIONS setting in the web.config file. For more information, see [Embedding the Microsoft Dynamics NAV Web Client in a Website on Another Web Server](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md#EmbedWebClient).  
  
     The [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] instance must be configured to use secure authentication and SSL. For more information, see [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md).  
  
-   Each user who will access [!INCLUDE[navnow](includes/navnow_md.md)] from your app for SharePoint must be set up in [!INCLUDE[navnow](includes/navnow_md.md)]. For example, create the users with Windows authentication or with user name/password authentication, depending on your deployment scenario. But you must also specify an authentication email address on the **Office 365 Authentication** FastTab in the **User Card** window. The authentication email address must be the same account that the users log on to Office 365 or SharePoint Online with. If you set up this account in your Microsoft Azure AD tenant, you achieve a deeper integration between SharePoint and [!INCLUDE[navnow](includes/navnow_md.md)]. By creating the users of the SharePoint site as users in [!INCLUDE[navnow](includes/navnow_md.md)] with this authentication email address, they achieve single sign-on when they access [!INCLUDE[nav_web](includes/nav_web_md.md)] from the SharePoint site, for example. For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  
  
## Building an App for SharePoint  
 In order to add [!INCLUDE[navnow](includes/navnow_md.md)] as an app to a SharePoint site, you must create a provider-hosted app for SharePoint in Visual Studio. This includes configuring an appManifest.xml file, so that the app can be added to a site. The app manifest describes metadata such as the title, the publisher, and the URL of start page for the [!INCLUDE[nav_web](includes/nav_web_md.md)] so that the app will open the relevant [!INCLUDE[nav_web](includes/nav_web_md.md)] address. Also, you can add one or more client web parts for the [!INCLUDE[navnow](includes/navnow_md.md)] pages that you want to show on the SharePoint site. You can choose to use an already existing page, or you can create specific pages that are only used for SharePoint. For example, you can create a part that is based on page ID 9305, **Sales Order List**. Then, you deploy the app to your SharePoint site, and you add the part as an app part that will show the page in the [!INCLUDE[nav_web](includes/nav_web_md.md)] as a list of sales orders without navigation elements. The list resembles any other list in SharePoint, but it is the [!INCLUDE[nav_web](includes/nav_web_md.md)], and the data is current. For more information, see [Embedding Microsoft Dynamics NAV Web Client Pages in Other Websites](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md) and [Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint](Developing-and-Installing-a-Microsoft-Dynamics-NAV-Apps-for-SharePoint.md).  
  
### Apps for SharePoint and Multitenant Deployments of [!INCLUDE[navnow](includes/navnow_md.md)]  
 You can deploy [!INCLUDE[navnow](includes/navnow_md.md)] in a multitenant deployment architecture. When you create an app for SharePoint that will access the [!INCLUDE[nav_web](includes/nav_web_md.md)], you must decide if you want to deploy the app for a specific tenant, or if the app can be used by all tenants that are mounted against a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. Then, in the app manifest for the app, you include a *tenant* parameter in start page URL according to the following:  
  
-   If you want the app to apply to a specific tenant only, then set the *tenant* parameter to the tenant ID, such as *https://www.solutions.com/DynamicsNAV/?tenant=tenant1* or https://www.solutions.com/DynamicsNAV/WebClient/?tenant=tenant1* (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions). In this example, the tenant ID is *tenant1*. The value of the tenant parameter must be included in tenants list of alternative IDs.  
  
     Alternatively, if you have configured the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] to accept host names, you can specify the host name in the URL in the app manifest. For more information, see [How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md).  
  
-   If you want the app to apply to all tenants, then set the *tenant* parameter to *{HostUrl}*, such as *https://www.solutions.com/DynamicsNAV/?tenant={HostUrl}* or *https://www.solutions.com/DynamicsNAV/WebClient/?tenant={HostUrl}*(for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).  
  
     When the app accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)], *HostUrl* is automatically replaced by the SharePoint site address where the app is installed. Because the SharePoint site is tenant-specific, this parameter identifies the tenant.  
  
     You must include all SharePoint site addresses that can access a tenant in the tenant's list of alternative IDs.  
  
> [!NOTE]  
>  For more information about how to set alternate IDs for tenants, see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md).  
  
## Installing [!INCLUDE[navnow](includes/navnow_md.md)] as an App  
 When you have built your app for SharePoint in Visual Studio, you must publish it in order to create the deployment package. Depending on your scenario, you can deploy the app to SharePoint in different ways.  
  
 For example, you can publish the app to the SharePoint store so that it is accessible for others to install on their SharePoint sites.  
  
 If you want to install the app only on your own SharePoint sites, you can upload it to your SharePoint app catalog from where you can install it to the relevant SharePoint sites. For example, if you have a SharePoint site collection with a site that is used internally and a site that is publicly available. Then, you can add different parts to the two sites, such as a read-only part on the public site, and an editable part on the internal site. For more information, see [Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint](Developing-and-Installing-a-Microsoft-Dynamics-NAV-Apps-for-SharePoint.md).  
  
## See Also  
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint](Developing-and-Installing-a-Microsoft-Dynamics-NAV-Apps-for-SharePoint.md)   
 [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)   
 [Troubleshooting: Microsoft Dynamics NAV and SharePoint](Troubleshooting--Microsoft-Dynamics-NAV-and-SharePoint.md)   
 [Configuring Authentication and Single Sign-On Between Microsoft Dynamics NAV and SharePoint](Configuring-Authentication-and-Single-Sign-On-Between-Microsoft-Dynamics-NAV-and-SharePoint.md)