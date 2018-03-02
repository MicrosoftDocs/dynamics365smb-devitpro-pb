---
title: Web Client Configuration for Tenants
description: To deploy the Dynamics NAV Web Client in a multitenant development architecture, URLs must specify the tenant ID to access a specific tenant.
ms.custom: na
ms.date: 11/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: eb87ee8c-be21-4fed-a5f7-2229c4101c61
caps.latest.revision: 6
---
# Configuring Dynamics NAV Web Client to Accept Host Names for Tenants
If you deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)] in a multitenant deployment architecture, URLs that must access a specific tenant must specify the tenant ID. However, the [!INCLUDE[nav_web](includes/nav_web_md.md)] can be accessed from URLs that specify a host name. If your deployment must support host names for tenants, then you must enable the corresponding URL rewrite rule in the web.config file for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  
  
### To enable the URL rewrite rule to configure the [!INCLUDE[nav_web](includes/nav_web_md.md)] to accept host names for tenants  
  
1.  On the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open the web.config file that is located in the physical path of the web application for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
     The path is *%systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]\\WebClient*. For example, the folder for the default [!INCLUDE[nav_web](includes/nav_web_md.md)] application is *%systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\WebClient*.  
  
    > [!NOTE]  
    >  You must open the web.config file as an administrator or have permission to modify the file.  
  
2.  In the `<system.webServer>` element, find the `<rule name="Hostname (without port) to tenant" enabled="false" stopProcessing="true">` element, and then change the value of the `enabled` attribute to **true**.  
  
3.  Save and close the web.config file.  
  
 This enables support for host names for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. If a tenant has been mounted with a host name as an alternative ID, the [!INCLUDE[nav_web](includes/nav_web_md.md)] will accept a URL that contains this host name to identify the tenant.  
  
 If you create a non-tenant specific app for SharePoint that accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)] by using Microsoft Azure Active Directory, the resulting URL includes a parameter that specified a SharePoint host URL. This represents the URL for opening the [!INCLUDE[nav_web](includes/nav_web_md.md)] that you have specified in the app manifest. You must enable a URL rewrite rule in order to accept the URL.  
  
## See Also  
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md)   
 [Configuring the Microsoft Dynamics NAV Web Server and Client](Configuring-the-Microsoft-Dynamics-NAV-Web-Server-and-Client.md)   
 [Integrating Microsoft Dynamics NAV in SharePoint Sites](Integrating-Microsoft-Dynamics-NAV-in-SharePoint-Sites.md)