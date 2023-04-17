---
title: "Communicating with Microsoft Dynamics NAV Clients in Different Time Zones"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5bf685b9-0629-4b03-8d88-8b60151acd9b
caps.latest.revision: 34
---
# Communicating with Microsoft Dynamics NAV Clients in Different Time Zones
[!INCLUDE[navnow](includes/navnow_md.md)] can interact with [!INCLUDE[rtc](includes/rtc_md.md)]s in different time zones.  
  
## RoleTailored Client Implementation  
 The following table provides an overview of how the time zone is determined for the different [!INCLUDE[rtc](includes/rtc_md.md)]s.  
  
|Client|Time zone|  
|------------|---------------|  
|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|Determined by the date and time settings of the client computer.|  
|[!INCLUDE[nav_web](includes/nav_web_md.md)]|Determined by the time zone setting in the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] of the [!INCLUDE[nav_web](includes/nav_web_md.md)] application. For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).|  
  
### DataTime Data Types  
 If [!INCLUDE[rtc](includes/rtc_md.md)] data contains data of the type DateTime, then upon receiving the data from the client, [!INCLUDE[nav_server](includes/nav_server_md.md)] converts this data into Coordinated Universal Time \(UTC\) based on the client time zone. When passing data of type DateTime back to the client, [!INCLUDE[nav_server](includes/nav_server_md.md)] converts the time back to the local time zone of the client before presenting the data to the end user.  
  
 Different countries and regions sometimes have different rules for determining when to start and end daylight saving time. If computers that run [!INCLUDE[nav_server](includes/nav_server_md.md)] are kept current with Windows updates, then changes to daylight saving time are managed automatically.  
  
> [!NOTE]  
>  There is limited support for reading and writing in UTC in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Specifically, the client evaluates and formats DateTime values in pages using format code 9. This format is UTC but can be difficult to read. For example, the date and time of January 1, 2008 with the long time format specifier, is displayed in the following format; 2008-01-01T10:22:00Z.  
  
### Date and Time Data Types  
 Date data type and Time data type are not affected by the time zone settings. The value that a user enters is the value that is saved to the [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
## Implementation for Web Services and NAS Services  
 The CustomSettings.config file, which is the configuration file for the [!INCLUDE[nav_server](includes/nav_server_md.md)] service instance, has a Services Default Time Zone setting. This setting is also implemented in the [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md) and in the [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
 You use this setting to define the time zone in which web service and NAS services calls are run. The following table describes the possible values for the Services Default Time Zone setting.  
  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|UTC|Specifies that all business logic for web services on the server runs in Coordinated Universal Time \(UTC\). This is the default value. This is how web services business logic was handled in [!INCLUDE[nav2009sp1](includes/nav2009sp1_md.md)] and [!INCLUDE[nav_2009_long](includes/nav_2009_long_md.md)].|  
|Server Time Zone|Specifies that web services use the time zone of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].|  
|*ID of any Windows time zone*|Specifies any Windows time zone as defined in the system registry under HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Time Zones. For example, Romance Standard Time is a valid Windows time zone value.|  
  
 When a web service writes data back to [!INCLUDE[navnow](includes/navnow_md.md)], dates and times are based on the setting of the Services Default Time Zone setting. However, the web service consumer can override the setting and specify a different time zone.  
  
> [!NOTE]  
>  [!INCLUDE[nav_server](includes/nav_server_md.md)] stores dates and times as UTC. When a web service receives data from [!INCLUDE[nav_server](includes/nav_server_md.md)], the time zone is UTC even if the Services Default Time Zone setting is set to a different time zone.  
  
 For example, if the Services Default Time Zone setting is set to **UTC+3**, the following table describes two scenarios where a web service consumer modifies [!INCLUDE[navnow](includes/navnow_md.md)] data and sends this back to [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
|Web service changes the DateTime field to|[!INCLUDE[nav_server](includes/nav_server_md.md)] interprets the DateTime value as|[!INCLUDE[nav_server](includes/nav_server_md.md)] saves the DateTime value as|  
|-----------------------------------------------|---------------------------------------------------------------|----------------------------------------------------------|  
|01/01/2014 17:00 UTC+1|01/01/2014 17:00 UTC+1|01/01/2014 16:00 UTC|  
|01/01/2014 17:00|01/01/2014 17:00 UTC+3|01/01/2014 14:00 UTC|  
  
## See Also  
 [Configuring the Windows Client](Configuring-the-Windows-Client.md)   
 [Dates and Times](Dates-and-Times.md)   
 [Managing Time Zones with Web Services](Managing-Time-Zones-with-Web-Services.md)
