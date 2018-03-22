---
title: "NAME Method (FilterPageBuilder)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 89cbb4b3-781d-4a8b-b336-64f552b38a29
caps.latest.revision: 3
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NAME Method (FilterPageBuilder)
Gets the name of a table filter control that is included on a filter page based on an index number that is assigned to the filter control.  
  
## Syntax  
  
```  
  
Name := FilterPageBuilder.NAME(Index)  
```  
  
#### Parameters  
 *Index*  
 Type: Integer  
  
 The index of a filter control. The value must be in the range 1 to N, where N is the number of filter controls on the filter page.  
  
## Return Value  
 Type: Text  
  
 The name of the filter control.  
  
## Example  
 The following example initializes a filter page object that includes two filter controls for the **Date** system table. The NAME method returns the names of filter control in a message dialog box.  
  
 This example requires that you create the following global variables.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varCount|Integer|Date|  
|varIndex|Integer||  
|varFilterPageBuilder|FilterPageBuilder||  
  
```  
varDateVariable := 'Date record';  
varFilterPageBuilder.ADDTABLE(varDateVariable + ‘ 1’,DATABASE::Date);  
varFilterPageBuilder.ADDTABLE(varDateVariable + ‘ 2’,DATABASE::Date);  
varCount := varFilterPageBuilder.COUNT;  
IF varCount <> 2 THEN   
  error(‘There should be two controls in FilterPageBuilder’);  
FOR varIndex := 1 to varCount do  
  MESSAGE(‘Control item %1 is named %2’, varIndex, varFilterPageBuilder.Name(varIndex));  
  
```  
  
## See Also  
 [ADDFIELD Method](devenv-ADDFIELD-Method.md)   
 [ADDFIELDNO Method](devenv-ADDFIELDNO-Method.md)   
 [ADDRECORD Method](devenv-ADDRECORD-Method.md)   
 [ADDRECORDREF Method](devenv-ADDRECORDREF-Method.md)   
 [ADDTABLE Method](devenv-ADDTABLE-Method.md)   
 [GETVIEW method \(FilterPageBuilder\)](devenv-GETVIEW-Method-FilterPageBuilder.md)   
 [SETVIEW Method](devenv-SETVIEW-Method.md)   
 [COUNT Method \(FilterPageBuilder\)](devenv-COUNT-Method-FilterPageBuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-RUNMODAL-Method-FilterPageBuilder.md)