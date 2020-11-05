---
title: "TreeInitialState Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# TreeInitialState Property

[!INCLUDE[2020_releasewave1.md](../../includes/2020_releasewave1.md)]

Sets whether the indented hierarchy list is collapsed or expanded when the page opens.

## Syntax

```AL
TreeInitialState = CollapseAll;
```
  
## Applies to  
  
- Repeater controls on list page types on which the **ShowAsTree** property is set to **true**.
  
## Property Value

 **CollapseAll** sets the list to display as collapsed; **ExpandAll** sets the list to display as expanded. The default is **ExpandAll**.  

## Remarks

The property specifies the starting state of a list. Users can change whether a list opens collapsed or expanded. To change behavior, they select **Toggle Expand/Collapse All** on the first column heading in the list or using the action in the left corner of the repeater. If they want to revert back to the default setting, they clear personalization of the page.

### Choosing when to start collapsed

Selecting the best value for the TreeInitialState property on a repeater is a balance between user experience and performance. Do consider the following when specifying a value:
- Some business tasks naturally require users to start with a high-level overview of their data and then drill down to find deeply-nested records. Other tasks are more efficient when they start by displaying the full list which users just need to scroll through.
- In general, lists that start fully expanded are loaded faster than lists that start collapsed. The performance difference is negligable on lists with few records, but indented lists with thousands of records will need to load significantly more records when the page opens or the data is refreshed.  

For more information about how to use this property, see [Designing Indented Hierarchy Lists](../devenv-indented-hierarchy-lists.md).  


## Example

```AL
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
