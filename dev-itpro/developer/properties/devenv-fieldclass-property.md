---
title: "FieldClass Property"
description: "Sets the class of the field."
ms.author: solsen
ms.custom: na
ms.date: 12/08/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldClass Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the class of the field.

## Applies to
-   Table Field

## Property Value

|Value|CompatibilityInfo|Description|
|-----------|-----------|---------------------------------------|
|**Normal**|Available or changed with runtime version 1.0.|A data entry field.|
|**FlowField**|Available or changed with runtime version 1.0.|A calculated field.|
|**FlowFilter**|Available or changed with runtime version 1.0.|To compute the results of FlowFields.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
FieldClass = FlowFilter;
```  

## Remarks  

There are three classes of fields: Normal, FlowFields, and FlowFilters. For more information, see [FlowFields](../devenv-flowfields.md) and [FlowFilter Overview](../devenv-flowfilter-overview.md).  
  
## See Also
  
[Properties](devenv-properties.md)   
 