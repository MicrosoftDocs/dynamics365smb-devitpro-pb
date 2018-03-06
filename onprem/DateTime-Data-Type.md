---
title: DateTime Data Type
description: In Dynamics NAV, the DateTime data type denotes a date and time ranging from January, 1 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999. 
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5e81b482-850f-4e8a-8625-5937dabaf1b2
caps.latest.revision: 17
manager: edupont
---
# DateTime Data Type in Dynamics NAV
Denotes a date and time ranging from January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999. An undefined or blank DateTime is specified by 0DT.  
  
 The displayed text format of a DateTime is determined by your Regional and Language Options in Windows.  
  
## Remarks  
 A DateTime is stored in the database as Coordinated Universal Time \(UTC\). UTC is the international time standard \(formerly Greenwich Mean Time, or GMT\). Zero hours UTC is midnight at 0 degrees longitude.  
  
 The DateTime is always displayed as local time in [!INCLUDE[navnow](includes/navnow_md.md)]. Local time is determined by the time zone regional settings used by your computer. You must always enter DateTimes as local time. When you enter a DateTime as local time, it is converted to UTC using the current settings for the time zone and daylight savings time.  
  
 The DateTime data type does not support closing dates.  
  
 By default, DateTimes are displayed using the standard display format. When you use the standard display format, seconds and milliseconds are not displayed until you select the DateTime field. Furthermore, if you export your data using an XMLport or by writing it to a file, the seconds and milliseconds are not exported unless you specify that DateTime fields use another format and display this information. For more information about how DateTime objects are displayed and the formats that are available, see [Format Property](Format-Property.md).  
  
 The only constant available when you use the DateTime data type is the undefined DateTime, 0DT. To assign a constant value to a DateTime variable you must use the [CREATEDATETIME Function \(DateTime\)](CREATEDATETIME-Function--DateTime-.md).  
  
 If you use a date that is outside the valid date range, a run-time error occurs.  
  
## SQL Server  
 In SQL Server, the earliest permitted DateTime is January 1, 1753, 00:00:00.000. The latest permitted DateTime is December 31, 9999, 23:59:59.999.  
  
 If you store a date in the database that is outside the valid range for a SQL DATETIME, a run-time error run-time occurs.  
  
## Changes from Previous Versions of Microsoft Dynamics NAV  
 In versions earlier than [!INCLUDE[nav_2009_long](includes/nav_2009_long_md.md)], the DateTime data type denotes DateTimes ranging from January 1, 0000, 00:00:00.000 to December 31, 9999, 23:59:59.999, and includes the undefined DateTime, 0DT. [!INCLUDE[navnowlong](includes/navnowlong_md.md)] supports DateTimes with date January 1, 0000 as a special case for compatibility with previous versions.  
  
 This topic has been updated to specify the SQL Server requirement for the earliest DateTime rather than the internal [!INCLUDE[navnow](includes/navnow_md.md)] DateTime. In SQL Server, the earliest DateTime is January 1, 1753, 00:00:00.000. [!INCLUDE[navnow](includes/navnow_md.md)] can handle dates as early as January 3, 0001, but such dates cannot be stored in the database.  
  
## See Also  
 [CREATEDATETIME Function \(DateTime\)](CREATEDATETIME-Function--DateTime-.md)   
 [CURRENTDATETIME Function \(DateTime\)](CURRENTDATETIME-Function--DateTime-.md)   
 [DT2DATE Function \(DateTime\)](DT2DATE-Function--DateTime-.md)   
 [DT2TIME Function \(DateTime\)](DT2TIME-Function--DateTime-.md)   
 [ROUNDDATETIME Function \(DateTime\)](ROUNDDATETIME-Function--DateTime-.md)