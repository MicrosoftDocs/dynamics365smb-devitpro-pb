---
title: "Date Data Type"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# Date Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a date ranging from January 1, 1753 to December 31, 9999.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The displayed text format of the date is determined by your Region and Language Format setting in Windows.  
  
## Undefined dates

An undefined or blank date is specified by 0D. The undefined date is considered to be before all other dates.  
  
## Normal dates and closing dates  

All normal dates have a corresponding closing date. The closing date for a given date is defined as a period of time that follows a given normal date and precedes the next normal date.  
  
## Syntax

The syntax for defining DateTime format follows the [ISO standard](https://en.wikipedia.org/wiki/ISO_8601). 
- The syntax for defining Date format is `yyyymmddD`, where `D` is a mandatory letter. For example, `20180325D`, read as the 25th of March, 2018.

To assign a normal date to a variable, use the following format: `yyyymmddD`. 
  
## Storing dates in the SQL server database

SQL Server stores information about both date and time in columns of the DateTime types. For date fields, [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] uses only the date and uses a constant value for the time. For a normal date, this constant value contains 00:00:00:000. For a closing date, it contains 23:59:59:000.  
  
The [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] undefined date is represented by the earliest valid date in SQL Server. The earliest valid date in SQL Server for a DateTime is 01-01-1753 00:00:00:000.  
  
If you store a date in the database that is outside the valid range for a SQL DateTime, a run-time error occurs.  

## Example

This example shows a valid assignment of date. This example is compiled and run on a computer with the regional format set to English (United States).

```al
var
    Date1: Date;
begin
    Date1 := 20180612D;  
    Message(Format(Date1));  
end;
```  
  
The message window displays the following:  
  
**06/12/2018**
  
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  