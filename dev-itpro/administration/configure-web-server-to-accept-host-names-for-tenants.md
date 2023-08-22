---
title: Web Client Configuration for Tenants
description: To deploy the Dynamics NAV Web Client in a multitenant development architecture, URLs must specify the tenant ID to access a specific tenant.
ms.custom: na
ms.date: 10/27/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.assetid: eb87ee8c-be21-4fed-a5f7-2229c4101c61
caps.latest.revision: 6
author: jswymer
---
# Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] to Accept Host Names for Tenants

When you deploy the [!INCLUDE[webserver](../developer/includes/webserver.md)] in a multitenant deployment architecture, URLs that must access a specific tenant must specify the tenant ID. However, the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] can be also accessed from URLs that specify a host name. To use host names for tenants, you must enable the corresponding URL rewrite rule in the web.config configuration file for the [!INCLUDE[webserver](../developer/includes/webserver.md)].  
  
### Enable the URL rewrite rule to configure the [!INCLUDE[webserver](../developer/includes/webserver.md)] to accept host names for tenants

1. Setting up URL rewrite rules requires that the Microsoft URL Rewrite module is installed in IIS on the computer running the [!INCLUDE[webserver](../developer/includes/webserver.md)]. If the module isn't installed already, download and install it from [Microsoft Supported & Community Downloads for IIS](https://www.iis.net/downloads/microsoft/url-rewrite).

    > [!TIP]
    > To see whether the URL Rewrite module is installed, open Internet Information Services (IIS Manager). In the **Features View**, look under the **IIS** group for **URL Rewrite**. If you see it, the module's installed.

2. Open the web.config configuration file that is located in the physical path of the web application for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
     The path is *rootdrive\\inetpub\\wwwroot\\\[VirtualDirectoryName\]\\*. For example, the folder for the default [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] application is *C:\\inetpub\\wwwroot\\[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]\\*.  
  
    > [!NOTE]  
    >  You must open the web.config file as an administrator or have permission to modify the file.  
  
3. In the `<system.webServer>` `</system.webServer>`element, delete the comments tags `<!--` `-->` before and after the `<rewrite>` `</rewrite>` element, if any.

4. In the `<rule name="Hostname (without port) to tenant" enabled="false" stopProcessing="true">` element, change the value of the `enabled` attribute to `true`.  
  
5. Save and close the web.config file.
  
Host names for the [!INCLUDE[webserver](../developer/includes/webserver.md)] can now be used. If a tenant's mounted with a host name as an alternative ID, the [!INCLUDE[webserver](../developer/includes/webserver.md)] will accept a URL that contains this host name to identify the tenant.  
  
If you create a non-tenant specific app for SharePoint that accesses the [!INCLUDE[webserver](../developer/includes/webserver.md)] by using Microsoft Azure Active Directory, the resulting URL includes a parameter that specifies a SharePoint host URL. This parameter represents the URL for opening the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] that you've specified in the app manifest. You must enable a URL rewrite rule to accept the URL.  
  
## See Also

 [Multitenant Deployment Architecture](../deployment/Multitenant-Deployment-Architecture.md)   
 [Configuring the Business Central Web Server](configure-web-server.md)   