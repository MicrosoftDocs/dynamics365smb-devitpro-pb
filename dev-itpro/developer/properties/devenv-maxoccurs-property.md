---
title: "MaxOccurs Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# MaxOccurs Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that indicates the maximum number of times an element can occur.

## Applies to
-   Xml Port Text Element
-   Xml Port Table Element
-   Xml Port Field Element

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Once**|The element can occur at most once.|
|**Unbounded**|There is no maximum number of occurences.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


The default values are the following:

|**SourceType**|**Default**|  
|--------------|-----------|  
|**Table**|Unbounded|  
|**Text**|Unbounded|  
|**Field**|Once|  

## Syntax

```AL
MaxOccurs = Once;
```
 
## Remarks

The default value of the **MaxOccurs** property varies depending on the type of this element.  
  
The minimum number of times an element can appear is determined by the value of the [MinOccurs Property](devenv-minoccurs-property.md).  
  
The **MinOccurs** and **MaxOccurs** properties conform to the standard occurrence constraints that are used when defining XML schemas.  
  
The minimum number can be either 1 or 0.  
  
The maximum number can be either 1 or infinite.  
  
## See Also  

[Properties](devenv-properties.md)