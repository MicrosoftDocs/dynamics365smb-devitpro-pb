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
# Displaying Lists in an Indented Hierarchy (Tree View)

This article explains how to a list of records in an indented hierarchy that cab be expanded and collapsed with tht click of a button.

## Overview

If you have seen the **Chart of Account** page in the base application, you might have noticed that records are displayed 




## Syntax

```
TreeInitialState = CollapseAll;
```
  
## Applies To  
  
- Repeater controls on list page types on which the **ShowAsTree** property is set to **true**. 
  
## Property Value

 **CollapseAll** sets the list to display as collapsed; **ExpandAll** sets the list to display as expanded. The default is **false**.  

## Remarks

In the client, users can change whether a list opens collapsed or expanded by selecting the **Toggle Expand/Collapse All** on the first column heading of the page. If they want to revert back to the default setting for the page, they clear personalization of the page.

## See Also

[IndentationColumn Property](devenv-indentationcolumn-property.md)  
[IndentationControl Property](devenv-indentationcontrol-property.md)  
[Properties](devenv-properties.md)  