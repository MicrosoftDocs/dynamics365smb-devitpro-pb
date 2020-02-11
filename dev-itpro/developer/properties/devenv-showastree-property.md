---
title: "ShowAsTree Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# ShowAsTree Property

Sets a list page to display records (rows) in an indented hierarchy that can be collapsed and expanded. This is commonly referred to as the *tree view*.

## Syntax

```
ShowAsTree = true;
```

## Applies To  
  
- Repeater controls on list page types  
  
## Property Value

 **true** enables the tree view; otherwise, **false**. The default is **false**.  

## Remarks

To enable the tree view, in addition to setting **ShowAsTree** property, you must also set the **IndentationColumn** property. This property specifies an integer data type field in the source table that is used to control the indentation of records in the list.

Optionally, you can set the **TreeInitialState** property to specifies whether the list displays collapsed or expanded when the list page opens in the client.

When you set this property to **true**, the **IndentationControl** property is ignored and the first column on the page is indented, regardless of the **IndentationControl** property.

## See Also

[IndentationColumn Property](devenv-indentationcolumn-property.md)  
[TreeInitialState Property](devenv-treeinitialstate-property.md)  
[IndentationControl Property](devenv-indentationcontrol-property.md)  
[Properties](devenv-properties.md)  