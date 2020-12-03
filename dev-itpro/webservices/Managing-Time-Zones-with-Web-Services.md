---
title: "Managing Time Zones with Web Services"
description: Learn how time zones work with web services
ms.custom: na
ms.date: 12/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Managing Time Zones with Web Services
[!INCLUDE[server](../developer/includes/server.md)] provides a **Services Default Time Zone** setting for defining the time zone in which web service calls run. This setting affects both SOAP and OData web services, in addition to NAS Services.  
  
## Time Zone Configuration  
 You can configure the Services Default Time Zone using the [Server Administration Tool](../administration/administration-tool.md), [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview), or by directly editing CustomSettings.config, the configuration file for the relevant [!INCLUDE[server](../developer/includes/server.md)] instance. The following table describes the possible values for the **Services Default Time Zone** setting.  
  
|Value|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|UTC|Specifies that all business logic for services on the server instance runs in Coordinated Universal Time \(UTC\). This is the default value. This is how web services business logic was handled in [!INCLUDE[nav2009sp1](../developer/includes/nav2009sp1_md.md)] and [!INCLUDE[nav_2009_long](../developer/includes/nav_2009_long_md.md)].|  
|Server Time Zone|Specifies that services use the time zone of the computer that is running [!INCLUDE[server](../developer/includes/server.md)].|  
|*ID of any Windows time zone*|Specifies that services use a Windows time zone as defined in the system registry under HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Time Zones. For example, Romance Standard Time is a valid Windows time zone value.|  
  
 When a web service writes data back to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] , dates and times are based on the setting of the Services Default Time Zone setting. However, the web service consumer can override the setting and specify a different time zone.  
  
> [!NOTE] 
>  [!INCLUDE[server](../developer/includes/server.md)] stores dates and times as UTC. When a web service receives data from [!INCLUDE[server](../developer/includes/server.md)], the time zone is UTC even if the Services Default Time Zone setting is set to a different time zone.  
  
 For example, if the Services Default Time Zone setting is set to **UTC+3**, the following table describes two scenarios where a web service consumer modifies [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data and sends this back to [!INCLUDE[server](../developer/includes/server.md)].  
  
|Web service changes the DateTime field to|[!INCLUDE[server](../developer/includes/server.md)] interprets the DateTime value as|[!INCLUDE[server](../developer/includes/server.md)] saves the DateTime value as|  
|-----------------------------------------------|---------------------------------------------------------------|----------------------------------------------------------|  
|01/01/2014 17:00 UTC+1|01/01/2014 17:00 UTC+1|01/01/2014 16:00 UTC|  
|01/01/2014 17:00|01/01/2014 17:00 UTC+3|01/01/2014 14:00 UTC|  
  
## See Also  

[SessionSettings.TimeZone Method](../developer/methods-auto/sessionsettings/sessionsettings-timezone-method.md)  
[Server Administration Tool](../administration/administration-tool.md)   
[Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview)