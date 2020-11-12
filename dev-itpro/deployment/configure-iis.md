---
title: "Configuring Internet Information Services"
description: Learn to configuration of Internet Information Service that is required for running the web client.
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 890e4a5b-2f43-4cb8-bc7a-18261eaf8139
caps.latest.revision: 19
author: jswymer
---
# Configuring Internet Information Services for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
This topic describes the configuration of Internet Information Service \(IIS\) that is required for running [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. When you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], you can use the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install and configure the IIS features, so you do not have to do this manually.


## Required IIS Features
IIS must have the following features enabled:  

-   HTTP Activation  

-   NET Extensibility 4.5, .NET Extensibility 4.6, or .NET Extensibility 4.6 \(depending on Windows version\)  

-   ASP.NET 4.5, ASP.NET 4.6, or ASP.NET 4.7 \(depending on Windows version\)  

-   ISAPI Extensions  

-   ISAPI Filters  

-   Request Filtering  

-   Windows Authentication  

-   Default Document

-   Directory Browsing

-   HTTP Errors

-   Static Content  



## <a name="ARR"></a> Configure Headers in Application Request Routing (ARR) Rules

If you are hosting the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] on an IIS server farm that is using Application Request Routing (ARR), you must configure headers. [!INCLUDE[webserverinstancemd](../developer/includes/webserverinstance.md)] runs on ASP .NET Core, which requires both an `X-Forwarded-For` header and `X-Forwarded-Proto` header in ARR routing rules. However, by default, ARR only adds the `X-Forwarded-For` header; not the `X-Forwarded-Proto` header. So will have to configure the `X-Forwarded-Proto` header manually.

On the server farm in IIS, add or edit a routing rule to include a server variable for `X-Forwarded-Proto`. For example, using IIS Manager, select **Routing Rules** > **URL Rewrite** > **Edit** > **Server Variables**, and then add a server variable that has the following settings: 

|  Name  |  Value  |  Replace  |
|--------|---------|-----------|
|`HTTP_X_FORWARED_PROTO`|`http` or `https`|`true`|
## See Also  
 [Business Central Web Server Overview](web-server-overview.md)   
