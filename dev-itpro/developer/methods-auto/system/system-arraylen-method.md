---
title: "System.ArrayLen Method"
description: "Returns the total number of elements in an array or the number of elements in a specific dimension."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# System.ArrayLen Method
> **Version**: _Available or changed with runtime version 1.0._

Returns the total number of elements in an array or the number of elements in a specific dimension.


## Syntax
```AL
Length :=   System.ArrayLen(Array: Array of [Any] [, Dimension: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Array*  
&emsp;Type: [Any](../any/any-data-type.md)  
The array that you want to investigate.
        
*[Optional] Dimension*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
If you omit this optional argument, the method returns the total number of elements in the array. To get the number of elements in a specific dimension, use Dimension with a valid value. The valid values are determined by the number of dimensions of the input array. For example, the valid values for a three-dimensional array would be 1, 2, and 3.  


## Return Value
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you use ArrayLen with an input parameter that is not an array, a run-time error occurs.  
  
## Example

This example shows how to use the ArrayLen method.  
  
```al
var
    Array1: array[2] of Integer;
    Array2: array[3,4] of Integer;
begin
    Message('Array1, Total number of elements: %1', ArrayLen(Array1));  
    Message('Array2, Dimension 1 size: %1', ArrayLen(Array2,1));  
    Message('Array2, Dimension 2 size: %1', ArrayLen(Array2,2));  
    Message('Array2, Total number of elements: %1', ArrayLen(Array2));  
end;
```  
  
The following messages are displayed.  
  
**Array1, Total number of elements: 2**  
  
**Array2, Dimension 1 size: 3**  
  
**Array2, Dimension 2 size: 4**  
 
**Array2, Total number of elements: 12**  


## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)