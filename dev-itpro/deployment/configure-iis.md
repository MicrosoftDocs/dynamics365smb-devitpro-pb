---
title: Configuring Internet Information Services for Business Central
description: Learn to configuration of Internet Information Service that is required for running the web client.
ms.date: 06/22/2026
ms.topic: concept-article
author: jswymer
---
# Configuring Internet Information Services (IIS) for Business Central

This article describes the configuration of Internet Information Service \(IIS\) that is required for running [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. When you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], you can use the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install and configure the IIS features, so you don't have to do this task manually.

## Required IIS Features

IIS must have the following features enabled:  

- HTTP Activation  
- .NET Extensibility 4.x
- ASP.NET 4.x
- ISAPI Extensions  
- ISAPI Filters  
- Request Filtering  
- Windows Authentication  
- Default Document
- Directory Browsing
- HTTP Errors
- Static Content  

> [!NOTE]
> The ASP.NET and .NET Extensibility versions rely on the .NET Framework runtime included with Windows. For example, with Windows 11 and Windows Server 2022 and later, the version corresponds to NET Framework 4.8.

## <a name="ARR"></a> Configure Headers in Application Request Routing (ARR) Rules

If you're hosting the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] on an IIS server farm that's using Application Request Routing (ARR), you must configure headers. [!INCLUDE[webserverinstancemd](../developer/includes/webserverinstance.md)] runs on ASP.NET Core, which requires both an `X-Forwarded-For` header and `X-Forwarded-Proto` header in ARR routing rules. However, by default, ARR only adds the `X-Forwarded-For` header; not the `X-Forwarded-Proto` header. So you have to configure the `X-Forwarded-Proto` header manually.

On the server farm in IIS, add or edit a routing rule to include a server variable for `X-Forwarded-Proto`. For example, using IIS Manager, select **Routing Rules** > **URL Rewrite** > **Edit** > **Server Variables**, and then add a server variable that has the following settings: 

|  Name  |  Value  |  Replace  |
|--------|---------|-----------|
|`HTTP_X_FORWARDED_PROTO`|`http` or `https`|`true`|

## Related information

[Business Central Web Server Overview](web-server-overview.md)  
