---
title: "GETVIEW method (FilterPageBuilder)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e0011034-f0e8-4439-8d76-05761696f284
caps.latest.revision: 5
manager: edupont
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETVIEW method (FilterPageBuilder)
Gets the filter view \(which defines the sort order, key, and filters\) for the record in the specified filter control of a filter page.  

 The view contains all fields in the filter control that have a default filter value.  

## Syntax  

```  

View := FilterPageBuilder.GETVIEW(ItemName[, UseCaptions])  
```  

#### Parameters  
 *ItemName*  
 Type: Text or Code  

 The name of the filter control.  

 This value must match the value of the *ItemName* parameter that was specified by ADDTABLE, ADDRECORD, or ADDRECORDREF method that adds the table to the filter control.  

 *UseCaptions*  
 Type: Boolean  

 Specifies whether a field caption or field number should be returned.  

 This parameter is optional. If this parameter is **true** \(default value\) or if it is empty, then the returned string contains references to field captions in the table with which the record is associated. If this parameter is **false**, then the returned string contains references to field numbers.  

## Return Value  
 Type: Text  

 The view that is configured for the filter control that is identified by *ItemName*.  

## Remarks  
 The filter control that is specified by *ItemName* must already exist in the FilterPageBuilder object before the ADDFIELDNO method is called. Either the ADDTABLE, ADDRECORD, or ADDRECORDREF methods must be called before the GETVIEW method.  

## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view. The GETVIEW method is used to capture that filter view from the FilterPageBuilder object, and then apply it to the record.  

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
IF varFilterPageBuilder.RUNMODAL = TRUE THEN  
  varDateRecord.SETVIEW(varFilterPageBuilder.GETVIEW(varDateItem)); 

```  

## See Also  
 [ADDFIELD Method](devenv-ADDFIELD-Method.md)   
 [ADDFIELDNO Method](devenv-ADDFIELDNO-Method.md)   
 [ADDRECORD Method](devenv-ADDRECORD-Method.md)   
 [ADDRECORDREF Method](devenv-ADDRECORDREF-Method.md)   
 [ADDTABLE Method](devenv-ADDTABLE-Method.md)   
 [SETVIEW Method](devenv-SETVIEW-Method.md)   
 [COUNT Method \(FilterPageBuilder\)](devenv-COUNT-Method-FilterPageBuilder.md)   
 [NAME Method \(FilterPageBuilder\)](devenv-NAME-Method-FilterPageBuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-RUNMODAL-Method-FilterPageBuilder.md)
