---
title: "ADDFIELDNO Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 6ba0a312-b6a5-429d-b8b9-c4d1b4830a82
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ADDFIELDNO Method
Adds a table field to the filter control for a table on the filter page.  

## Syntax  

```  
[Ok :=] FilterPageBuilder.ADDFIELDNO(ItemName, FieldNo[,Filter])  
```  

#### Parameters  
 *ItemName*  
 Type: Text  

 The name that is assigned to the table in the filter control. This value must match the value of the *ItemName* parameter that was specified by ADDTABLE, ADDRECORD, or ADDRECORDREF method that adds the table to the filter control.  

 *FieldNo*  
 Type: Integer  

 The number that is assigned to the field in the table as specified by the [Field No. Property](../properties/devenv-Field-No.-Property.md).  

 *Filter*  
 Type: Text  

 A default filter on the field that is specified by the *Field* parameter.  

## Return Value  
 Type: Boolean  

 **True** if the field was added to the field list for the specified filter control; otherwise, **false**.  

## Remarks  
 The filter control that is specified by *ItemName* must already exist in the FilterPageBuilder object before the ADDFIELDNO method is called. This means that either the ADDTABLE, ADDRECORD, or ADDRECORDREF methods must be called before the ADDFIELD method.  

 If the filter page implementation will call a SETVIEW method, then the SETVIEW method must be called before the ADDFIELDNO method call, otherwise the default filter that is specified by the *Filter* parameter for field, if any, will be cleared by SETVIEW.  

 The filter that is specified by the *Filter* parameter will overwrite any previously defined filters for the field which were set by ADDVIEW method or read from the record or recordRef instance that defined the filter control.  

## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two fields of the **Date** record variable which will be available in the filter control on the filter page: **Period End** and **Period Start**. A default filter is set on the **Period End** field.  

 This example requires that you create the following global variables.  

|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varDateRecord|Record|Date|  
|varFilterPageBuilder|FilterPageBuilder||  

```  
varDateItem := 'Date record';  
varFilterPageBuilder.ADDRECORD(varDateItem, varDateRecord);  
varFilterPageBuilder.ADDFIELDNO(varDateItem, varDateRecord.FIELDNO(varDateRecord."Period End"),'03032014D');  
varFilterPageBuilder.ADDFIELDNO=(varDateItem, varDateRecord.FIELDNO(varDateRecord."Period Start"));  

```  

## See Also  
 [ADDFIELD Method](devenv-addfield-method.md)   
 [ADDRECORD Method](devenv-addrecord-method.md)   
 [ADDRECORDREF Method](devenv-addrecordref-method.md)   
 [ADDTABLE Method](devenv-addtable-method.md)   
 [GETVIEW Method \(FilterPageBuilder\)](devenv-getview-method-filterpagebuilder.md)   
 [SETVIEW Method](devenv-setview-method.md)   
 [COUNT Method \(FilterPageBuilder\)](devenv-count-method-filterpagebuilder.md)   
 [NAME Method \(FilterPageBuilder\)](devenv-name-method-filterpagebuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-runmodal-method-filterpagebuilder.md)
