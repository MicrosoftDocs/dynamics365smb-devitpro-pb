---
title: "System.Date2DMY Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Date2DMY Method
Gets the day, month, or year of a Date Data Type.


## Syntax
```
Number :=   System.Date2DMY(Date: Date, Value: Integer)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The input date.  
*Value*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


## Return Value
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example  
 This example shows how to use the **DATE2DMY** method.
 
```  
var
    InputDate: Date;
    Day: Integer;
    Month: Integer;
    Year: Integer;
    Text000: Label 'Today is day %1 of month %2 of the year %3.';
begin
    InputDate := TODAY;  
    Day := DATE2DMY(InputDate,1);  
    Month := DATE2DMY(InputDate,2);  
    Year := DATE2DMY(InputDate,3);  
    MESSAGE(Text000,Day,Month,Year); 
end; 
```  
  
 The message window displays the following:  
  
 **Today is day 16 of month 2 of the year 2014.**  
 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)