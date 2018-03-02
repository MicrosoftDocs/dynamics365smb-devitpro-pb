---
title: Date Data Type
description: Denotes a date ranging from January 1, 1753 to December 31, 9999 and displays text format of the date by Region and Language settings in Windows. 
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b179c72d-48ea-4015-bb76-c60a3b459c70
caps.latest.revision: 21
manager: edupont
---
# Date Data Type in Dynamics NAV
Denotes a date ranging from January 1, 1753 to December 31, 9999.  
  
 The displayed text format of the date is determined by your Region and Language Format setting in Windows.  
  
## Undefined Dates  
 An undefined or blank date is specified by 0D. The undefined date is considered to be before all other dates.  
  
## Normal Dates and Closing Dates  
 All normal dates have a corresponding closing date. The closing date for a given date is defined as a period of time that follows a given normal date and precedes the next normal date.  
  
 To assign a normal date to a variable, use the following format: \<MMDDYY>D  
  
 To assign a closing date to a variable, use the [CLOSINGDATE Function \(Date\)](CLOSINGDATE-Function--Date-.md).  
  
## Year Format  
 If the year is defined by two digits and is between 30 and 99, then it is considered to be in the 1900s. If it is between 00 and 29, then it is considered to be in the 2000s.  
  
## Storing Dates in the SQL Server Database  
 SQL Server stores information about both date and time in columns of the DATETIME types. For date fields, [!INCLUDE[navnow](includes/navnow_md.md)] uses only the date and uses a constant value for the time. For a normal date, this constant value contains 00:00:00:000. For a closing date, it contains 23:59:59:000.  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] undefined date is represented by the earliest valid date in SQL Server. The earliest valid date in SQL Server for a DATETIME is 01-01-1753 00:00:00:000.  
  
 If you store a date in the database that is outside the valid range for a SQL DATETIME, a run-time error occurs.  
  
## Example  
 This example shows valid assignments of Dates. It requires that you define the following variable.  
  
|Variable|DataType|  
|--------------|--------------|  
|Date1|Date|  
  
 This example is compiled and run on a computer with the regional format set to English \(United States\).  
  
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
>  When you assign a value to a date variable, the value that you assign must be in the correct format for the regional setting of the computer. For example, if the computer is set to English \(United States\), then `Date1 := 271108D;` results in a compiler error.  
  
<!-- Removed for 2017 ## Changes from Previous Versions of Microsoft Dynamics NAV  
 This topic has been updated to specify the SQL Server requirement for the earliest DateTime rather than the internal [!INCLUDE[navnow](includes/navnow_md.md)] date. In SQL Server, the earliest DateTime is January 1, 1753, 00:00:00.000. [!INCLUDE[navnow](includes/navnow_md.md)] can handle dates as early as January 3, 0001, but such dates cannot be stored in the database. --> 
  
## See Also  
 [CALCDATE Function \(Date\)](CALCDATE-Function--Date-.md)   
 [CLOSINGDATE Function \(Date\)](CLOSINGDATE-Function--Date-.md)   
 [DATE2DMY Function \(Date\)](DATE2DMY-Function--Date-.md)   
 [DATE2DWY Function \(Date\)](DATE2DWY-Function--Date-.md)   
 [DATI2VARIANT Function](DATI2VARIANT-Function.md)   
 [DMY2DATE Function \(Date\)](DMY2DATE-Function--Date-.md)   
 [DWY2DATE Function \(Date\)](DWY2DATE-Function--Date-.md)   
 [NORMALDATE Function \(Date\)](NORMALDATE-Function--Date-.md)   
 [TODAY Function \(Date\)](TODAY-Function--Date-.md)   
 [VARIANT2DATE Function](VARIANT2DATE-Function.md)   
 [WORKDATE Function \(Date\)](WORKDATE-Function--Date-.md)