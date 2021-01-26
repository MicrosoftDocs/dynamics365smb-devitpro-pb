---
title: "TreeInitialState Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# TreeInitialState Property
> **Version**: _Available or changed with runtime version 5.0._

Specifies the initial state of the records in a repeater control which is displayed as a tree structure.

## Applies to
-   Page Group

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**ExpandAll**|All records in the tree are expanded.|
|**CollapseAll**|All records in the tree are collapsed.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
TreeInitialState = CollapseAll;
```
  
## Remarks

The property specifies the starting state of a list. Users can change whether a list opens collapsed or expanded. To change behavior, they select **Toggle Expand/Collapse All** on the first column heading in the list or using the action in the left corner of the repeater. If they want to revert back to the default setting, they clear personalization of the page.

### Choosing when to start collapsed

Selecting the best value for the TreeInitialState property on a repeater is a balance between user experience and performance. Do consider the following when specifying a value:

- Some business tasks naturally require users to start with a high-level overview of their data and then drill down to find deeply-nested records. Other tasks are more efficient when they start by displaying the full list which users just need to scroll through.
- In general, lists that start fully expanded are loaded faster than lists that start collapsed. The performance difference is negligible on lists with few records, but indented lists with thousands of records will need to load significantly more records when the page opens or the data is refreshed.  

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
