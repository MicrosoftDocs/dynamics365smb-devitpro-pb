---
title: "COPYARRAY Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d1c55795-ca34-4d88-bf09-713b8f47f755
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COPYARRAY Method
Copies one or more elements in an array to a new array.  

## Syntax  

```  

COPYARRAY(NewArray, Array, Position[, Length])  
```  

#### Parameters  
 *NewArray*  
 Type: Array  

 The array to copy to; the destination array.  

 *Array*  
 Type: Array  

 The array to copy from; the source array.  

 *Position*  
 Type: Integer  

 The position of the first array element to copy.  

 *Length*  
 Type: Integer  

 The number of array elements to copy. If you do not specify *Length*, all array elements are copied from *Position* to the last element. Use the following equation to determine valid values.  

 1 =\< LENGTH =\< MAXLEN\(ARRAY\) – POSITION + 1  

## Remarks  
 You can only copy from one-dimensional arrays. Repeat the COPYARRAY method to copy two-dimensional and three-dimensional arrays.  

 You cannot copy an array if the data type of the array is a complex data type. For more information about complex data types, see [AL Data Types](../datatypes/devenv-al-data-types.md).  

## Example  
 The following example assigns values to Array1 and copies values from Array1 to Array2. Array1 is an integer array with the [Dimensions Property](../properties/devenv-Dimensions-Property.md) set to 10. It contains integers from 1 to 10. The example code copies the numbers 6, 7, 8, 9, and 10 to Array2, an integer array with the **Dimensions** property set to 5. This example requires that you create the following global variables.  

|Variable name|DataType|Dimension|  
|-------------------|--------------|---------------|  
|Array1|Integer|10|  
|Array2|Integer|5|  

```  
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
```  

## Example  
 If Array1 is an integer array with dimension 10, and it contains the numbers from 1 to 10, and Array2 is an integer array with dimension 5, then the following command causes a run-time error.  

```  
COPYARRAY(Array2,Array1,3);  
```  

 The error occurs because the code attempts to copy eight elements from Array1 to Array2, and Array2 has room for only five elements.  

## See Also  
 [ARRAYLEN Method](devenv-ARRAYLEN-Method.md)   
 [COMPRESSARRAY Method](devenv-COMPRESSARRAY-Method.md)
