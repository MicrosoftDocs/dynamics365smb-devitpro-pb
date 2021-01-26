---
title: "RowSpan Property"
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
# RowSpan Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the number of rows that a field spans in a Grid control.

## Applies to
-   Page Label
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Values

 An integer that specifies the number of rows to span the field.  
  
## Remarks

When you set a field to span several rows, then the field occupies the cells in the rows below it and existing fields in the occupied cells are moved to the right. 
<!--  //NAV For example, the following illustration shows a GridLayout control that consists of four fields arranged in two rows.  
  
![GridLayout of 4 fields in 2 rows and 2 columns](../media/NAVGridLayout2rX2c.png "NAVGridLayout2rX2c")  
  
If you set Field 1 to span two rows, then the following layout is displayed:  
  
![GridLayout showing row span](../media/NAVGridLayoutRowSpan.png "NAVGridLayoutRowSpan")  
 
-->

> [!IMPORTANT]  
> The RowSpan property is not supported by the [!INCLUDE[nav_web](../includes/nav_web_md.md)]. If the page displays in the [!INCLUDE[nav_web](../includes/nav_web_md.md)], then the property is ignored and the field will not span any rows.

## See Also

[Properties](devenv-properties.md)  
[ColumnSpan Property](devenv-columnspan-property.md)  
[GridLayout Property](devenv-gridlayout-property.md)  