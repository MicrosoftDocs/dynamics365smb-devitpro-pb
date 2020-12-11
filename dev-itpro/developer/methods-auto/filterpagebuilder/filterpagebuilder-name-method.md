---
title: "FilterPageBuilder.Name Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# FilterPageBuilder.Name Method
> **Version**: _Available from runtime version 1.0._

Gets the name of a table filter control that is included on a filter page based on an index number that is assigned to the filter control.


## Syntax
```
Name :=   FilterPageBuilder.Name(Index: Integer)
```
## Parameters
*FilterPageBuilder*
&emsp;Type: [FilterPageBuilder](filterpagebuilder-data-type.md)
An instance of the [FilterPageBuilder](filterpagebuilder-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index of a filter control. The value must be in the range 1 to N, where N is the number of filter controls on the filter page.  


## Return Value
*Name*
&emsp;Type: [String](../string/string-data-type.md)
The name of the filter control.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example initializes a filter page object that includes two filter controls for the **Date** system table. The NAME method returns the names of filter control in a message dialog box.  
 
```  
    var
        varDateItem: Text[30];
        varCount: Integer;
        varIndex: Integer;
        varFilterPageBuilder: FilterPageBuilder;

    begin
        varDateItem := 'Date record';
        varFilterPageBuilder.ADDTABLE(varDateItem + ' 1', DATABASE::Date);
        varFilterPageBuilder.ADDTABLE(varDateItem + ' 2', DATABASE::Date);
        varCount := varFilterPageBuilder.COUNT;
        if varCount <> 2 then
            ERROR('There should be two controls in FilterPageBuilder');
        for varIndex := 1 to varCount do
            MESSAGE('Control item %1 is named %2', varIndex, varFilterPageBuilder.Name(varIndex));
        varFilterPageBuilder.RunModal();
    end;
    
```  
  

## See Also
[FilterPageBuilder Data Type](filterpagebuilder-data-type.md)  
[Creating Filter Pages for Tables](../../devenv-filter-pages-for-filtering-tables.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)