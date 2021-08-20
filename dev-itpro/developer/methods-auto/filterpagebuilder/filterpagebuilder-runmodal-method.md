---
title: "FilterPageBuilder.RunModal() Method"
description: "Builds and runs the filter page that includes the filter controls that are stored in FilterPageBuilder object instance."
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
# FilterPageBuilder.RunModal() Method
> **Version**: _Available or changed with runtime version 1.0._

Builds and runs the filter page that includes the filter controls that are stored in FilterPageBuilder object instance.


## Syntax
```AL
[Ok := ]  FilterPageBuilder.RunModal()
```

## Parameters
*FilterPageBuilder*  
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)  
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The page is run modally and includes an **OK** and **Cancel** button for closing to modal popup.  
  
 You can call the [GetView Method](../../methods-auto/filterpagebuilder/filterpagebuilder-getview-method.md) method to retrieve the current filter view that is configured on the filter control and apply to the record.  

Because the filter page runs modally in the context of where it was invoked from, users cannot bookmark a link to this page from the user interface.  

## Example  
 The following example initializes a filter page object that includes a filter control for the **Date** system table. The filter control has the caption of **Date record**. The example adds two filter fields to the filter control on the filter page as the result of applying a default view. The [GetView Method](../../methods-auto/filterpagebuilder/filterpagebuilder-getview-method.md) is used to capture that filter view from the FilterPageBuilder object, and then apply it to the record.  
  
```al
var
    varDateItem: Text[300];  
    varDateRecord: Record Date;  
    varFilterPageBuilder: FilterPageBuilder;  
    varDefaultView: Text[300];

begin
    varDateItem := 'Date record';  
    varDateRecord.SetFilter("Period End", '20151212D');  
    varDateRecord.SetFilter("Period Start", '20150101D');  
    varDefaultView := varDateRecord.GetView;  
    varFilterPageBuilder.AddTable(varDateItem, Database::Date);  
    varFilterPageBuilder.SetView(varDateItem, varDefaultView);  
    if varFilterPageBuilder.RunModal = true then  
      varDateRecord.SetView(varFilterPageBuilder.GetView(varDateItem));  
end; 
```  

## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
