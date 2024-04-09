---
title: "Troubleshooting: Microsoft Dynamics NAV and SharePoint"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: b2d8557a-0153-4340-98be-15aff3caf2d3
caps.latest.revision: 6
---
# Troubleshooting: Microsoft Dynamics NAV and SharePoint
When you deploy a solution where [!INCLUDE[navnow](includes/navnow_md.md)] is embedded in web parts in SharePoint, users can experience unexpected problems when they access the [!INCLUDE[nav_web](includes/nav_web_md.md)]. This topic describes some common problems that you may encounter.  
  
##  <a name="MultipleSessions"></a> Multiple sessions used when a user accesses the Microsoft Dynamics NAV Web client in full-screen mode and in embedded mode  
 The [!INCLUDE[nav_web](includes/nav_web_md.md)] uses cookies to store session-related information on the client machine. In some scenarios, Internet Explorer assigns different security zones to the [!INCLUDE[nav_web](includes/nav_web_md.md)] depending on how the [!INCLUDE[nav_web](includes/nav_web_md.md)] is accessed, which impacts how the cookies are stored.  
  
 If you deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)] on an intranet machine, and you access the [!INCLUDE[nav_web](includes/nav_web_md.md)] in full-screen mode, such as if you open the [!INCLUDE[nav_web](includes/nav_web_md.md)] directly in a browser, Internet Explorer applies the Local Intranet security zone to the website and stores the cookie at a more trusted integrity level. In contrast, if the [!INCLUDE[nav_web](includes/nav_web_md.md)] is embedded in an IFRAME element in a web part in SharePoint Online, Internet Explorer considers both SharePoint Online and the [!INCLUDE[nav_web](includes/nav_web_md.md)] to be in the Internet zone. The two security zones, Internet and Local Intranet, do not share the same cookie store, and as a result, the [!INCLUDE[nav_web](includes/nav_web_md.md)] will initiate two separate sessions.  
  
 For example, a user opens a SharePoint Online site, such as *https://Fabrikam.SharePoint.com/Financials*, in Internet Explorer. This website has the [!INCLUDE[nav_web](includes/nav_web_md.md)] embedded in web parts with IFRAME elements that access the [!INCLUDE[nav_web](includes/nav_web_md.md)] at *https://MyLocalServer/NAV*. When the user accesses the page with the web part, the [!INCLUDE[nav_web](includes/nav_web_md.md)] starts a new session. Then, when the user chooses one of the web parts to access the [!INCLUDE[nav_web](includes/nav_web_md.md)] in full-screen mode, the [!INCLUDE[nav_web](includes/nav_web_md.md)] starts a new session.  
  
### Resolution  
 Make sure all websites that the user accesses as part of your [!INCLUDE[navnow](includes/navnow_md.md)] deployment are placed in the same security zone by Internet Explorer.  
  
 For example, configure your deployment to always use public domain names for [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and SharePoint. Alternatively, if your deployment uses SharePoint on-premises, you can choose to configure the deployment to use local names.  
  
 However, if you work in a mixed environment where a local [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] instance is used with SharePoint Online, you may experience problems with multiple [!INCLUDE[navnow](includes/navnow_md.md)] sessions starting for the same user. This is caused by the security zones and integrity levels that Internet Explorer applies to websites and web applications.  
  
## Modal dialog windows do not display when the [!INCLUDE[nav_web](includes/nav_web_md.md)] is embedded in a web part  
 When the [!INCLUDE[nav_web](includes/nav_web_md.md)] is embedded in a SharePoint site, modal dialog windows do not display. In some scenarios, Internet Explorer will attempt to open the modal dialog window in a new session.  
  
### Resolution  
 If you are going to embed a page in a SharePoint site, make sure that it does not open modal dialog windows.  
  
> [!NOTE]  
>  If you use the [!INCLUDE[demolong](includes/demolong_md.md)] for test purposes, you must disable the modal dialog window that displays when the [!INCLUDE[demoname](includes/demoname_md.md)] company opens.  
  
##  <a name="CannotAccessWebClient"></a> Users cannot access the Microsoft Dynamics NAV Web Client from SharePoint web parts with Microsoft Azure Active Directory or Azure Access Control services authentication for SharePoint on-premises  
 In SharePoint on-premises deployments, if you use Azure AD or Access Control services \(ACS\) as the authentication mechanism, users cannot access an embedded [!INCLUDE[nav_web](includes/nav_web_md.md)]. If the [!INCLUDE[nav_web](includes/nav_web_md.md)] is embedded in an IFRAME element in a web part, the authentication requires a login dialog to open inside the IFRAME element in the web part. This is not possible.  
  
### Resolution  
 If your app for SharePoint embeds the [!INCLUDE[nav_web](includes/nav_web_md.md)] in a web part, use Windows authentication for SharePoint on-premises deployments.  
  
 Alternatively, if you must deploy to SharePoint on-premises and cannot use Windows authentication, design your app for SharePoint so that it opens the [!INCLUDE[nav_web](includes/nav_web_md.md)] in full screen mode.  
  
## See Also  
 [Integrating Microsoft Dynamics NAV in SharePoint Sites](Integrating-Microsoft-Dynamics-NAV-in-SharePoint-Sites.md)   
 [Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint](Developing-and-Installing-a-Microsoft-Dynamics-NAV-Apps-for-SharePoint.md)