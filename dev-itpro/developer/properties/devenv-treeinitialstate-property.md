---
title: "TreeInitialState Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# TreeInitialState Property

[!INCLUDE[2020_releasewave1.md](../../includes/2020_releasewave1.md)]

Sets whether the tree view on list page is collapsed or expanded when the page opens.

## Syntax

```
TreeInitialState = CollapseAll;
```
  
## Applies To  
  
- Repeater controls on list page types on which the **ShowAsTree** property is set to **true**.
  
## Property Value

 **CollapseAll** sets the list to display as collapsed; **ExpandAll** sets the list to display as expanded. The default is **false**.  

## Remarks

Users can change whether a list opens collapsed or expanded. To change behavior, they select the **Toggle Expand/Collapse All** on the first column heading in the list. If they want to revert back to the default setting, they clear personalization of the page.

For more information about how to use this property, see [Designing Indented Hierarchy Lists](../devenv-indented-hierachy-lists.md).

## Example

```
repeater(Control1)
{
    IndentationColumn = NameIndent;
    ShowAsTree = true;
    TreeInitialState = CollapseAll;
    
    field("No."; "No.")
    {
       
    }
    
    ...

```

## See Also
[ShowAsTree Property](devenv-showastree-property.md)  
[IndentationColumn Property](devenv-indentationcolumn-property.md)  
[IndentationControl Property](devenv-indentationcontrols-property.md)  
[Properties](devenv-properties.md)  