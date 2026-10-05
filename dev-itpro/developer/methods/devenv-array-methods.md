---
title: Array Data Type and Methods in AL
description: Use arrays in AL for Business Central, including declaration syntax, dimensions, index ranges, size limits, supported element types, and array methods.
ms.date: 10/05/2026
ms.topic: reference
author: SusanneWindfeldPedersen
---

# Work with arrays in AL

An array is a data structure that contains many variables, which are accessed through computed indices. An index is the location of the variable stored in an array. The variables contained in an array are also called the elements of the array. The array always stores elements of the same data type.

The rank of an array is its number of dimensions. Accessing an individual element requires one index for each dimension. An array with a rank of one is called a single-dimensional array. An array with a rank greater than one is called a multidimensional array. Specific-sized multidimensional arrays are often referred to as two-dimensional arrays, three-dimensional arrays, and so on. Each dimension has a positive integer length. The maximum number of dimensions is 10, and the total number of elements in all dimensions is 1,000,000.

The length of a dimension determines the valid range of indices for that dimension. For a dimension of length `N`, valid indices range from `1` through `N`, inclusive. The total number of elements in an array is the product of the lengths of each dimension. AL doesn't support zero-length array dimensions.

## Syntax 

The syntax for declaring an array of a specific type is the following:

```AL
array [Dimension] of Type;
```

The `Dimension` is a comma-delimited list of integer literals greater than 0, where each integer defines the number of elements in that dimension. 

The `Type` is the element type of the array.

## Code example 

The following code sample shows the declaration of an array with a simple element type.

```AL
arrayOfInteger: array [10] of Integer;
```

The following code sample shows the declaration of an array with an element type of a fixed length.

```AL
arrayOfCode: array [10] of Code[20];
arrayOfText: array [10] of Text[20];
```

The following code sample shows the declaration of an array with a complex element type.

```AL
arrayOfCodeunits: array [10] of Codeunit "Type Helper";
arrayOfQueries: array [10] of Query "Sales Opportunities";
arrayOfTemporaryRecords: array [10] of Record "Shipment Method" temporary;
arrayOfJsonObjects: array [10] of JsonObject;
```

## Methods

The following AL methods for arrays are available:  

[ArrayLen method](../methods-auto/system/system-arraylen-method.md)  
[CompressArray method](../methods-auto/system/system-compressarray-method.md)  
[CopyArray method](../methods-auto/system/system-copyarray-method.md)

## Array of temporary records

The following code sample shows the declaration of an array of temporary Item records:

```AL
itemRecArrayTemp: array[2] of Record Item temporary;
```

In this case, each array element contains a temporary `Item` record that references the same temporary table. An insert into `itemRecArrayTemp[1]` is also reflected in `itemRecArrayTemp[2]`.

This is the same behavior as using [Copy(RecordRef [, Boolean])](../methods-auto/recordref/recordref-copy-recordref-boolean-method.md) with the `ShareTable` parameter set to `true`.

## Related information  

[AL Method Reference](../methods-auto/library.md)  
