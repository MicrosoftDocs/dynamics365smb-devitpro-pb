---
title: "Date Data Type"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b179c72d-48ea-4015-bb76-c60a3b459c70
caps.latest.revision: 21
author: SusanneWindfeldPedersen
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---
# Date Data Type
Denotes a date ranging from January 1, 1753 to December 31, 9999.  
  
The displayed text format of the date is determined by your Region and Language Format setting in Windows.  
  
## Undefined dates  
 An undefined or blank date is specified by 0D. The undefined date is considered to be before all other dates.  
  
## Normal dates and closing dates  
 All normal dates have a corresponding closing date. The closing date for a given date is defined as a period of time that follows a given normal date and precedes the next normal date.  
  
## Syntax
The syntax for defining DateTime format follows the [ISO standard](https://en.wikipedia.org/wiki/ISO_8601). 
- The syntax for defining Date format is `yyyymmddD`, where `D` is a mandatory letter. For example, `20180325D`, read as the 25th of March, 2018.

 To assign a normal date to a variable, use the following format: `yyyymmddD`.
 To assign a closing date to a variable, use the [CLOSINGDATE method (Date)](../methods/devenv-closingdate-method-date.md).  
  
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
This example shows a valid assignment of date. It requires that you define the following variable.  
 
|Variable|DataType|  
|--------|--------|  
|Date1   |Date    |  
  
This example is compiled and run on a computer with the regional format set to English (United States).

```  
Date1 := 20180612D;  
MESSAGE(FORMAT(Date1));  
```  
  
The message window displays the following:  
 **06/12/2018**  

## See Also  
[AL Data types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  