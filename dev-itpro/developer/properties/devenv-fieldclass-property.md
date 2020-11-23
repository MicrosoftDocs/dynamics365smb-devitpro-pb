---
title: "FieldClass Property"
ms.author: solsen
ms.custom: na
ms.date: 11/17/2020
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
# FieldClass Property
> **Version**: _Available from runtime version 1.0._

Sets the class of the field.

## Applies to
-   Table Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Normal**|A data entry field.|
|**FlowField**|A calculated field.|
|**FlowFilter**|To compute the results of FlowFields.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Syntax

```AL
FieldClass = FlowFilter;
```  

## Remarks  

There are three classes of fields: Normal, FlowFields, and FlowFilters. For more information, see [FlowFields](../devenv-flowfields.md) and [FlowFilter Overview](../devenv-flowfilter-overview.md).  
  
## See Also
  
[Properties](devenv-properties.md)   
 