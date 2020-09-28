---
title: "Array Methods"
description: "Methods of the type array in AL for Business Central"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: c4141c46-ce87-480a-98eb-390a0fe0573b
author: SusanneWindfeldPedersen
---

# Array Methods

An array is a data structure that contains a number of variables which are accessed through computed indices. The variables contained in an array, also called the elements of the array, are all of the same type, and this type is called the element type of the array.

An array has a rank which determines the number of indices associated with each array element. The rank of an array is also referred to as the dimensions of the array. An array with a rank of one is called a single-dimensional array. An array with a rank greater than one is called a multi-dimensional array. Specific sized multi-dimensional arrays are often referred to as two-dimensional arrays, three-dimensional arrays, and so on. Each dimension of an array has an associated length which is an integral number greater than or equal to zero. The maximum number of dimensions is 10 and the total number of elements in all dimensions is 1,000,000.

The length of a dimension determines the valid range of indices for that dimension. For a dimension of length N, indices can range from **1 to N** inclusive. The total number of elements in an array is the product of the lengths of each dimension in the array. If one or more of the dimensions of an array have a length of zero, the array is considered to be empty.

## Syntax 

The syntax for declaring an array of a specific type is the following:
```
Array [Dimension] of Type;
```

The `Dimension` is a comma-delimited list of integer literals greater than 0, where each integer defines the number of elements in that dimension. 

The `Type` is the element type of the array.

## Code example 
The following code sample shows the declaration of an array with a simple element type.

```
ArrayOfInteger: Array [10] of Integer;
```

The following code sample shows the declaration of an array with an element type of a fixed length.

```
ArrayOfCode: Array [10] of Code[20];
ArrayOfText: Array [10] of Text[20];
```

The following code sample shows the declaration of an array with a complex element type.

```
ArrayOfCodeunits: Array [10] of Codeunit 10;
ArrayOfQueryes: Array [10] of Query "My Query";
ArrayOfTemporaryRecords: Array [10] of Record 10 Temporary;
ArrayOfDotNetVariables: Array [10] of DotNet String;
```

## Methods
The following AL methods for arrays are available:  

[ArrayLen Method](../methods-auto/system/system-arraylen-method.md) 

[CompressArray Method](../methods-auto/system/system-compressarray-method.md)

[CopyArray Method](../methods-auto/system/system-copyarray-method.md)

## See Also  

[AL Method Reference](../methods-auto/library.md)  
