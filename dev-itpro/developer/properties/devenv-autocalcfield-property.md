---
title: "AutoCalcField Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 25e52e9d-cdaf-4f35-bf27-25a8465d595e
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

<!--
Ask for the file Niels had prepared for the meeting. 
-->

# AutoCalcField Property
Sets whether FlowFields should be automatically calculated. 

<!--
AutoCalcField is correlated with [CalcFields property](devenv-calcfields-proeprty.md) because CalcField is just a list of fields and these types that are calculated fields of FlowFields types. 
-->
  
## Applies To  
  
-   Report columns
-   Field elements in XMLports
-   Field attributes in XMLports
  
## Property Value  
 **True** if the FlowField is automatically calculated; otherwise, **false**. The default is **true**.  

## Syntax
```
AutoCalcField = false;
```

## Remarks
FlowFields have an effect if the associated data source is a calculated value of the FlowFields.
<!--  
FlowFields has an effect if the associated data source is a calculated value of the FlowFields.
-->


## See Also  
[FlowFields](../devenv-flowfields.md)   
[Create FlowFields and FlowFilters](../devenv-creating-flowfields-and-flowfilters.md)   
[CalcFormula Property](devenv-calcformula-property.md)  
[FlowFilter Overview](../devenv-flowfilter-overview.md)   
[CalcFields Property](devenv-calcfields-property.md)