---
title: "IndentationColumn Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8af95802-5ad7-4dce-96be-9e462f8436d5
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---
# IndentationColumn Property

Sets the name of the hidden column that controls row indentation in a ist page. 

## Syntax
```
IndentationColumn = IntegerFieldName;
```
  
## Applies To  
  
- Repeater controls on list page types
  
## Remarks

This property can be set to a field or variable of [Integer Data Type](../datatypes/devenv-integer-data-type.md). 

This property is used by the **IndentationControls** property and **ShowAsTree** property. It has no affect on the list, unless these properties are properly set.


## Example

```
repeater(Control1)
{
    IndentationColumn = Indent;
    IndentationControls = Name;
    
    field("No."; "No.")
    {
       
    }

```
  
## See Also

[IndentationControl Property](devenv-indentationcontrol-property.md)  
[ShowAsTree](devenv-showastree-property.md)  
[TreeInitialState Property](devenv-treeinitialstate-property.md)  
[Properties](devenv-properties.md)  