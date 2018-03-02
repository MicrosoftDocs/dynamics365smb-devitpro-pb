---
title: "NAME Function (FilterPageBuilder)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 89cbb4b3-781d-4a8b-b336-64f552b38a29
caps.latest.revision: 3
manager: edupont
---
# NAME Function (FilterPageBuilder)
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
 The following example initializes a filter page object that includes two filter controls for the **Date** system table. The NAME function returns the names of filter control in a message dialog box.  
  
 This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [ADDFIELD Function](ADDFIELD-Function.md)   
 [ADDFIELDNO Function](ADDFIELDNO-Function.md)   
 [ADDRECORD Function](ADDRECORD-Function.md)   
 [ADDRECORDREF Function](ADDRECORDREF-Function.md)   
 [ADDTABLE Function](ADDTABLE-Function.md)   
 [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)   
 [SETVIEW Function](SETVIEW-Function.md)   
 [COUNT Function \(FilterPageBuilder\)](COUNT-Function--FilterPageBuilder-.md)   
 [RUNMODAL Function \(FilterPageBuilder\)](RUNMODAL-Function--FilterPageBuilder-.md)