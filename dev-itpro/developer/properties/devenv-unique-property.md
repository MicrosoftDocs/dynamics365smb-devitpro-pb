---
title: "Unique Property"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Unique Property
Sets whether a key is  should be automatically calculated. 

<!--
AutoCalcField is correlated with [CalcFields property](devenv-calcfields-proeprty.md) because CalcField is just a list of fields and these types that are calculated fields of FlowFields types. 
-->
  
## Applies To  
  
-   Report columns  
  
-   XMLports  
  
## Property Value  
 **True** if the FlowField is automatically calculated; otherwise, **false**. The default is **true**.  

## Remarks
FlowFields has an effect if the associated data source is a calculated value of the FlowFields.
<!--  
FlowFields has an effect if the associated data source is a calculated value of the FlowFields.
-->


## See Also  
[FlowFields](../devenv-flowfields.md)   
[Create FlowFields and FlowFilters](../devenv-creating-flowfields-and-flowfilters.md)   
[CalcFormula](devenv-calcformula-property.md)  
[FlowFilter Overview](../devenv-flowfilter-overview.md)   
[CalcFields Property](devenv-calcfields-property.md)