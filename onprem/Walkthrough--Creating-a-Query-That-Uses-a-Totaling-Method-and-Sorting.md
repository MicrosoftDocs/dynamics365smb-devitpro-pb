---
title: "Walkthrough: Creating a Query That Uses a Totaling Method and Sorting"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 692b5780-53c7-4747-9c2d-9b97afefeb81
caps.latest.revision: 21
manager: edupont
---
# Walkthrough: Creating a Query That Uses a Totaling Method and Sorting
This walkthrough demonstrates how to modify an existing query, which links two tables, so that the query includes a totaling method on a field in one of the tables.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Modifying a query to get the total sum of items in open sales orders per customer.  
  
-   Sorting the resulting dataset by quantity of items.  
  
-   Running the query to view the data that this query describes.  
  
## Prerequisites  
 This walkthrough builds on the steps that are described in [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).  
  
## Story  
 Viktor is a Microsoft Certified Partner working for [!INCLUDE[demoname](includes/demoname_md.md)] He wants to create a dataset that contains the total number of items in open sales orders for each customer. Viktor has already created a query that contains the quantity of items of every open sales order for each customer. He can modify that query so that it displays the sum of quantity of items for each customer.  
  
 The SQL query for this dataset that Viktor wants is the following:  
  
```  
SELECT C.Name, C.No_, SUM(SL.Quantity)  
FROM [CRONUS International Ltd_$Customer] AS C, [CRONUS International Ltd_$Sales Line] AS SL  
WHERE C.No_ = SL.[Sell-to Customer No_]  
GROUP BY C.Name, C.No_, SL.Quantity 
ORDER BY Quantity  
```  
  
## Adding a Totaling Method to a Query  
 Viktor examines the query that he created earlier. To calculate the total number of items in open sales orders for each customer, he adds the **Quantity** column from the **Sales Line** table to the query, and then implements a sum method on the column by changing the [Method Property](Method-Property.md).  
  
#### To add a totaling method to a query  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Query**, select query 50001, Customer\_SalesQuantity, and then choose the **Design** button.  
  
3.  In Query Designer, under the **Sales Line \(SL\)** data item, select the row for the **Quantity** column.  
  
4.  In the **Method Type** column, choose **Totals** from the drop-down list box.  
  
5.  In the **Method**  column, choose **Sum** from the drop-down list box.  
  
    > [!NOTE]  
    >  The query is automatically set to group the dataset by the **No.** and **Name** fields as indicated by the check marks in the **Group By** column. This creates a single row for each customer in the dataset that shows the total quantity of sales for the customer. For more information about grouping, see [Understanding Query Totals and Grouping](Understanding-Query-Totals-and-Grouping.md).  
  
     The following figure shows the Query Designer for this query.  
  
     ![Query with Sum column.](media/Query_WalkthroughTotals.png "Query\_WalkthroughTotals")  
  
    > [!NOTE]  
    >  When you set the **Method** column to **Totals**, the name of the column is automatically changed from **Quantity** to **\<Sum\_Quantity>**. The column name is specified by its [Name Property](Name-Property.md). The **OrderBy** property identifies a column by the **Name** property.  
  
## Sorting the Query Results  
 Viktor wants the resulting dataset to display records according to the item quantity in descending order from highest value to lowest value. To achieve this, he will set the [OrderBy Property](OrderBy-Property.md) on the query object.  
  
#### To sort query results by item quantity  
  
1.  In **Query Designer**, select the first blank line.  
  
2.  On the **View** menu, choose **Properties**.  
  
3.  In the **Query - Properties** window, in the **Value** field of the **OrderBy** property, choose the **AssistEdit** button.  
  
4.  In the **Order By** window, in the **Column** field of the first row, choose the **AssistEdit** button to open the **Column List - Table** window.  
  
     The **Column List - Table** window includes all the columns that are defined in the query.  
  
5.  In the **Column List - Table** window, select the **Sum\_Quantity** row, and then choose the **OK** button.  
  
6.  In the **Order By** window, set the **Direction** field for the **Sum\_Quantity** column to **Descending**.  
  
     This sorts the column from highest to lowest value \(9 to 0\).  
  
7.  Choose the **OK** button, close the **Query – Properties** window, and return to Query Designer.  
  
## Saving and Running the Query  
 Viktor wants to verify that the resulting dataset what he wants. He saves the query and then runs it from Object Designer. The call to run the query runs on [!INCLUDE[nav_server](includes/nav_server_md.md)] and opens a view of the dataset in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
#### To save and run a query  
  
1.  On the **File** menu, choose **Save As**.  
  
2.  In the **Save As** window, in the **ID** field, enter **50002**. In the **Name** field, enter **Customer\_SumSalesQuantity**. Verify that the **Compiled** check box is selected, and then choose the **OK** button.  
  
3.  In Object Designer, select query 50002, and then choose the **Run** button. When you run a query, you can see the data in the dataset.  
  
     ![The result of running Customer&#95;SumQuantity query.](media/Query_WalkthroughTotals_Run.png "Query\_WalkthroughTotals\_Run")  
  
## Next Steps  
 Viktor’s next step is to create a more complex query. For more information, see [Walkthrough: Creating a Query to Link Three Tables](Walkthrough--Creating-a-Query-to-Link-Three-Tables.md).  
  
## See Also  
 [Understanding Query Totals and Grouping](Understanding-Query-Totals-and-Grouping.md)