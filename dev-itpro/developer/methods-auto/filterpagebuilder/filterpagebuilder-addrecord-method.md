---
title: "FilterPageBuilder.AddRecord Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FilterPageBuilder.AddRecord Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a filter control for a table to a filter page. The table is specified by a record data type variable that is passed to the method.


## Syntax
```
[Name := ]  FilterPageBuilder.AddRecord(Name: String, Record: Record)
```
## Parameters
*FilterPageBuilder*
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
Assigns a name to the filter control for the table. The text displays as the caption for the filter control on the rendered filter page in the client.
        
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to use in the filter control.  


## Return Value
*Name*
&emsp;Type: [String](../string/string-data-type.md)
The text that is specified by the Name parameter. If an error occurs at runtime, an empty text string is returned.
       If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 In the filter page that is rendered in the client, the AddRecord method defines a filter control for the specified table where the user can set filters on specific fields in the table.  

 Fields in the table that already have filters are automatically included in the filter control. Filters in the record passed to the method will not be modified by any method in the FilterPageBuilder object.  

## Example  
 The following example initializes a filter page object that includes a filter control that uses the Date system table. The filter control has the caption of **Date record**. The example set two filters are on the **Date** record variable, which results in a filter control that includes two fields by default.  

```al
var
    varDateItem: Text[30];  
    varDateRecord: Record Date;  
    varFilterPageBuilder: FilterPageBuilder;

begin
    varDateItem := 'Date record';  
    varDateRecord.SetFilter("Period End",'12122015D');  
    varDateRecord.SetFilter("Period Start",'01012015D');  
    varFilterPageBuilder.AddRecord(varDateItem, varDateRecord);
    varFilterPageBuilder.RunModal(); 

end;
```  


## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Creating Filter Pages for Tables](../../devenv-filter-pages-for-filtering-tables.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)