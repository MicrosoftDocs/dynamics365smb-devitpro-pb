---
title: "IndentationColumn Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# IndentationColumn Property

Sets the name of the table field or variable that controls row indentation in a list page.

## Syntax

```
IndentationColumn = IntegerFieldName;
```
  
## Applies to  
  
- Repeater controls on list page types
  
## Remarks

This property must be set to a field or variable of the [Integer Data Type](../datatypes/devenv-integer-data-type.md).

The IndentationColumn property is used together with either the IndentationControls property or ShowAsTree property to create an indented hierarchy list. This property has no effect if the IndentationControls property is not set and ShowAsTree property is set to false (default).

For more information about how to use this property, see [Designing Indented Hierarchy Lists](../devenv-indented-hierarchy-lists.md).


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

[IndentationControl Property](devenv-indentationcontrols-property.md)  
[ShowAsTree Property](devenv-showastree-property.md)  
[TreeInitialState Property](devenv-treeinitialstate-property.md)  
[Properties](devenv-properties.md)  
