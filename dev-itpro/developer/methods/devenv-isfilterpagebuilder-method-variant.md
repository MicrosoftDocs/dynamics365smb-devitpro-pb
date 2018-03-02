---
title: "ISFILTERPAGEBUILDER Method (Variant)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 633646e7-72d6-4aab-a2f0-e8d4c561d37e
caps.latest.revision: 2
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ISFILTERPAGEBUILDER Method (Variant)
Indicates whether an AL variant contains a FilterPageBuilder variable.  
  
## Syntax  
  
```  
Ok := Variant.ISFILTERPAGEBUILDER  
```  
  
#### Parameters  
 Type: Variant  
  
## Return Value  
 Type: Boolean  
  
 **True** if the AL variant contains a FilterPageBuilder variable; otherwise, **false**.  
  
## Example  
 The following example uses the ISFILTERPAGEBUILDER method on a filter page object that includes a filter control for the **Date** system table.  
  
 This example requires that you create the following global variables.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varFilterPageBuilder|FilterPageBuilder||  
|myVariant|Variant||  
  
```  
varDateItem := 'Date record';  
varFilterPageBuilder.ADDTABLE(varDateItem + ‘ 1’,DATABASE::Date);  
myVariant := varFilterPageBuilder;  
IF not myVariant.ISFILTERPAGEBUILDER THEN   
  ERROR(‘This variant should contain a FilterPageBuilder variable’);  
  
```  
  
## See Also  
 [Variant Data Type](../datatypes/devenv-Variant-Data-Type.md)   
 [FilterPageBuilder Data Type](../datatypes/devenv-FilterPageBuilder-Data-Type.md)   
 [ADDFIELD Method](devenv-ADDFIELD-Method.md)   
 [ADDFIELDNO Method](devenv-ADDFIELDNO-Method.md)   
 [ADDRECORD Method](devenv-ADDRECORD-Method.md)   
 [ADDRECORDREF Method](devenv-ADDRECORDREF-Method.md)   
 [ADDTABLE Method](devenv-ADDTABLE-Method.md)   
 [GETVIEW method \(FilterPageBuilder\)](devenv-GETVIEW-Method-FilterPageBuilder.md)   
 [SETVIEW Method](devenv-SETVIEW-Method.md)   
 [COUNT Method \(FilterPageBuilder\)](devenv-COUNT-Method-FilterPageBuilder.md)   
 [NAME Method \(FilterPageBuilder\)](devenv-NAME-Method-FilterPageBuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-RUNMODAL-Method-FilterPageBuilder.md)