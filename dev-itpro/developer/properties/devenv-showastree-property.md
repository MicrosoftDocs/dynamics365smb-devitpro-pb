---
title: "ShowAsTree Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# ShowAsTree Property

Sets a list page to display records (rows) in an indented hierarchy that can be collapsed and expanded.

## Syntax

```
ShowAsTree = true;
```

## Applies to  
  
- Repeater controls on list page types  
  
## Property Value

 **true** enables the tree view; otherwise, **false**. The default is **false**.  

## Remarks

To enable the tree view, you must also set the **IndentationColumn** property. This property specifies an integer data type field in the source table or variable. This field controls which records are indented and by how much. 

Optionally, you can set the **TreeInitialState** property to specify whether the list displays as collapsed or expanded when the list page opens in the client.

> [!NOTE]
> When you set this property to **true**, the **IndentationControl** property is ignored and the first column on the page is indented.

For more information about how to use this property, see [Designing Indented Hierarchy Lists](../devenv-indented-hierarchy-lists.md).

## Example

```
repeater(Control1)
{
    IndentationColumn = Indent;
    ShowAsTree = true;
    TreeInitialState = CollapseAll;
    
    field("No."; "No.")
    {
       
    }
    
    ...

```

## See Also

[IndentationColumn Property](devenv-indentationcolumn-property.md)  
[TreeInitialState Property](devenv-treeinitialstate-property.md)  
[IndentationControl Property](devenv-indentationcontrols-property.md)  
[Properties](devenv-properties.md)  