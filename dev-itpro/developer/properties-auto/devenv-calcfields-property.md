---
title: "CalcFields Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
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
# CalcFields Property
> **Version**: _Available from runtime version 1.0._

Sets a list of FlowFields to automatically calculate.

## Applies to
-   Xml Port Table Element
-   Report Data Item

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Syntax
```AL
CalcFields = Amount;
```

## Remarks  
The list of the FlowFields is the list of CalcFields that you can calculate. For that, [AutoCalcField property](devenv-autocalcfield-property.md) must be enabled. 
<!--
Notes from meeting: 
The list of FlowFields, what you describe here is just a list of fields that are CalcFields that you want to have calculated if you have [AutoCalcField property](devenv-autocalcfield-property.md) enabled. 
--> 
  
## See Also  
[AutoCalcField Property](devenv-autocalcfield-property.md)   
[FlowFields](../devenv-flowfields.md)   
[Properties](devenv-properties.md)  
[Create FlowFields and FlowFilters](../devenv-creating-flowfields-and-flowfilters.md)   
[CalcFormula](devenv-calcformula-property.md)  
[FlowFilter Overview](../devenv-flowfilter-overview.md)  