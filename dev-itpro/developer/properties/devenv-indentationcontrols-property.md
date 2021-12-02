---
title: "IndentationControls Property"
description: "Sets which columns (controls) are indented in a list."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# IndentationControls Property
> **Version**: _Available or changed with runtime version 1.0._

Sets which columns (controls) are indented in a list.

## Applies to
-   Page Group

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
IndentationControls = Field1[, Field2];
```

## Remarks  

The **IndentationControls** property lets you choose which columns are indented under a repeater control on a list page.

To enable an indented hierarchy, you must also set the **IndentationColumn** property. This property specifies field in the source table that controls which records are indented and by how much. 

When using this property, consider the following behavior:

- [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] supports indentation on one column only. You can specify more than one column, however, in the UI, the columns may not appear as expected.
- When indentation is specified, it's no longer possible to use sorting on the columns in the repeater control.  
- This property is ignored if the **ShowAsTree** property on the repeater is set to **true**.
- Right-aligned data in columns, such as the integer data type, won't appear as indented.

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

[ShowAsTree Property](devenv-showastree-property.md)  
[IndentationColumn Property](devenv-indentationcolumn-property.md)  