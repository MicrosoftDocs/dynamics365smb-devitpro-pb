---
title: "FilterPageBuilder.AddField(String, Any [, String]) Method"
description: "Adds a table field to the filter control for a table on filter page."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# FilterPageBuilder.AddField(String, Any [, String]) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a table field to the filter control for a table on filter page.


## Syntax
```AL
[Ok := ]  FilterPageBuilder.AddField(Name: String, Field: Any [, Filter: String])
```
## Parameters
*FilterPageBuilder*  
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)  
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.  

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
  
*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The name of the table field to add to the filter control for a table.
        
*[Optional] Filter*  
&emsp;Type: [String](../string/string-data-type.md)  
A default filter on the field that is specified by the Field parameter.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the field was added to the field list for the specified filter control; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks    
 If the filter page implementation will call a [SetView Method](../../methods-auto/filterpagebuilder/filterpagebuilder-setview-method.md), then the [SetView Method](../../methods-auto/filterpagebuilder/filterpagebuilder-setview-method.md) must be called before the AddField method call, otherwise the filter that is specified by the *Filter* parameter will be cleared by [SetView Method](../../methods-auto/filterpagebuilder/filterpagebuilder-setview-method.md).  
  
 The filter that is specified by the *Filter* parameter will overwrite any previously defined filters for the field which were set by AddView method or read from the record or recordRef instance that defined the filter control.  
  
## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two fields of the **Date** record variable which will be available in the filter control on the filter page: **Period End** and **Period Start**. A default filter is set on the **Period End** field.  
  
```al
var
    varDateItem|: Text[30];  
    varDateRecord: Record Date;  
    varFilterPageBuilder: FilterPageBuilder;  

begin     
    varDateItem := 'Date record';  
    varFilterPageBuilder.AddRecord(varDateItem, varDateRecord);  
    varFilterPageBuilder.AddField(varDateItem, varDateRecord."Period End",'12122015D');  
    varFilterPageBuilder.AddField(varDateItem, varDateRecord."Period Start");
    varFilterPageBuilder.RunModal();  
end;
```  


## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Creating Filter Pages for Tables](../../devenv-filter-pages-for-filtering-tables.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)