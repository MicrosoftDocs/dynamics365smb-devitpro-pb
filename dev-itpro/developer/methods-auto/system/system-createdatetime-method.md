---
title: "System.CreateDateTime Method"
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
# System.CreateDateTime Method
Creates a DateTime object from a date and a time.


## Syntax
```
Datetime :=   System.CreateDateTime(Date: Date, Time: Time)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The date that you want to use to create a DateTime. You cannot use an undefined date to create a DateTime.
          
*Time*  
&emsp;Type: [Time](../time/time-data-type.md)  
The time that you want to use to create a DateTime. You cannot use an undefined time to create a DateTime.
          


## Return Value
*Datetime*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  

```  
var
    TestDate: Date;
    TestTime: Time;
    TestDateTime: DateTime;
begin
    TestDate := TODAY;  
    TestTime := TIME;  
    TestDateTime := CREATEDATETIME(TestDate,TestTime);  
    …  
    TestDateTime := CREATEDATETIME(081111D,020000T);  
    …  
    TestDateTime := CREATEDATETIME(010101D,0T);  
end;
```  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)