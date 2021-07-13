---
title: "DateTime Data Type"
description: "Denotes a date and time ranging from January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999."
ms.author: solsen
ms.custom: na
ms.date: 07/13/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DateTime Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a date and time ranging from January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999. An undefined or blank DateTime is specified by 0DT.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The displayed text format of a DateTime is determined by your Regional and Language Options in Windows.  
  
## Remarks

A DateTime is stored in the database as Coordinated Universal Time (UTC). UTC is the international time standard (formerly Greenwich Mean Time, or GMT). Zero hours UTC is midnight at 0 degrees longitude.  
  
The DateTime is always displayed as local time in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. Local time is determined by the time zone regional settings used by your computer. You must always enter DateTimes as local time. When you enter a DateTime as local time, it is converted to UTC using the current settings for the time zone and daylight savings time.  
  
The DateTime data type does not support closing dates.  
  
By default, DateTimes are displayed using the standard display format. When you use the standard display format, seconds and milliseconds are not displayed until you select the DateTime field. Furthermore, if you export your data using an XMLport or by writing it to a file, the seconds and milliseconds are not exported unless you specify that DateTime fields use another format and display this information. For more information about how DateTime objects are displayed and the formats that are available, see [Format Property](../../properties/devenv-format-property.md).  
  
The only constant available when you use the DateTime data type is the undefined DateTime, 0DT. To assign a constant value to a DateTime variable you must use the [CreateDateTime method](../system/system-createdatetime-method.md).  
  
If you use a date that is outside the valid date range, a run-time error occurs.  

## Syntax

The syntax for defining DateTime format follows the [ISO standard](https://en.wikipedia.org/wiki/ISO_8601). 
- The syntax for defining Date format is `yyyymmddD`, where `D` is a mandatory letter. For example, `20180325D`, read as the 25th of March, 2018.
- The syntax for defining Time format is `hhmmssT`, where `T` is the time designator. For example, `093125H`, read as 9:13:25.

## SQL Server

In SQL Server, the earliest permitted DateTime is January 1, 1753, 00:00:00.000. The latest permitted DateTime is December 31, 9999, 23:59:59.999. If you store a date in the database that is outside the valid range for a SQL DateTime, a runtime error occurs.  

## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[CurrentDateTime Method](../system/system-currentdatetime-method.md)  
[Format Property](../../properties/devenv-format-property.md)