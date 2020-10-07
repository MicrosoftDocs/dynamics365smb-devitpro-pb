---
title: "CalcFields Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 88fa557c-b6e7-4974-871f-6b2af85c284d
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

# CalcFields Property
Sets a list of FlowFields to automatically calculate.  
  
## Applies to  
  
-   Reports  
-   Table elements in XMLports

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