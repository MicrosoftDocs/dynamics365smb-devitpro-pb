---
title: "Indentation Property (Query)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8e3622b9-5a43-4fc9-b179-8da0b4b830cd
caps.latest.revision: 6
manager: edupont
---
# Indentation Property (Query)
Sets the indentation level of a data item, column, or filter row in a query in Query Designer.  
  
## Applies To  
  
-   Query data items, columns, and filter rows  
  
## Property Value  
 Integer  
  
 **0** sets no indentation, **1** indents the item one level, **2** indents the item two levels, and so on.  
  
## Remarks  
 In Query Designer, data items, columns, and filter rows are arranged in a hierarchy, as indicated by an indentation of the **DataSource** column of the item. Indentation is performed automatically as you add items in Query Designer, but you can also set the indentation by modifying the Indentation property The first data item in Query Designer is not indented, but each subsequent data item must be indented one level from the data item above it and every column must be indented one level from the data item to which it belongs.  
  
## See Also  
 [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md)   
 [Understanding Query Filters](Understanding-Query-Filters.md)   
 [Queries](Queries.md)