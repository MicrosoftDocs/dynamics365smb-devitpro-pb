---
title: "IndentationColumn Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# IndentationColumn Property
> **Version**: _Available from runtime version 1.0._

Sets the name of the hidden column that controls row indentation in a List page.

## Applies to
-   Page Group


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
IndentationColumn = IntegerFieldName;
```
  
## Remarks

This property must be set to a field or variable of the [Integer Data Type](../datatypes/devenv-integer-data-type.md).

The IndentationColumn property is used together with either the IndentationControls property or ShowAsTree property to create an indented hierarchy list. This property has no effect if the IndentationControls property is not set and ShowAsTree property is set to false (default).

For more information about how to use this property, see [Designing Indented Hierarchy Lists](../devenv-indented-hierarchy-lists.md).


## Example

```AL
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
