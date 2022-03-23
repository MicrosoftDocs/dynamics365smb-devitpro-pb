---
title: "FreezeColumn Property"
description: "Specifies the columns in a list that remain in view on a page, even when you scroll right."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FreezeColumn Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the columns in a list that remain in view on a page, even when you scroll right.

## Applies to
-   Page Group

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
FreezeColumn = GroupCompanyDisplayName;
```

## Remarks

The property is useful when you have a list that has many columns that extend beyond the control’s boundaries, which require that you scroll right to see all columns. This property lets you specify columns that always remain in view, even when you scroll through the remaining columns. To set the property, you select a column. The column that you select and *all columns before it* remain in view on the page.

## See Also  

[Properties](devenv-properties.md)  
[Page object](../devenv-page-object.md)  
