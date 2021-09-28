---
title: Web Client Configuration for Tenants
description: To deploy the Dynamics NAV Web Client in a multitenant development architecture, URLs must specify the tenant ID to access a specific tenant.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: eb87ee8c-be21-4fed-a5f7-2229c4101c61
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---
# Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] to Accept Host Names for Tenants

If you deploy the [!INCLUDE[webserver](../developer/includes/webserver.md)] in a multitenant deployment architecture, URLs that must access a specific tenant must specify the tenant ID. However, the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] can be accessed from URLs that specify a host name. If your deployment must support host names for tenants, then you must enable the corresponding URL rewrite rule in the web.config configuration file for the [!INCLUDE[webserver](../developer/includes/webserver.md)].  
  
### Enable the URL rewrite rule to configure the [!INCLUDE[webserver](../developer/includes/webserver.md)] to accept host names for tenants  
  
1. On the computer that is running the [!INCLUDE[webserver](../developer/includes/webserver.md)], open the web.config configuration file that is located in the physical path of the web application for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
     The path is *%systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]\\*. For example, the folder for the default [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] application is *%systemroot%\\inetpub\\wwwroot\\[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]\\*.  
  
    > [!NOTE]  
    >  You must open the web.config file as an administrator or have permission to modify the file.  
  
2. In the `<system.webServer>` element, find the `<rule name="Hostname (without port) to tenant" enabled="false" stopProcessing="true">` element, and then change the value of the `enabled` attribute to `true`.  
  
3. Save and close the web.config file.  
  
 This enables support for host names for the [!INCLUDE[webserver](../developer/includes/webserver.md)]. If a tenant has been mounted with a host name as an alternative ID, the [!INCLUDE[webserver](../developer/includes/webserver.md)] will accept a URL that contains this host name to identify the tenant.  
  
 If you create a non-tenant specific app for SharePoint that accesses the [!INCLUDE[webserver](../developer/includes/webserver.md)] by using Microsoft Azure Active Directory, the resulting URL includes a parameter that specified a SharePoint host URL. This represents the URL for opening the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] that you have specified in the app manifest. You must enable a URL rewrite rule in order to accept the URL.  
  
## See Also

 [Multitenant Deployment Architecture](../deployment/Multitenant-Deployment-Architecture.md)   
 [Configuring the Business Central Web Server](configure-web-server.md)   