---
title: "Microsoft.AspNetCore.HttpOverrides.ForwardedHeadersMiddleware, parameter count mismatch error"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
ms.search.keywords: Microsoft.AspNetCore.HttpOverrides.ForwardedHeadersMiddleware, Parameter count mismatch between X-Forwarded-For and X-Forwarded-Proto
---
# Troubleshooting: Microsoft.AspNetCore.HttpOverrides.ForwardedHeadersMiddleware and Parameter count between X-Forwarded-For and X-Forwarded-Proto errors 

With [!INCLUDE[nav2018_md](includes/nav2018_md.md)], if the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] is hosted on an IIS server farm that is using Application Request Routing (ARR), you might experience problems accessing the Web client, and the following errors will be recorded in the event log:

`Microsoft.AspNetCore.HttpOverrides.ForwardedHeadersMiddleware`

`Parameter count mismatch between X-Forwarded-For and X-Forwarded-Proto.`

## Resolution  
This error can be caused by a missing header in an ARR routing rule. [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] runs on ASP .NET Core, which requires both an `X-Forwarded-For` header and `X-Forwarded-Proto` header. By default, ARR only adds the `X-Forwarded-For` header; not the `X-Forwarded-Proto` header.

To resolve this issue, on the server farm in IIS, add or edit a routing rule to include a server variable for `X-Forwarded-Proto`. For example, using IIS Manager, select **Routihg Rules** > **URL Rewrite** > **Edit** > **Server Variables**, and then add a server variable that has  following settings: 

|  Name  |  Value  |  Replace  |
|--------|---------|-----------|
|`HTTP_X_FORWARED_PROTO`|`http` ot `https`|`true`|

For more information, see [Using URL Rewrite ](/iis/extensions/url-rewrite-module/using-url-rewrite-module-20).
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-M|icrosoft-Dynamics-NAV-Web-Client-Installation.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)