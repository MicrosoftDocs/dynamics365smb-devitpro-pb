---
title: "SETVIEW Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 01c22c94-f8c8-498f-8212-389647ca789a
caps.latest.revision: 3
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETVIEW Method
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
  
 This value must match the value of the *ItemName* parameter that was specified by ADDTABLE, ADDRECORD, or ADDRECORDREF method that adds the table to the filter control.  
  
 *View*  
 Type: Text  
  
 The filter view to apply. This can be the output of the [GETVIEW Method \(Record\)](devenv-GETVIEW-Method-Record.md) or[GETVIEW Method \(RecordRef\)](devenv-GETVIEW-Method-RecordRef.md) .  
  
## Return Value  
 Type: Boolean  
  
 **True** if view was applied to the specified filter control; otherwise, **false**.  
  
## Remarks  
 The filter control that is specified by *ItemName* must already exist in the FilterPageBuilder object before the ADDFIELDNO method is called. Either the ADDTABLE, ADDRECORD, or ADDRECORDREF methods must be called before the SETVIEW method.  
  
 The SETVIEW method will overwrite any previously defined filters for the fields that are also included in the view.  
  
## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view from the GETVIEW method.  
  
 This example requires that you create the following global variables.  
  
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
 [ADDFIELD Method](devenv-addfield-method.md)   
 [ADDFIELDNO Method](devenv-addfieldno-method.md)   
 [ADDRECORDREF Method](devenv-addrecordref-method.md)   
 [ADDTABLE Method](devenv-addtable-method.md)   
 [GETVIEW Method \(FilterPageBuilder\)](devenv-getview-method-filterpagebuilder.md)   
 [SETVIEW Method](devenv-setview-method.md)   
 [COUNT Method \(FilterPageBuilder\)](devenv-count-method-filterpagebuilder.md)   
 [NAME Method \(FilterPageBuilder\)](devenv-name-method-filterpagebuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-runmodal-method-filterpagebuilder.md)