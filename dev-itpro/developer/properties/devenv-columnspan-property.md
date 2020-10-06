---
title: "ColumnSpan Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ColumnSpan Property

Sets the number of columns that a field spans in a Grid control.  
  
## Applies to  

Field controls in a Grid control on a page.  
  
## Property Values  

An integer that specifies the number of columns to span the field.  

## Syntax

```AL
ColumnSpan = 2;
```
  
## Remarks  

When you set a field to span several columns, the field occupies the cells to its right, and existing fields in the occupied cells are moved to the right. 
<!-- 
For example, the following figure illustrates a GridLayout control that consists of four fields arranged in two rows. --> 

## See Also

[Properties](devenv-properties.md)  
[RowSpan Property](devenv-rowspan-property.md)  
[GridLayout Property](devenv-gridlayout-property.md)
<!--[Layout Property](devenv-layout-property.md)-->
  