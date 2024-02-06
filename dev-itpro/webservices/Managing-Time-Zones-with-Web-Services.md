---
title: Managing time zones with web services
description: Learn how time zones work with web services
ms.custom: bap-template
ms.date: 01/05/2024
ms.reviewer: jswtmer
ms.topic: conceptual
author: jswymer
---

# Managing time zones in web services 

For fields of type datetime, the time part of the data need some clarification when the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is located in a different timezone than the connect app (the one that consumes data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services) is located in. 

This article describes how timezones work in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services stack for this type of data.

## Time zone configuration (online) 

For online [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments, the **Services Default Time Zone** setting is always set to `UTC`. For installations in time zone far away from UTC, this might cause confusion because the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client shows a different date than what web services return for the same data. By adjusting your connect app (the one that consumes data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services) to use the same time zone offset as the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client, you can mitigate this confusion.

## Time zone configuration (on-premises)

[!INCLUDE[server](../developer/includes/server.md)] provides a **Services Default Time Zone** setting where an administrator can define the time zone in which web service calls run. This setting affects both APIs, SOAP and OData web services. 

You can configure the Services Default Time Zone using the [Server Administration Tool](../administration/administration-tool.md), [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview), or by directly editing CustomSettings.config, the configuration file for the relevant [!INCLUDE[server](../developer/includes/server.md)] instance. The following table describes the possible values for the **Services Default Time Zone** setting.  
  
|Value|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|UTC|Specifies that all business logic for services on the server instance runs in Coordinated Universal Time \(UTC\). This is the default value. This is how web services business logic was handled in [!INCLUDE[nav2009sp1](../developer/includes/nav2009sp1_md.md)] and [!INCLUDE[nav_2009_long](../developer/includes/nav_2009_long_md.md)].|  
|Server Time Zone|Specifies that services use the time zone of the computer that is running [!INCLUDE[server](../developer/includes/server.md)].|  
|*ID of any Windows time zone*|Specifies that services use a Windows time zone as defined in the system registry under HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Time Zones. For example, Romance Standard Time is a valid Windows time zone value.|  
  
When a web service writes data back to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] , dates and times are based on the setting of the Services Default Time Zone setting. However, the web service consumer can override the setting and specify a different time zone.  
  
> [!NOTE] 
> [!INCLUDE[server](../developer/includes/server.md)] stores dates and times as UTC. When a web service receives data from [!INCLUDE[server](../developer/includes/server.md)], the time zone is UTC even if the Services Default Time Zone setting is set to a different time zone.  
  
For example, if the Services Default Time Zone setting is set to **UTC+3**, the following table describes two scenarios where a web service consumer modifies [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data and sends this back to [!INCLUDE[server](../developer/includes/server.md)].  
  
|Web service changes the DateTime field to|[!INCLUDE[server](../developer/includes/server.md)] interprets the DateTime value as|[!INCLUDE[server](../developer/includes/server.md)] saves the DateTime value as|  
|-----------|--------------------------------------|----------------------------------------------------------|  
|01/01/2014 17:00 UTC+1|01/01/2014 17:00 UTC+1|01/01/2014 16:00 UTC|  
|01/01/2014 17:00|01/01/2014 17:00 UTC+3|01/01/2014 14:00 UTC|  

## See also  

[SessionSettings.TimeZone Method](../developer/methods-auto/sessionsettings/sessionsettings-timezone-method.md)  
[Server Administration Tool](../administration/administration-tool.md)   
[Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview)
