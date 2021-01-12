---
title: Query Totals and Grouping
description: Do calculations on the fields of a column and return the calculated value in the dataset. Know the Dynamics NAV Total methods for running queries.
ms.custom: na
ms.date: 01/08/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Aggregating Data in Query Objects

In a query object, you can use the [Method property](properties/devenv-method-property.md) to do a calculation on the fields of a column and return the calculated value in the dataset. For example, you can sum all the fields in a column or find the average value. The `Method` property is set on `column` controls and can be set to any of the following aggregate methods.  
  
|Aggregate method|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|-----|---------------------------------------|
|[Sum](devenv-query-totals-grouping.md#Sum)|Calculates the sum of the values of the field in the designated column for all records that are selected as part of the grouped set.|  
|[Average](devenv-query-totals-grouping.md#Average)|Calculates the average value of the field in the designated column for all records that are selected as part of the grouped set.<br /><br /> When averaging fields that have an integer data type \(such as `Integer` or `BigInteger`\), integer division is used. The result isn't rounded, and the remainder is discarded. For example, 5÷2=2 instead of 2.5 \(or 2 1/2\).|  
|[Min](devenv-query-totals-grouping.md#Minimum)|Retrieves the lowest value of the field in the designated column for all records that are selected as part of the grouped set.|  
|[Max](devenv-query-totals-grouping.md#Maximum)|Retrieves the highest value of the field in the designated column for all records that are selected as part of the grouped set.|  
|[Count](devenv-query-totals-grouping.md#Count)|Returns the number of records that are selected as part of the grouped set.|  
  
## Setting up an aggregate method for a query column

Except for the `Count` method, you can only use an aggregate method \(`Sum`, `Average`, `Min`, and `Max`\) on a field that has a numeric data type of [Decimal](methods-auto/decimal/decimal-data-type.md), [Integer](methods-auto/integer/integer-data-type.md), [BigInteger](methods-auto/biginteger/biginteger-data-type.md), or [Duration](methods-auto/duration/duration-data-type.md). To set up an aggregate on a column, you set the column's [Method Property](properties/devenv-method-property.md).

```AL
column(Name; Field)
{
    Method = Sum|Average|Min|Max|Count;
}
```

Setting an aggregate method on a column will automatically group the resultant data set by the other columns in the query. Records that have matching values for the other columns are grouped together into a single row in the results. The aggregate method is then applied against the group and a summary value returned in the row. It's similar to the GROUP BY clause in SQL SELECT statements (see [Creating Queries with Aggregates in SQL](devenv-query-totals-grouping.md#SQL)).

The aggregate methods and grouping are further explained in the following sections.  
  
## Sample Query

The following sample query object retrieves the number of line items in every sales order for each customer. The query links the **Customer** table and the **Sales Line** table. In its current state, the `Method` property is commented out so it doesn't implement any aggregate method.
  
```AL
query 50101 "Customer_Sales_Quantity"
{
    QueryType = Normal;
    // Sorts the results in descending order
    OrderBy = descending(Qty);

    elements
    {
        dataitem(C; Customer)
        {
            column(Customer_Number; "No.")
            {
            }

            column(Customer_Name; Name)
            {
            }

            dataitem(SL; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = c."No.";
                SqlJoinType = InnerJoin;

                column(Qty; Quantity)
                {
                    // Change the value of the property to perform a different aggregate method on grouped columns:
                    // Sum, Average, Max, Min, or Count
                    // Method = Sum|Average|Min|Max|Count;
                }
            }
        }
    }
}
```

The following table represents a simplified version of the resulting dataset for the sample query.  
  
|Customer_Number|Customer_Name|Qty|  
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|400|
|30000|Blanemark Hifi|350|  
|20000|Selangorian Ltd.|300|
|40000|Deerfield Graphics|250|
|20000|Selangorian Ltd.|200|  
|30000|Blanemark Hifi|150|  

The following sections explain how you can modify the query to implement the different aggregate methods by changing the value of the [Method property](properties/devenv-method-property.md).
  
##  <a name="Sum"></a> Sum

The `Sum` method adds the values of all fields for the specified column within a group. To set up a `Sum` method on the **Quantity** column of the sample query, set the `Method` property to `Sum`. The query is automatically grouped by the **No.** and **Name** columns.

```AL
...
column(Qty; Quantity)
{
    Method = Sum;
}
...
```
  
Looking at the sample query, you can use `Sum` method to get the total number of items in sales orders for each customer. The following table illustrates the resulting dataset for the query.  
  
|Customer_Number|Customer_Name|Qty|
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|900|  
|30000|Blanemark Hifi|500|  
|40000|Deerfield Graphics|250|  
  
##  <a name="Average"></a> Average

 The `Average` method calculates the average value of the fields in the column within a group. To set up an Average method on the **Quantity** column of the sample query, set the `Method` property to `Average`. The query is automatically grouped by the **No.** and **Name** columns:

```AL
...
column(Qty; Quantity)
{
    Method = Average;
}
...
```
  
Looking at the sample query, you can use `Average` method to get the average number of items in sales orders for each customer. The following table illustrates the resulting dataset for the query.
  
|Customer_Number|Customer_Name|Qty|
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|300|  
|30000|Blanemark Hifi|250|  
|40000|Deerfield Graphics|250|  
  
##  <a name="Minimum"></a> Min

 The `Min` method retrieves the lowest value of fields in the column within a group. To set up a `Min` method on the **Quantity** column of the sample query, set the `Method` property to `Min`. The name of the **Quantity** column automatically changes to **Min\_Quantity** and the query is automatically grouped by the **No.** and **Name** columns:

```AL
...
column(Qty; Quantity)
{
    Method = Min;
}
...
```
  
Looking at the sample query, you can use `Min` method to get the least number of items in sales orders for each customer. The following table illustrates the resulting dataset for the query. 
  
|Customer_Number|Customer_Name|Qty|
|---------------------|-------------------|--------------|  
|40000|Deerfield Graphics|250|  
|20000|Selangorian Ltd.|200|  
|30000|Blanemark Hifi|150|  
  
##  <a name="Maximum"></a> Max

 The `Max` method retrieves the highest value of fields in the column within a group. To set up a `Max` method on the **Quantity** column of the sample query, set the `Method` property to `Max`. The name of the **Quantity** column automatically changes to **Max\_Quantity** and the query is automatically grouped by the **No.** and **Name** columns:

```AL
...
column(Qty; Quantity)
{
    Method = Max;
}
...
```
  
Looking at the sample query, you can use `Max` method to get the greatest number of items in sales orders for each customer. The following table illustrates the resulting dataset for the query.  
  
|Customer_Number|Customer_Name|Qty|
|---------------------|-------------------|--------------|  
|20000|Selangorian Ltd.|400|  
|30000|Blanemark Hifi|350|  
|40000|Deerfield Graphics|250|  
  
##  <a name="Count"></a> Count

The `Count` method returns the number of records from the data item table that comprise a group in the dataset. Unlike the other aggregate methods, the `Count` method is not associated with a specific column. Records are identified and counted based on the primary key of the data item table. Referring to the sample query, you can use a `Count` method to get the number of open sales orders per customer.

To set up a `Count` method in the sample query, the `column` element definition cannot include a source table; only a name. Therefore, you can delete the reference to the `Quantity` field in the `column(Qty; Quantity)` element and set the `Method`property to `Count`:  

```AL
...
                column(Qty)
                {
                   Method = Count;
                }
  
```

Looking at the sample query, you can use `Count` method the number of sales orders for each customer. The following table illustrates the resulting dataset for the query. 
  
|Customer_Number|Customer_Name|Qty|
|---------------------|-------------------|-----------|  
|20000|Selangorian Ltd.|3|  
|30000|Blanemark Hifi|2|  
|40000|Deerfield Graphics|1|  
  
In SQL SELECT statements, the Count method corresponds to a COUNT\(\*\) or COUNT\(field\) clause.  
  
##  <a name="SQL"></a> Creating queries with aggregates in SQL  

If you're familiar with SQL, then it's helpful to know how the aggregate methods in [!INCLUDE[prod_short](includes/prod_short.md)] relate to SQL statements. To specify an aggregate method in an SQL statement, you add the method to the SELECT statement and then add a GROUP BY clause. To group results on columns, you add the GROUPED BY statement.  
  
The following example shows how to use an SQL statement to create an inner join of the Customer table and Sales Line table, and a sum of items for each customer. The result is grouped by the **No.** and **Name** columns.  
  
```sql  
SELECT Customer."No.", Customer.Name, SUM("Sales Line".Quantity)  
FROM Customer INNER JOIN "Sales Line"  
  ON Customer."No." = "Sales Line"."Sell-to Customer No."  
GROUP BY Customer."No.", Customer.Name  
```  

## See Also

[Method Property](properties/devenv-Method-Property.md)  
 [Query Object](devenv-query-object.md)  
 [Filtering Queries](devenv-query-filters.md)  
 [Aggregating Data](devenv-query-totals-grouping.md)  
[Aggregate Functions (Transact-SQL)](/sql/t-sql/functions/aggregate-functions-transact-sql)  