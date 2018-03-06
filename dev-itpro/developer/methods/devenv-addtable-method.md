---
title: "ADDTABLE Method"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dee056f3-c325-4c02-bd2f-fac00289fd94
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ADDTABLE Method
Adds filter control for a table to a filter page.  

## Syntax  

```  
[Name :=] FilterPageBuilder.ADDTABLE(ItemName, TableNo)  
```  

#### Parameters  
 *ItemName*  
 Type: Text  

 Assigns a name to the filter control for the table.  

 The text displays as the caption for the filter control on the rendered filter page in the client.  

> [!NOTE]  
>  Within the collection of filter controls on the filter page, you cannot assign the same **ItemName** to different table IDs; otherwise a runtime an error occurs.  

 *TableNo*  
 Type: Integer  

 The ID of the table object that you want to filter. The ID is specified by the table's [ID Property](../properties/devenv-id-property.md).  

## Return Value  
 Type: Text  

 The text that is specified by the *ItemName* parameter.  

 If an error occurs at runtime, an empty text string is returned. An error message will be shown if the return value is not used.  

## Remarks  
 In the filter page that is rendered in the client, the ADDTABLE method defines a filter control for the specified table where the user can set filters on specific fields in the table.  

 You can use the ADDFIELD or ADDFIELDNO method to add field of the table to the filter control.  

## Example  
 The following example initializes a filter page object that includes a filter control that uses the Date system table. The filter control has the caption of **Date record**.  

 This example requires that you create the following global variables.  

|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varFilterPageBuilder|FilterPageBuilder||  

```  
varDateItem := 'Date record';  
FilterPageBuilder.ADDTABLE(varDateItem, DATABASE::Date);  

```  

## See Also  
 [ADDFIELD Method](devenv-addfield-method.md)   
 [ADDFIELDNO Method](devenv-addfieldno-method.md)   
 [ADDRECORD Method](devenv-addrecord-method.md)   
 [ADDRECORDREF Method](devenv-addrecordref-method.md)   
 [GETVIEW Method \(FilterPageBuilder\)](devenv-getview-method-filterpagebuilder.md)   
 [SETVIEW Method](devenv-setview-method.md)   
 [COUNT Method \(FilterPageBuilder\)](devenv-count-method-filterpagebuilder.md)   
 [NAME Method \(FilterPageBuilder\)](devenv-name-method-filterpagebuilder.md)   
 [RUNMODAL Method \(FilterPageBuilder\)](devenv-runmodal-method-filterpagebuilder.md)
