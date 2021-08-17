---
title: "System.ClosingDate(Date) Method"
description: "Gets the closing date for a Date Data Type."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# System.ClosingDate(Date) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the closing date for a Date Data Type.


## Syntax
```AL
ClosingDate :=   System.ClosingDate(Date: Date)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The input date.  


## Return Value
*ClosingDate*  
&emsp;Type: [Date](../date/date-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

All dates have a corresponding closing date. A closing date is a period in time following the given date but before the next regular date. Closing dates are sorted immediately after the corresponding regular date but before the next regular date.  
  
xxxxxxD: Regular date  
  
xxxxxxC: Closing date  
  
The compiler cannot convert the expression xxxxxxC to a Date data type. Therefore, you must use the ClosingDate method to create a closing date.  
  
## Example 1

The first example shows how to use the ClosingDate method. A regular date is given as input. 

```al
var
    Date1: Date;
    CloDate: Date;
    Text000: Label 'The closing date for %1 is %2.';
begin
    Date1 := 20140404D;  
    CloDate := ClosingDate(Date1);  
    Message(Text000, Date1, CloDate);  
end;
```  
  
The following message is displayed:  
  
**The closing date for 04/04/14 is C04/04/14.**  
  
## Example 2

The second example shows some statements that do not work and explains why they do not work. 
 
```al
var
    Date1: Date;
    CloDate1: Date;
    CloDate2: Date;
    Text000: Label 'The closing date for %1 is %2.';
begin
    // Date1 := 20140404C;  
    // The previous statement does not compile because the compiler   
    // cannot convert '20140404C' to a Date data type.  
    Date1 := 20140404D;  
    // The previous statement compiles.   
    // The compiler converts '20140404D' to a Date data type.  
    // CloDate1 := ClosingDate(20140505C);  
    // The previous statement does not compile because the compiler   
    // cannot convert '20140505C' to a Date data type and the ClosingDate   
    // method requires a Date data type for its parameter.  
    CloDate1 := ClosingDate(Date1);  
    // The previous statement compiles.  
    // Date1 is a Date data type.   
    CloDate2 := ClosingDate(CloDate1);  
    // The previous statement compiles.  
    // CloDate1 is a Date data type.  
    Message(Text001, CloDate1, CloDate2);  
end;
```  
  
The following message is displayed:  
  
**The closing date for C04/04/14 is C04/04/14.**  
  
## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)