---
title: "ADDRECORDREF Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 70fae36e-c122-42c5-a42c-d71e2e597620
caps.latest.revision: 5
manager: edupont
---
# ADDRECORDREF Function
Adds filter control for a table to a filter page. The table is specified by a recordref variable that is passed to the function .  
  
 This creates a filter control on the filter page, where users can set filter table data.  
  
## Syntax  
  
```  
[Name :=] FilterPageBuilder.ADDRECORDREF(ItemName, RecordRef)  
```  
  
#### Parameters  
 *ItemName*  
 Type: Text  
  
 The text to display as the caption for the filter control for the specified table.  
  
> [!NOTE]  
>  Within the collection of filter controls on the filter page, you cannot assign the same **ItemName** to different table IDs; otherwise a runtime an error occurs.  
  
 *RecordRef*  
 Type: RecordRef  
  
 The record reference to use in the filter control.  
  
## Return Value  
 Type: Text  
  
 The name assigned to the item or an empty string if an error occurred. An error message will be shown if the return value is not used.  
  
## Remarks  
 In the filter page that is rendered in the [!INCLUDE[navnow](includes/navnow_md.md)] client, the ADDRECORDREF function defines a filter control for the specified table where the user can add and set the filters on the table.  
  
 Fields in the table that already have filters are automatically included in the filter control. Filters in the record reference passed to the function will not be modified by any function in the FilterPageBuilder object.  
  
## Example  
 The following example initializes a filter page object that includes a filter control that uses the Date system table. The filter control has the caption of **Date record**. The example set two filters are on the **Date** record variable, which results in a filter control that includes two fields by default.  
  
 This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|varDateItem|Text||  
|varDateRecord|Record|Date|  
|varDateRecordRef|RecordRef||  
|varFilterPageBuilder|FilterPageBuilder||  
  
```  
varDateItem := 'Date record';  
varDateRecord.SETFILTER("Period End",'12122015D');  
varDateRecord.SETFILTER("Period Start",'01012015D');  
varDateRecordRef.GetTable(varDateRecord);  
varFilterPageBuilder.ADDRECORDREF(varDateItem,varDateRecordRef);  
```  
  
## See Also  
 [ADDFIELD Function](ADDFIELD-Function.md)   
 [ADDFIELDNO Function](ADDFIELDNO-Function.md)   
 [ADDRECORD Function](ADDRECORD-Function.md)   
 [ADDTABLE Function](ADDTABLE-Function.md)   
 [GETVIEW function \(FilterPageBuilder\)](GETVIEW-function--FilterPageBuilder-.md)   
 [SETVIEW Function](SETVIEW-Function.md)   
 [COUNT Function \(FilterPageBuilder\)](COUNT-Function--FilterPageBuilder-.md)   
 [NAME Function \(FilterPageBuilder\)](NAME-Function--FilterPageBuilder-.md)   
 [RUNMODAL Function \(FilterPageBuilder\)](RUNMODAL-Function--FilterPageBuilder-.md)