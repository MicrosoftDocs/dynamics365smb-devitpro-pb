---
title: "Date Data Type"
ms.author: solsen
ms.custom: na
ms.date: 08/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Date Data Type
Denotes a date ranging from January 1, 1753 to December 31, 9999.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The displayed text format of the date is determined by your Region and Language Format setting in Windows.  
  
## Undefined dates  
 An undefined or blank date is specified by 0D. The undefined date is considered to be before all other dates.  
  
## Normal dates and closing dates  
 All normal dates have a corresponding closing date. The closing date for a given date is defined as a period of time that follows a given normal date and precedes the next normal date.  
  
## Syntax
The syntax for defining DateTime format follows the [ISO standard](https://en.wikipedia.org/wiki/ISO_8601). 
- The syntax for defining Date format is `yyyymmddD`, where `D` is a mandatory letter. For example, `20180325D`, read as the 26th of March, 2018.

 To assign a normal date to a variable, use the following format: `yyyymmddD`.
 To assign a closing date to a variable, use the [CLOSINGDATE method (Date)](../methods/devenv-closingdate-method-date.md).  
  
## Year format  
 If the year is defined by two digits and is between 30 and 99, then it is considered to be in the 1900s. If it is between 00 and 29, then it is considered to be in the 2000s.  
  
## Storing dates in the SQL server database  
 SQL Server stores information about both date and time in columns of the DATETIME types. For date fields, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] uses only the date and uses a constant value for the time. For a normal date, this constant value contains 00:00:00:000. For a closing date, it contains 23:59:59:000.  
  
 The [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] undefined date is represented by the earliest valid date in SQL Server. The earliest valid date in SQL Server for a DATETIME is 01-01-1753 00:00:00:000.  
  
 If you store a date in the database that is outside the valid range for a SQL DATETIME, a run-time error occurs.  

## Methods
The methods supported for the Date data type are:

[CALCDATE method (Date)](../methods/devenv-calcdate-method-date.md)   
[CLOSINGDATE method (Date)](../methods/devenv-closingdate-method-date.md)   
[DATE2DMY method (Date)](../methods/devenv-date2dmy-method-date.md)   
[DATE2DWY method (Date)](../methods/devenv-date2dwy-method-date.md)   
[DMY2DATE method (Date)](../methods/devenv-dmy2date-method-date.md)   
[DWY2DATE method (Date)](../methods/devenv-dwy2date-method-date.md)   
[NORMALDATE method (Date)](../methods/devenv-normaldate-method-date.md)   
[TODAY method (Date)](../methods/devenv-today-method-date.md)   
[VARIANT2DATE method](../methods/devenv-variant2date-method.md)   
[WORKDATE method (Date)](../methods/devenv-workdate-method-date.md)
<!--[DATI2VARIANT method](../articles/devenv-methods-not-supported/devenv-dati2variant-method.md)  --> 

## Example  
 This example shows valid assignments of Dates. It requires that you define the following variable.  
  
|Variable|DataType|  
|--------|--------|  
|Date1|Date|  
  
 This example is compiled and run on a computer with the regional format set to English (United States).   

```  
Date1 := 0D;  
Date1 := 112710D;  
MESSAGE(FORMAT(Date1));  
Date1 := 11271810D;  
MESSAGE(FORMAT(Date1));  
```  
  
 The message window displays the following:  
  
 **11/27/10**  
  
 **11/27/1810**  
  
> [!NOTE]  
>  When you assign a value to a date variable, the value that you assign must be in the correct format for the regional setting of the computer. For example, if the computer is set to English (United States), then `Date1 := 271108D;` results in a compiler error.  
  
<!-- Removed for 2017 ## Changes from Previous Versions of Microsoft Dynamics NAV  
 This topic has been updated to specify the SQL Server requirement for the earliest DateTime rather than the internal [!INCLUDE[navnow](includes/navnow_md.md)] date. In SQL Server, the earliest DateTime is January 1, 1753, 00:00:00.000. [!INCLUDE[navnow](includes/navnow_md.md)] can handle dates as early as January 3, 0001, but such dates cannot be stored in the database. --> 

 
## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  