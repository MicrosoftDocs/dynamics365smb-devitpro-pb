---
title: "COUNT Function (FilterPageBuilder)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ae7d1b03-4a3b-4cc5-b76f-ef8875dfe5b5
caps.latest.revision: 3
manager: edupont
---
# COUNT Function (FilterPageBuilder)
Gets the number of filter controls that are specified in the FilterPageBuilder object instance.  
  
## Syntax  
  
```  
  
Count := FilterPageBuilder.COUNT  
```  
  
## Return Value  
 Type: Integer  
  
 The number of filter controls in the current FilterPageBuilder object instance.  
  
## Example  
 The following example uses the COUNT function on a filter page object that includes a two filter controls for the **Date** system table.  
  
 This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [ADDFIELD Function](ADDFIELD-Function.md)   
 [ADDFIELDNO Function](ADDFIELDNO-Function.md)   
 [ADDRECORD Function](ADDRECORD-Function.md)   
 [ADDRECORDREF Function](ADDRECORDREF-Function.md)   
 [ADDTABLE Function](ADDTABLE-Function.md)   
 [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)   
 [SETVIEW Function](SETVIEW-Function.md)   
 [NAME Function \(FilterPageBuilder\)](NAME-Function--FilterPageBuilder-.md)   
 [RUNMODAL Function \(FilterPageBuilder\)](RUNMODAL-Function--FilterPageBuilder-.md)