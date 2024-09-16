---
title: "MinOccurs Property"
description: "Sets the minimum number of times that an element can occur."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# MinOccurs Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the minimum number of times that an element can occur.

## Applies to
-   Xml Port Text Element
-   Xml Port Field Element
-   Xml Port Table Element

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Zero**|runtime version 1.0|There is no minimum number of occurrences.|
|**Once**|runtime version 1.0|The element must occur at least once.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
MinOccurs = Zero;
```
 
## Remarks

The maximum number of times an element can appear is determined by the value of the [MaxOccurs Property](devenv-maxoccurs-property.md). The **MinOccurs** and **MaxOccurs** properties conform to the standard occurrence constraints that are used when defining XML schemas.  
  
If you use Lazy API for XML (LAX), then the minimum number is 1. If you do not use LAX, then the minimum number is 0.  
  
The maximum number can be either 1 or infinite.  
  
## See Also  

[MaxOccurs Property](devenv-maxoccurs-Property.md)
