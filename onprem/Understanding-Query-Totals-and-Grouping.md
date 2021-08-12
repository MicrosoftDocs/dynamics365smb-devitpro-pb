---
title: Query Totals and Grouping
description: Perform calculation on the fields of a column and return the calculated value in the dataset. Know the Dynamics NAV Total methods for running queries.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fbb49b5d-2d48-4030-a066-fef631355152
caps.latest.revision: 17
manager: edupont
---
# Understanding Query Totals and Grouping in Dynamics NAV
In a query, you use a totals method to perform a calculation on the fields of a column and return the calculated value in the dataset. For example, you can sum all the fields in a column or find the average value. The following table shows the available totals methods.  
  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|[Sum](Understanding-Query-Totals-and-Grouping.md#Sum)|Calculates the sum of the values of the field in the designated column for all records that are selected as part of the grouped set.|  
|[Average](Understanding-Query-Totals-and-Grouping.md#Average)|Calculates the average value of the field in the designated column for all records that are selected as part of the grouped set.<br /><br /> When averaging fields that have an integer data type \(such as **Integer** or **BigInteger**\), integer division is used. This means that result is not rounded, and the remainder is discarded. For example, 5÷2=2 instead of 2.5 \(or 2 1/2\).|  
|[Min](Understanding-Query-Totals-and-Grouping.md#Minimum)|Retrieves the lowest value of the field in the designated column for all records that are selected as part of the grouped set.|  
|[Max](Understanding-Query-Totals-and-Grouping.md#Maximum)|Retrieves the highest value of the field in the designated column for all records that are selected as part of the grouped set.|  
|[Count](Understanding-Query-Totals-and-Grouping.md#Count)|Returns the number of records that are selected as part of the grouped set.|  
  
## Working with Totals and Grouping in Query Designer  
 To specify a totals method in Query Designer, you set the **Method Type** column to **Totals**, and then select the totals method in **Method** column. By default, retrieved records are automatically grouped by the other columns in the query, as indicated by a check mark in the **Group By** column in Query Designer. When grouped by a column, records that have similar values for the column are grouped together and the totals method is applied against the records in the group. A summary value is calculated and returned in a single row for the group in the dataset.  
  
> [!NOTE]  
>  Except for the **Count** method, you can only use a totals method \(Sum, Average, Min, and Max\) on a field that has a numeric data type of **Decimal**, **Integer**, **BigInteger**, or **Duration**.  
  
 The following illustration shows how to use Query Designer to create a query that links the Customer table and the Sales Line table and retrieves the total number of items for each customer. The query is grouped by the **No.** and **Name** columns.  
  
 ![Query with Sum column.](media/Query_WalkthroughTotals.png "Query\_WalkthroughTotals")  
  
 The totals methods and grouping correspond to using aggregate functions and the GROUP BY clause, respectively, in SQL SELECT statements. For more information, see [Creating Queries with Totals in SQL](Understanding-Query-Totals-and-Grouping.md#SQL).  
  
 The grouping concept is further explained in the examples for each totals method in the following sections.  
  
## Sample Query  
 The sample query retrieves the quantity of items and customer for each open sales order from the [!INCLUDE[demolong](includes/demolong_md.md)]. The query links table 18 Customer with table 37 Sales Line. The following illustration shows the query setup in Query Designer.  
  
 ![Query Designer for Customer Sales query.](media/NAV_Query_Designer_CustomerSales_Clip.png "NAV\_Query\_Designer\_CustomerSales\_Clip")  
  
 The following table represents a simplified version of the resulting dataset for the sample query.  
  
|Customer number|Customer name|Quantity|  
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|200|  
|30000|Blanemark Hifi|150|  
|20000|Selangorian Ltd.|300|  
|40000|Deerfield Graphics|250|  
|20000|Selangorian Ltd.|400|  
|30000|Blanemark Hifi|350|  
  
 In its current state, the query does not implement a totals method. The following sections explain how you can modify the query to implement the different totals methods.  
  
##  <a name="Sum"></a> Sum  
 The Sum method adds the values of all fields for the specified column within a group. To set up a Sum method on the **Quantity** column of the sample query, set the MethodType property to **Totals** and the Method property to **Sum**. The name of the **Quantity** column automatically changes to **Sum\_Quantity** and the query is automatically grouped by the **No.** and **Name** columns. The following illustration shows the query in Query Designer.  
  
 ![Query with Sum column.](media/Query_WalkthroughTotals.png "Query\_WalkthroughTotals")  
  
 The following table illustrates the resulting dataset for the query.  
  
|Customer number|Customer name|Quantity|  
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|900|  
|30000|Blanemark Hifi|500|  
|40000|Deerfield Graphics|250|  
  
 For step-by-step instructions about how to create this query, see [Walkthrough: Creating a Query That Uses a Totaling Method and Sorting](Walkthrough--Creating-a-Query-That-Uses-a-Totaling-Method-and-Sorting.md).  
  
##  <a name="Average"></a> Average  
 The Average method calculates the average value of the fields in the column within a group. To set up an Average method on the **Quantity** column of the sample query, set the MethodType property to **Totals** and the Method property to **Sum**. The name of the **Quantity** column automatically changes to **Ave\_Quantity** and the query is automatically grouped by the **No.** and **Name** columns.  
  
 The following table illustrates the resulting dataset for the query.  
  
|Customer number|Customer name|Quantity|  
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|300|  
|30000|Blanemark Hifi|250|  
|40000|Deerfield Graphics|250|  
  
##  <a name="Minimum"></a> Min  
 The Min method retrieves the lowest value of fields in the column within a group. To set up a Min method on the **Quantity** column of the sample query, set the MethodType property to **Totals** and the Method property to **Min**. The name of the **Quantity** column automatically changes to **Min\_Quantity** and the query is automatically grouped by the **No.** and **Name** columns.  
  
 The following table illustrates the resulting dataset for the query.  
  
|Customer number|Customer name|Quantity|  
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|200|  
|30000|Blanemark Hifi|150|  
|40000|Deerfield Graphics|250|  
  
##  <a name="Maximum"></a> Max  
 The Min method retrieves the highest value of fields in the column within a group. To set up a Min method on the **Quantity** column of the sample query, set the MethodType property to **Totals** and the Method property to **Max**. The name of the **Quantity** column automatically changes to **Max\_Quantity** and the query is automatically grouped by the **No.** and **Name** columns.  
  
 The following table illustrates the resulting dataset for the query.  
  
|Customer number|Customer name|Quantity|  
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|400|  
|30000|Blanemark Hifi|350|  
|40000|Deerfield Graphics|250|  
  
##  <a name="Count"></a> Count  
 The Count method returns the number of records from the data item table that comprise a group in the dataset. Unlike the other totals methods, the Count method is not associated with a specific column. Records are identified and counted based on the primary key of the data item table. Referring to the sample query, you can use a Count method to get the number of open sales orders per customer. To set up a Count method in the sample query, do the following:  
  
1.  Delete the **Quantity** column because the Count method is not associated with a specific column.  
  
    > [!NOTE]  
    >  When using the **Count** method, the [DataSource Property](DataSource-Property.md) must be blank.  
  
2.  On a blank line under the data item for Sales Lines, set the MethodType property to **Totals** and the Method property to **Count**. The name of the new column automatically changes to **Count\_** and the query is automatically grouped by the **No.** and **Name** columns.  
  
     Query Designer will look similar to the following illustration.  
  
     ![Query Designer for counting Customer Sales.](media/NAV_Query_CustomerSales_Count_Clip.png "NAV\_Query\_CustomerSales\_Count\_Clip")  
  
 The following table illustrates the resulting dataset for the query.  
  
|Customer number|Customer name|Count|  
|---------------------|-------------------|-----------|  
|20000|Selangorian Ltd.|3|  
|30000|Blanemark Hifi|2|  
|40000|Deerfield Graphics|1|  
  
 In SQL SELECT statements, the Count method corresponds to a COUNT\(\*\) or COUNT\(field\) clause.  
  
##  <a name="SQL"></a> Creating Queries with Totals in SQL  
 If you are familiar with SQL, then it is helpful to know how the totaling methods in [!INCLUDE[navnow](includes/navnow_md.md)] relate to SQL statements. To specify a totaling method in an SQL statement, you add the method to the SELECT statement and then add a GROUP BY clause. To group results on columns, you add the GROUPED BY statement.  
  
 The following example shows how to use an SQL statement to create an inner join of the Customer table and the Sales Line table and a sum of items for each customer. The result is grouped by the No. and Name columns.  
  
```sql  
SELECT Customer."No.", Customer.Name, SUM("Sales Line".Quantity)  
FROM Customer INNER JOIN "Sales Line"  
  ON Customer."No." = "Sales Line"."Sell-to Customer No."  
GROUP BY Customer."No.", Customer.Name  
```  
  
## See Also  
 [Walkthrough: Creating a Query That Uses a Totaling Method and Sorting](Walkthrough--Creating-a-Query-That-Uses-a-Totaling-Method-and-Sorting.md)   
 [Method Property](Method-Property.md)