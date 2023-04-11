---
title: "How to: Set Up Filter Rows in Query Designer"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ec853cd5-b6cd-493d-b7b2-9ad5e3bd6ac4
caps.latest.revision: 10
---
# How to: Set Up Filter Rows in Query Designer
You use a Filter row in Query Designer when you want to filter the query on a field, but you do not want to include the field in the dataset. For example, you might want to filter a date field on a specific date, but you do not want to include the date in the dataset. To specify the filter for the Filter row, you set its [ColumnFilter Property](ColumnFilter-Property.md).  
  
> [!NOTE]  
>  The filter on a Filter row is similar to a filter on a data item, except that the filter of a Filter row can be programmatically overwritten by calling the **SETFILTER** and **SETRANGE** functions from C/AL code. For more information, see [Understanding Query Filters](Understanding-Query-Filters.md).  
  
### To add a Filter row in a query  
  
1.  To open the query for editing in the development environment, on the **Tools** menu, choose **Object Designer**, choose **Query**, select the query you want to update, and then choose **Design**.  
  
2.  In Query Designer, under the data item that defines the table that contains the field on which you want to filter, choose a blank row or insert a new one.  
  
3.  In the blank row, set the **Type** column to **Filter**.  
  
4.  In the **Data Source**, enter the name of the field to filter or choose the up arrow, choose the field, and then choose the **OK** button.  
  
### To set up a filter on the Filter row  
  
1.  In Query Designer, choose the Filter row.  
  
2.  On the **View** menu, choose **Properties**.  
  
3.  In the **Properties** windows, in the **Value** field of the **ColumnFilter** property, choose the **AssistEdit** button.  
  
4.  In the **Column Filter** window, in the row that contains the field, set the **Type** column to **CONST** if you want to filter on constant value or **FILTER** if you want to set filter based on an expression.  
  
5.  In the **Value** column of the row, do one of the following:  
  
    1.  If you set the **Type** column to **CONST**, then enter the value that you want to filter on.  
  
    2.  If you set the **Type** column to **FILTER**, then enter the filter expression. For more information, see [Entering Criteria in Filters](Entering-Criteria-in-Filters.md).  
  
6.  Choose the **OK** button to return to the **Properties** window.  
  
7.  Close the **Properties** window and save the query.  
  
## See Also  
 [Understanding Query Filters](Understanding-Query-Filters.md)   
 [ColumnFilter Property](ColumnFilter-Property.md)   
 [How to: Create Queries](How-to--Create-Queries.md)
