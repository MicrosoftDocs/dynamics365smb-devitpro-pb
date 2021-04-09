---
title: "System.DMY2Date Method"
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
# System.DMY2Date Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a Date object based on a day, month, and year.


## Syntax
```
Date :=   System.DMY2Date(Day: Integer [, Month: Integer] [, Year: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Day*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the day in the month (1-31)
        
*Month*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the month in the year (1-12). If you omit this optional parameter, the current month will be used as the default.
        
*Year*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The four-digit number of the year. If you omit this optional parameter, the current year is used as the default.  


## Return Value
*Date*
&emsp;Type: [Date](../date/date-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 
```al
var
    Day: Integer;
    Month: Integer;
    Year: Integer;
    OutputDate: Date;
    Text000: Label "Day number %1, month number %2, and year number %3 corresponds to the date %4.";  
begin  
    Day := 17;  
    Month := 2;  
    Year := 2014;  
    OutputDate := DMY2Date(Day, Month, Year);  
    Message(Text000, Day, Month, Year, OutputDate);  
end;
```  
  
On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
**Day number 17, month number 2, and year number 2014 corresponds to the date 02/17/14.**
 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)