---
title: "SETVIEW Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 01c22c94-f8c8-498f-8212-389647ca789a
caps.latest.revision: 3
manager: edupont
---
# SETVIEW Function
Sets the current filter view, which defines the sort order, key, and filters, for a record in a filter control on a filter page.  
  
 The view contains all fields that have default filters, but does not contain fields without filters.  
  
## Syntax  
  
```  
[Ok :=] FilterPageBuilder.SETVIEW(ItemName, View)  
```  
  
#### Parameters  
 *ItemName*  
 Type: Text or Code  
  
 The name that is assigned to the filter control.  
  
 This value must match the value of the *ItemName* parameter that was specified by ADDTABLE, ADDRECORD, or ADDRECORDREF function that adds the table to the filter control.  
  
 *View*  
 Type: Text  
  
 The filter view to apply. This can be the output of the [GETVIEW Function \(Record\)](GETVIEW-Function--Record-.md) or[GETVIEW Function \(RecordRef\)](GETVIEW-Function--RecordRef-.md) .  
  
## Return Value  
 Type: Boolean  
  
 **true** if view was applied to the specified filter control; otherwise, **false**.  
  
## Remarks  
 The filter control that is specified by *ItemName* must already exist in the FilterPageBuilder object before the ADDFIELDNO function is called. Either the ADDTABLE, ADDRECORD, or ADDRECORDREF functions must be called before the SETVIEW function.  
  
 The SETVIEW function will overwrite any previously defined filters for the fields that are also included in the view.  
  
## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view from the GETVIEW function.  
  
 This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varDateRecord|Record|Date|  
|varFilterPageBuilder|FilterPageBuilder||  
|varDefaultView|Text||  
  
```  
varDateItem := 'Date record';  
varDateRecord.SETFILTER("Period End", '12122015D');  
varDateRecord.SETFILTER("Period Start", '01012015D');  
varDefaultView := varDateRecord.GETVIEW;  
varFilterPageBuilder.ADDTABLE(varDateItem, DATABASE::Date);  
varFilterPageBuilder.SETVIEW(varDateItem, varDefaultView);  
```  
  
## See Also  
 [ADDFIELD Function](ADDFIELD-Function.md)   
 [ADDFIELDNO Function](ADDFIELDNO-Function.md)   
 [ADDRECORD Function](ADDRECORD-Function.md)   
 [ADDRECORDREF Function](ADDRECORDREF-Function.md)   
 [ADDTABLE Function](ADDTABLE-Function.md)   
 [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)   
 [COUNT Function \(FilterPageBuilder\)](COUNT-Function--FilterPageBuilder-.md)   
 [NAME Function \(FilterPageBuilder\)](NAME-Function--FilterPageBuilder-.md)   
 [RUNMODAL Function \(FilterPageBuilder\)](RUNMODAL-Function--FilterPageBuilder-.md)