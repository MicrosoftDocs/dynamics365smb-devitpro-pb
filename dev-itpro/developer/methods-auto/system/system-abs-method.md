---
title: "System.Abs Method"
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
# System.Abs Method
Calculates the absolute value of a number (Decimal, Integer or BigInteger). ABS always returns a positive numeric value or zero.


## Syntax
```
NewNumber :=   System.Abs(Number: Decimal)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Number*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
The input value.  


## Return Value
*NewNumber*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks 
The system automatically converts all of the numeric data types for you.

## Example 

This example shows how to remove the sign from a negative numeric value. 

```  
var
    x: Decimal;
    y: Decimal;
    Text000: Label "x = %1, y = %2";
begin
    x := -10.235; // x is assigned a negative value  
    y := ABS(x); // y is assigned the value of x without sign  
    MESSAGE(Text000, x, y);  
end;
```  

 The message window displays the following:  

 **x = -10.235, y = 10.235**  

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)