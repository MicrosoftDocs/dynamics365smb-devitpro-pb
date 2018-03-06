---
title: "ADDFIELD Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0d9238f4-d428-4519-8da2-d79b058df9cb
caps.latest.revision: 4
manager: edupont
---
# ADDFIELD Function
Adds a table field to the filter control for a table on filter page.  
  
## Syntax  
  
```  
[Ok :=] FilterPageBuilder.ADDFIELD(ItemName, Field[,Filter])  
```  
  
#### Parameters  
 *ItemName*  
 Type: Text  
  
 The name that is assigned to the table in the filter control. This value must match the value of the *ItemName* parameter that was specified by ADDTABLE,  ADDRECORD, or ADDRECORDREF function that adds the table to the filter control.  
  
 *Field*  
 Type: Field  
  
 The name of the table field to add to the filter control for a table.  
  
 *Filter*  
 Type: Text  
  
 A default filter on the field that is specified by the *Field* parameter.  
  
## Return Value  
 Type: Boolean  
  
 **true** if the field was added to the field list for the specified filter control; otherwise, **false**.  
  
## Remarks  
 The filter control that specified by *ItemName* parameter must already exist in the FilterPageBuilder object before the ADDFIELD function is called. This means that either the ADDTABLE, ADDRECORD, or ADDRECORDREF functions must be called before the ADDFIELD function.  
  
 If the filter page implementation will call a SETVIEW function, then the SETVIEW function must be called before the ADDFIELD function call, otherwise the filter that is specified by the *Filter* parameter will be cleared by SETVIEW.  
  
 The filter that is specified by the *Filter* parameter will overwrite any previously defined filters for the field which were set by ADDVIEW function or read from the record or recordRef instance that defined the filter control.  
  
## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two fields of the **Date** record variable which will be available in the filter control on the filter page: **Period End** and **Period Start**. A default filter is set on the **Period End** field.  
  
 This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varDateRecord|Record|Date|  
|varFilterPageBuilder|FilterPageBuilder||  
  
```  
varDateItem := 'Date record';  
varFilterPageBuilder.ADDRECORD(varDateItem, varDateRecord);  
varFilterPageBuilder.ADDFIELD(varDateItem, varDateRecord."Period End",'12122015D');  
varFilterPageBuilder.ADDFIELD(varDateItem, varDateRecord."Period Start");  
  
```  
  
## See Also  
 [ADDFIELD Function](ADDFIELD-Function.md)   
 [ADDFIELDNO Function](ADDFIELDNO-Function.md)   
 [ADDRECORD Function](ADDRECORD-Function.md)   
 [ADDRECORDREF Function](ADDRECORDREF-Function.md)   
 [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)   
 [SETVIEW Function](SETVIEW-Function.md)   
 [COUNT Function \(FilterPageBuilder\)](COUNT-Function--FilterPageBuilder-.md)   
 [NAME Function \(FilterPageBuilder\)](NAME-Function--FilterPageBuilder-.md)   
 [RUNMODAL Function \(FilterPageBuilder\)](RUNMODAL-Function--FilterPageBuilder-.md)