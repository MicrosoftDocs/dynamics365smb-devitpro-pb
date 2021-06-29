---
title: "System.CopyArray Method"
description: "Copies one or more elements in an array to a new array."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# System.CopyArray Method
> **Version**: _Available or changed with runtime version 1.0._

Copies one or more elements in an array to a new array.


## Syntax
```
 System.CopyArray(NewArray: Array of [Any], Array: Array of [Any], Position: Integer [, Length: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*NewArray*  
&emsp;Type: [Any](../any/any-data-type.md)  
The array to copy to; the destination array.
        
*Array*  
&emsp;Type: [Any](../any/any-data-type.md)  
  
*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position of the first array element to copy.
        
*[Optional] Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of array elements to copy. If you do not specify Length, all array elements are copied from Position to the last element. Use the following equation to determine valid values.
1 =\< LENGTH =\< MAXLEN(ARRAY) - POSITION + 1
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can only copy from one-dimensional arrays. Repeat the CopyArray method to copy two-dimensional and three-dimensional arrays.  

You cannot copy an array if the data type of the array is a complex data type. For more information about complex data types, see [AL Data Types](../library.md).  

## Example 1

The following example assigns values to Array1 and copies values from Array1 to Array2. Array1 is an integer array with the [Dimensions Property](../../properties/devenv-properties.md) set to 10. It contains integers from 1 to 10. The example code copies the numbers 6, 7, 8, 9, and 10 to Array2, an integer array with the **Dimensions** property set to 5. 

```al
var
    Array1: array[10] of Integer;
    Array2: array[5] of Integer;
begin
    Array1[1] := 1;  
    Array1[2] := 2;  
    Array1[3] := 3;  
    Array1[4] := 4;  
    Array1[5] := 5;  
    Array1[6] := 6;  
    Array1[7] := 7;  
    Array1[8] := 8;  
    Array1[9] := 9;  
    Array1[10] := 10;  
    COPYARRAY(Array2,Array1,6,5);  
end;
```  

## Example 2

If Array1 is an integer array with dimension 10, and it contains the numbers from 1 to 10, and Array2 is an integer array with dimension 5, then the following command causes a run-time error.  

```al
CopyArray(Array2,Array1,3);  
```  

The error occurs because the code attempts to copy eight elements from Array1 to Array2, and Array2 has room for only five elements.  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)