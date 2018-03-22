---
title: "COUNT Method (FilterPageBuilder)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ae7d1b03-4a3b-4cc5-b76f-ef8875dfe5b5
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COUNT Method (FilterPageBuilder)
Gets the number of filter controls that are specified in the FilterPageBuilder object instance.  
  
## Syntax  
  
```  
  
Count := FilterPageBuilder.COUNT  
```  
  
## Return Value  
 Type: Integer  
  
 The number of filter controls in the current FilterPageBuilder object instance.  
  
## Example  
 The following example uses the COUNT method on a filter page object that includes a two filter controls for the **Date** system table.  
  
 This example requires that you create the following global variables.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varCount|Integer|Date|  
|varFilterPageBuilder|FilterPageBuilder||  
  
```  
varDateItem := 'Date record';  
varFilterPageBuilder.ADDTABLE(varDateItem + ‘ 1’,DATABASE::Date);  
varFilterPageBuilder.ADDTABLE(varDateItem + ‘ 2’,DATABASE::Date);  
varCount := varFilterPageBuilder.COUNT;  
IF varCount <> 2 THEN   
  ERROR(‘There should be two controls in varFilterPageBuilder’);  
```  
  
## See Also  
 [ADDFIELD Method](devenv-ADDFIELD-Method.md)   
 [ADDFIELDNO Method](devenv-ADDFIELDNO-Method.md)   
 [ADDRECORD Method](devenv-ADDRECORD-Method.md)   
 [ADDRECORDREF Method](devenv-ADDRECORDREF-Method.md)   
 [ADDTABLE Method](devenv-ADDTABLE-Method.md)   
 [GETVIEW method \(FilterPageBuilder\)](devenv-GETVIEW-Method-FilterPageBuilder.md)   
 [SETVIEW Method](devenv-SETVIEW-Method.md)   
 [NAME Method \(FilterPageBuilder\)](devenv-NAME-Method-FilterPageBuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-RUNMODAL-Method-FilterPageBuilder.md)