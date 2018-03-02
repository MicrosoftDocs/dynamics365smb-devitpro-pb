---
title: "ColumnSpan Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0ea708dc-6fd4-499f-b24f-a981173cfdde
caps.latest.revision: 8
---
# ColumnSpan Property
Sets the number of columns that a field spans in a GridLayout control.  
  
## Applies To  
 Field controls in a GridLayout control on a page.  
  
## Property Values  
 An integer that specifies the number of columns to span the field.  
  
## Remarks  
 When you set a field to span several columns, the field occupies the cells to its right, and existing fields in the occupied cells are moved to the right. For example, the following figure illustrates a GridLayout control that consists of four fields arranged in two rows.  
  
 ![GridLayout of 4 fields in 2 rows and 2 columns](media/NAVGridLayout2rX2c.png "NAVGridLayout2rX2c")  
  
 If you set Field 1 to span two columns, then the following layout is displayed:  
  
 ![GridLayout showing column span](media/NAVGridLayoutColSpan.png "NAVGridLayoutColSpan")  
  
> [!IMPORTANT]  
>  The ColumnSpan property is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. If the page displays in the [!INCLUDE[nav_web](includes/nav_web_md.md)], the property is ignored and the field will not span any columns.  
  
## See Also  
 [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md)