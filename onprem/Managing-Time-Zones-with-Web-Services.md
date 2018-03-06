---
title: "Managing Time Zones with Web Services"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ebe86441-9836-4b91-9b45-1725d5385b35
caps.latest.revision: 8
manager: edupont
---
# Managing Time Zones with Web Services
[!INCLUDE[nav_server](includes/nav_server_md.md)] provides a **Services Default Time Zone** setting for defining the time zone in which web service calls run. This setting affects both SOAP and OData web services, in addition to NAS Services.  
  
## Time Zone Configuration  
 You can configure the Services Default Time Zone using the [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md), [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md), or by directly editing CustomSettings.config, the configuration file for the relevant [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The following table describes the possible values for the **Services Default Time Zone** setting.  
  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|UTC|Specifies that all business logic for services on the server instance runs in Coordinated Universal Time \(UTC\). This is the default value. This is how web services business logic was handled in [!INCLUDE[nav2009sp1](includes/nav2009sp1_md.md)] and [!INCLUDE[nav_2009_long](includes/nav_2009_long_md.md)].|  
|Server Time Zone|Specifies that services use the time zone of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].|  
|*ID of any Windows time zone*|Specifies that services use a Windows time zone as defined in the system registry under HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Time Zones. For example, Romance Standard Time is a valid Windows time zone value.|  
  
 When a web service writes data back to [!INCLUDE[navnow](includes/navnow_md.md)], dates and times are based on the setting of the Services Default Time Zone setting. However, the web service consumer can override the setting and specify a different time zone.  
  
> [!NOTE]  
>  [!INCLUDE[nav_server](includes/nav_server_md.md)] stores dates and times as UTC. When a web service receives data from [!INCLUDE[nav_server](includes/nav_server_md.md)], the time zone is UTC even if the Services Default Time Zone setting is set to a different time zone.  
  
 For example, if the Services Default Time Zone setting is set to **UTC+3**, the following table describes two scenarios where a web service consumer modifies [!INCLUDE[navnow](includes/navnow_md.md)] data and sends this back to [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
|Web service changes the DateTime field to|[!INCLUDE[nav_server](includes/nav_server_md.md)] interprets the DateTime value as|[!INCLUDE[nav_server](includes/nav_server_md.md)] saves the DateTime value as|  
|-----------------------------------------------|---------------------------------------------------------------|----------------------------------------------------------|  
|01/01/2014 17:00 UTC+1|01/01/2014 17:00 UTC+1|01/01/2014 16:00 UTC|  
|01/01/2014 17:00|01/01/2014 17:00 UTC+3|01/01/2014 14:00 UTC|  
  
## See Also  
 [Communicating with Microsoft Dynamics NAV Clients in Different Time Zones](Communicating-with-Microsoft-Dynamics-NAV-Clients-in-Different-Time-Zones.md)   
 [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)