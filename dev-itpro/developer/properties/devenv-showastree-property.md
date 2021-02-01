---
title: "ShowAsTree Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# ShowAsTree Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the indentation of rows on a List Page to Tree View. If you enable this property, you can expand or collapse indented rows on a List Page.

## Applies to
-   Page Group

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

**true** enables the tree view; otherwise, **false**. The default is **false**.  

## Remarks

To enable the tree view, you must also set the **IndentationColumn** property. This property specifies an integer data type field in the source table or variable. This field controls which records are indented and by how much. 

Optionally, you can set the **TreeInitialState** property to specify whether the list displays as collapsed or expanded when the list page opens in the client.

> [!NOTE]  
> When you set this property to **true**, the **IndentationControl** property is ignored and the first column on the page is indented.

For more information about how to use this property, see [Designing Indented Hierarchy Lists](../devenv-indented-hierarchy-lists.md).

## Example

```AL
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