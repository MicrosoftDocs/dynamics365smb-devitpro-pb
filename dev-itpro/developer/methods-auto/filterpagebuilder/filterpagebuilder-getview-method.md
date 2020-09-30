---
title: "FilterPageBuilder.GetView Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FilterPageBuilder.GetView Method
Gets the filter view (which defines the sort order, key, and filters) for the record in the specified filter control of a filter page. The view contains all fields in the filter control that have a default filter value.


## Syntax
```
View :=   FilterPageBuilder.GetView(Name: String [, UseNames: Boolean])
```
## Parameters
*FilterPageBuilder*  
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)  
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.  

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the filter control. This value must match the value of the Name parameter that was specified by AddTable, AddRecord, or AddRecordRef method that adds the table to the filter control.
        
*UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether a field caption or field number should be returned. This parameter is optional. If this parameter is **true** (default value) or if it is empty, then the returned string contains references to field captions in the table with which the record is associated. If this parameter is **false**, then the returned string contains references to field numbers.
        


## Return Value
*View*  
&emsp;Type: [String](../string/string-data-type.md)  
The view that is configured for the filter control that is identified by Name.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view. The GETVIEW method is used to capture that filter view from the FilterPageBuilder object, and then apply it to the record.  

```
var
    varDateItem: Text[300];  
    varDateRecord: Record Date;  
    varFilterPageBuilder: FilterPageBuilder;  
    varDefaultView: Text[300];

begin
    varDateItem := 'Date record';  
    varDateRecord.SETFILTER("Period End", '12122015D');  
    varDateRecord.SETFILTER("Period Start", '01012015D');  
    varDefaultView := varDateRecord.GETVIEW;  
    varFilterPageBuilder.ADDTABLE(varDateItem, DATABASE::Date);  
    varFilterPageBuilder.SETVIEW(varDateItem, varDefaultView);  
    if varFilterPageBuilder.RUNMODAL = true then  
      varDateRecord.SETVIEW(varFilterPageBuilder.GETVIEW(varDateItem));
      varFilterPageBuilder.RunModal(); 
end;
```  


## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Creating Filter Pages for Tables](../../devenv-filter-pages-for-filtering-tables.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)