---
title: "How to: Sort a Query Dataset in Ascending or Descending Order"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 16380cad-3f90-4ad2-90e7-9eca2795d84e
caps.latest.revision: 7
---
# How to: Sort a Query Dataset in Ascending or Descending Order
By default, the rows in the resulting dataset of query are not necessarily arranged in any specific order. You can sort the rows in the dataset in ascending or descending order by one or more selected columns in the query. For example, if the query retrieves the quantity of items in sales orders for each customer, then you could sort the results in alphabetical order by the customer name, or you could sort the results by the quantity of items from the highest value to the lowest value. To sort query results, you modify the [OrderBy Property](OrderBy-Property.md) of the query object.  
  
> [!NOTE]  
>  If you are familiar with SQL select statement syntax, the **OrderBy** property corresponds to the ORDERBY clause.  
  
### To sort query results by a column  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Queries**, select the query that you want to modify, and then choose **Design**.  
  
3.  Select the first blank line after the last data item or column in the list.  
  
4.  On the **View** menu, choose **Properties**.  
  
5.  In the **Properties** window, in the **Value** column of the **OrderBy** property, choose the **AssistEdit** button.  
  
6.  In the **Order By** window, in the **Column** field of the first row, choose the **AssistEdit** button to open the **Column List - Table** window.  
  
     The **Column List - Table** window includes all the columns that are defined in the query.  
  
7.  Select the column that you want, and then choose the **OK** button.  
  
8.  In the **Order By** window, set the **Direction** field for the column to **Ascending** or **Descending**.  
  
    -   **Ascending** sorts the column from lowest value to the highest value \(A to Z, 0 to 9\).  
  
    -   **Descending** sorts the column from highest value to the lowest value \(Z to A, 9 to 0\).  
  
9. Repeat the previous step to sort by additional columns.  
  
     When you sort by multiple columns, the sort order is determined by the column’s position in the **Order By** window, where the query sorts the results by the first listed column, then the second column, and so on.  
  
## Example  
 This section includes a simple example of how you can set the **OrderBy** property to sort the resulting dataset of a query. For a detailed step-by-step example of sorting a query dataset, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).  
  
 This following table shows the results of a query that retrieves the quantity of items in every open sales order for each customer.  
  
|Customer|Quantity|  
|--------------|--------------|  
|The Cannon Group|50|  
|New Concepts|15|  
|New Concepts|30|  
|Selangerian Ltd.|20|  
|Selangerian Ltd.|60|  
  
 To sort the **Customer** column in ascending order and the **Quantity** column in descending order, you add the following entries to the **Order By** window of the **OrderBy** property of the query.  
  
|Column|Direction|  
|------------|---------------|  
|Name|Ascending|  
|Quantity|Descending|  
  
 In the **Properties** window, the **OrderBy** property is set to `Name=Ascending,Quantity=Descending`.  
  
 The following table shows the query results after sorting.  
  
|Customer|Quantity|  
|--------------|--------------|  
|New Concepts|30|  
|New Concepts|15|  
|Selangerian Ltd.|60|  
|Selangerian Ltd.|20|  
|The Cannon Group|50|  
  
 The following code is the ORDERBY clause of an SQL select statement that corresponds to the **OrderBy** property in this example.  
  
```  
OrderBy Name,Quantity  
```  
  
## See Also  
 [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md)
