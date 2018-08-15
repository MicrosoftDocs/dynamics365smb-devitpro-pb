---
title: "AddRecordRef Method"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# AddRecordRef Method
Adds filter control for a table to a filter page. The table is specified by a recordref variable that is passed to the function. This creates a filter control on the filter page, where users can set filter table data.

## Syntax
```
[Name := ]  FilterPageBuilder.AddRecordRef(Name: String, RecordRef: RecordRef)
```
## Parameters
*FilterPageBuilder*  
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)  
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.  
*Name*  
&emsp;Type: [String](string-data-type.md)  
  
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
The record reference to use in the filter control.  


## Return Value
*Name*  
&emsp;Type: [String](string-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 In the filter page that is rendered in the client, the ADDRECORDREF method defines a filter control for the specified table where the user can add and set the filters on the table.  
  
 Fields in the table that already have filters are automatically included in the filter control. Filters in the record reference passed to the method will not be modified by any method in the FilterPageBuilder object.  
  
## Example  
 The following example initializes a filter page object that includes a filter control that uses the Date system table. The filter control has the caption of **Date record**. The example set two filters are on the **Date** record variable, which results in a filter control that includes two fields by default.  
  
 This example requires that you create the following global variables.  
  
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
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)