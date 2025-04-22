---
title: "FieldClass property"
description: "Sets the class of the field."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldClass Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the class of the field.

## Applies to
-   Table field

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Normal**|runtime version 1.0|A data entry field.|
|**FlowField**|runtime version 1.0|A calculated field.|
|**FlowFilter**|runtime version 1.0|To compute the results of FlowFields.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
FieldClass = FlowFilter;
```  

## Remarks  

There are three classes of fields: Normal, FlowFields, and FlowFilters. For more information, see [FlowFields](../devenv-flowfields.md) and [FlowFilter Overview](../devenv-flowfilter-overview.md).  
  
## Related information
  
[Properties](devenv-properties.md)   
 