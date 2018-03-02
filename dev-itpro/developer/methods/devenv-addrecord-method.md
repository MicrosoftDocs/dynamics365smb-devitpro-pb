---
title: "ADDRECORD Method"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a71a6dce-81ce-44bd-8cca-4209461dc586
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ADDRECORD Method
Adds a filter control for a table to a filter page. The table is specified by a record data type variable that is passed to the method.  

## Syntax  

```  
[Name :=] FilterPageBuilder.ADDRECORD(ItemName, Record)  
```  

#### Parameters  
 *ItemName*  
 Type: Text  

 Assigns a name to the filter control.  

 The text displays as the caption for the filter control on the rendered filter page in the client.  

> [!NOTE]  
>  Within the collection of filter controls on the filter page, you cannot assign the same **ItemName** to different table IDs; otherwise a runtime an error occurs.  

 *Record*  
 Type: Record  

 The record to use in the filter control.  

## Return Value  
 Type: Text  

 The name assigned to the item or an empty string if an error occurred. An error message will be shown if the return value is not used.  

## Remarks  
 In the filter page that is rendered in the client, the ADDRECORD method defines a filter control for the specified table where the user can set filters on specific fields in the table.  

 Fields in the table that already have filters are automatically included in the filter control. Filters in the record passed to the method will not be modified by any method in the FilterPageBuilder object.  

## Example  
 The following example initializes a filter page object that includes a filter control that uses the Date system table. The filter control has the caption of **Date record**. The example set two filters are on the **Date** record variable, which results in a filter control that includes two fields by default.  

 This example requires that you create the following global variables.  

|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varDateRecord|Record|Date|  
|varFilterPageBuilder|FilterPageBuilder||  

```  
varDateItem := 'Date record';  
varDateRecord.SETFILTER("Period End",'12122015D');  
varDateRecord.SETFILTER("Period Start",'01012015D');  
varFilterPageBuilder.ADDRECORD(varDateItem, varDateRecord);  
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
