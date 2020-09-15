---
title: "FilterPageBuilder.SetView Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# FilterPageBuilder.SetView Method
Sets the current filter view, which defines the sort order, key, and filters, for a record in a filter control on a filter page. The view contains all fields that have default filters, but does not contain fields without filters.


## Syntax
```
[Ok := ]  FilterPageBuilder.SetView(Name: String, View: String)
```
## Parameters
*FilterPageBuilder*  
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)  
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.  

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name that is assigned to the filter control. This value must match the value of the ItemName parameter that was specified by AddTable, AddRecord, or AddRecordRef method that adds the table to the filter control.
        
*View*  
&emsp;Type: [String](../string/string-data-type.md)  
The filter view to apply. This can be the output of the GetView method invoked on a Record or a RecordRef value.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The SETVIEW method will overwrite any previously defined filters for the fields that are also included in the view.  
  
## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view from the [GETVIEW Method](../../methods-auto/filterpagebuilder/filterpagebuilder-getview-method.md).  
  
```  
var
    varDateItem: Text[30];  
    varDateRecord: Record Date;  
    varFilterPageBuilder: FilterPageBuilder;  
    varDefaultView: Text;  

begin
    varDateItem := 'Date record';  
    varDateRecord.SETFILTER("Period End", '20151212D');  
    varDateRecord.SETFILTER("Period Start", '20150101D');  
    varDefaultView := varDateRecord.GETVIEW;  
    varFilterPageBuilder.ADDTABLE(varDateItem, DATABASE::Date);  
    varFilterPageBuilder.SETVIEW(varDateItem, varDefaultView);
    varFilterPageBuilder.RunModal();
end; 
```  

## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Creating Filter Pages for Tables](../../devenv-filter-pages-for-filtering-tables.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)