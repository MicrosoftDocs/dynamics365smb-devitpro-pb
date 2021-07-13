---
title: "SQL Advanced Options for Data Item Link Types"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8bfff70e-a3ac-4a5e-aa04-092473a1559e
caps.latest.revision: 14
manager: edupont
---
# SQL Join Types for Queries
With queries, you can link data items together to combine data from records in two or more tables into a single dataset. Tables are defined by data items. To create a link between data items, you set the [DataItemLinkType Property](DataItemLinkType-Property.md) of a data item in Query Designer. The DataItemLinkType property controls which records to include or exclude from resulting dataset based on the conditions of the [DataItemLink Property \(Reports\)](DataItemLink-Property--Reports-.md). The DataItemLinkType property includes the **SQL Advanced Options** value that you can use create links that correspond to joins in SQL select statements. For more general information about linking data items, see [Understanding Data Item Links](Understanding-Data-Item-Links.md).  
  
## Left and Right Table Designation  
 In SQL join statements, tables are designated as either left or right. In Query Designer, data items are arranged vertically, starting from the top. When linking data items in Query Designer, the left table in SQL corresponds to the first or upper data item in Query Designer and the right table in SQL corresponds to the second or lower table in Query Designer.  
  
## Accessing the SQL Advanced Options  
 When setting up a data item link between two data items, you always set up the link on the lower data item in Query Designer. To access the SQL advanced options, you open the properties of a data item, and then set the DataItemLinkType Property to **SQL Advanced Options**. The SQLJoinType property appears in the **Properties** window for the data item. The SQLJoinType property has the following values:  
  
-   [Inner Join](SQL-Advanced-Options-for-Data-Item-Link-Types.md#InnerJoin)  
  
-   [Left Outer Join](SQL-Advanced-Options-for-Data-Item-Link-Types.md#LeftOuterJoin)  
  
-   [Right Outer Join](SQL-Advanced-Options-for-Data-Item-Link-Types.md#RightOuterJoin)  
  
-   [Full Outer Join](SQL-Advanced-Options-for-Data-Item-Link-Types.md#FullOuterJoin)  
  
-   [Cross Join](SQL-Advanced-Options-for-Data-Item-Link-Types.md#CrossJoin)  
  
## Sample Tables and Query  
 This topic uses the following sample tables and query to demonstrate the SQL Advanced Options for data item links.  
  
### Salesperson/Purchaser Table  
 The Salesperson/Purchaser table contains a list of salespersons. Each salesperson is identified by a unique code.  
  
|Code|Name|  
|----------|----------|  
|AA|Annette|  
|BB|Bart|  
|DD|Debra|  
|JJ|John|  
  
### Sales Header Table  
 The Sales Header table contains a list of sales orders. The Sales Header table contains a list of sales orders. Each sales order has a unique number, includes the name of the customer to sell to, and is assigned to a salesperson by the **Salesperson\_Code** column.  
  
|No|Sell\_to\_Customer\_Name|Salesperson\_Code|  
|--------|------------------------------|-----------------------|  
|1000|Autohaus|AA|  
|2000|Blanemark|DD|  
|3000|Candoxy|JJ|  
|4000|New Concepts||  
  
### Sample Query  
 The following illustration shows the Query Designer for a query that links the Sale Header table with the Salesperson/Purchaser table on the **Salesperson\_code** and **Code** columns, as specified by the DataItemLink property. In the illustration, the SQL Advanced Options property is set to **Inner Join**. For each of the data item links types discussed in the following sections, you change the SQL Advanced Options property to the appropriate type.  
  
 ![Query Designer for an SQL Inner link type.](media/NAV_Query_Designer_SQL_Inner_Join.png "NAV\_Query\_Designer\_SQL\_Inner\_Join")  
  
##  <a name="InnerJoin"></a> Inner Join  
 *Inner Join* creates a dataset by combining records from data item tables where a match is found between the columns that are linked by the DataItemLink property of the lower data item. **Inner Join** uses an "equal to" comparison operator to match rows from the lower data item table with rows from the upper data item table that is based on the values of the linked columns.  
  
-   Each pair of matching records is combined into a row in the dataset.  
  
-   Records from the upper and lower data item tables that do not have a matching column in the lower data item table are excluded from the resulting dataset.  
  
 The following illustration shows an **Inner Join** type between tables A and B. The shaded area indicates the records that are included in the resulting dataset.  
  
 ![Visualization of SQL inner join between two tables.](media/NAV_Query_SQL_Inner_Join.png "NAV\_Query\_SQL\_Inner\_Join")  
  
### Dataset Example  
 The following table shows the resulting dataset for an Inner Join between the Sales Header table and Salesperson/Purchaser table in sample query.  
  
|Name|Sell\_to\_Customer\_No|Sell\_to\_Customer\_Name|  
|----------|----------------------------|------------------------------|  
|Annette|1000|Autohaus|  
|Debra|2000|Blanemark|  
|John|3000|Candoxy|  
  
 The records for **Bart** in the Salesperson table and **New Concepts** in the Sales Header table do not have matching records in the opposing table, so they are excluded from the resulting dataset.  
  
### SQL SELECT Statement for Inner Join  
 To specify an inner join with an SQL statement, you can do either of the following:  
  
-   Use a WHERE clause.  
  
-   Use the INNER JOIN condition with an ON clause.  
  
 The following two examples show how to create an inner join on the Salesperson/Purchaser and Sales Header tables with SQL statements. These two statements result in the same dataset.  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser" INNER JOIN "Sales Header"  
  ON "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"  
```  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser", "Sales Header"  
WHERE "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"  
```  
  
##  <a name="LeftOuterJoin"></a> Left Outer Join  
 A *left outer join* resembles the inner join except that the resulting dataset set contains every record from the upper data item table, even if a record does not have a matching value in the lower data item for columns that are linked by the DataItemLink property.  
  
-   For each record in the upper data item, a row is added in the dataset that combines columns from the upper and lower data item.  
  
-   When a record in the upper data item table has no matching record in the lower data item table, columns coming from the lower data item table have null values.  
  
 The following illustration shows a **Left Outer Join** type between tables A and B. The shaded area indicates the records that are included in the resulting dataset. In the sample query, the Salesperson/Purchaser table is considered the left table.  
  
 ![Visualization of SQL left outer join.](media/NAV_Query_SQL_Left_Outer_Join.png "NAV\_Query\_SQL\_Left\_Outer\_Join")  
  
### Dataset Example  
 The following table shows the resulting dataset for a Left Outer Join between the Sales Header table and Salesperson/Purchaser table in sample query.  
  
|Name|No|Sell\_to\_Customer\_Name|  
|----------|--------|------------------------------|  
|Annette|1000|Autohaus|  
|Bart|null|null|  
|Debra|2000|Blanemark|  
|John|3000|Candoxy|  
  
 The record for **Bart** in the Salesperson/Purchaser table does not have a matching record in the Sales Header table, so a row is included but the columns from the Sale Header table are given null values. The record for **New Concepts** in the Sale Header table is not included in the resulting dataset because it does not have a matching column in the Salesperson/Purchaser table.  
  
### SQL SELECT Statement for Left Outer Join  
 To specify a left outer join with an SQL statement, you use the LEFT OUTER JOIN condition.  
  
 The following example shows how to create a left outer join on the Salesperson/Purchaser and Sales Header tables by using a SQL statement.  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser" LEFT OUTER JOIN "Sales Header"  
  ON "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"  
```  
  
##  <a name="RightOuterJoin"></a> Right Outer Join  
 A *Right Outer join* resembles the inner join except that the resulting dataset set contains every record from the lower data item table, even if a record does not have a matching value in the upper data item for columns that are linked by the DataItemLink property.  
  
-   For each record in the lower data item, a row is added in the dataset that combines columns from the lower and upper data item tables.  
  
-   When a record in the lower data item table has no matching record in the upper data item table, columns coming from the upper data item table have null values.  
  
 The following illustration shows a **Right Outer Join** type between tables A and B. The shaded area indicates the records that are included in the resulting dataset.  
  
 ![Visualization of SQL right outer join.](media/NAV_Query_SQL_Right_Outer_Join.png "NAV\_Query\_SQL\_Right\_Outer\_Join")  
  
### Dataset Example  
 The following table shows the resulting dataset for a Right Outer Join between the Salesperson/Purchaser table and Sales Header table in the sample query. The Sales Header table is considered the right table.  
  
|Name|No|Sell\_to\_Customer\_Name|  
|----------|--------|------------------------------|  
|Annette|1000|Autohaus|  
|Debra|2000|Blanemark|  
|John|3000|Candoxy|  
|null|4000|New Concept|  
  
 The record for **New Concepts** in the Sales Header table does not have a matching record in the Salesperson/Purchaser table, so a row is included but the columns from the Salesperson/Purchaser table are given null values. The record for **Bart** in the Salesperson/Purchaser table is not included in the resulting dataset because it does not have a matching column in the Sales Header table.  
  
### SQL SELECT Statement for Right Outer Join  
 To specify a left outer join with an SQL statement, you use the RIGHT OUTER JOIN condition.  
  
 The following example shows how to create a right outer join on the Salesperson/Purchaser and Sales Header tables by using a SQL statement.  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser" RIGHT OUTER JOIN "Sales Header"  
  ON "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"  
```  
  
##  <a name="FullOuterJoin"></a> Full Outer Join  
 A *Full Outer join* contains all the records from the upper data item table, and all records from the lower data item, including records that do not have a matching value for columns that are linked by the DataItemLink property.  
  
-   Each pair of records from the data items that have matching column values are combined into a row in the dataset.  
  
-   Records from the upper data item table that do have a matching column are included in a row, where the columns from lower data item table have null values.  
  
-   Records from the lower data item table that do have a matching column are included in a row, where the columns from upper data item table have null values.  
  
 The following illustration shows a **Full Outer Join** type between tables A and B. The shaded area indicates the records that are included in the resulting dataset.  
  
 ![Visualization of an SQL full outer join.](media/NAV_Query_SQL_Full_Outer_Join.png "NAV\_Query\_SQL\_Full\_Outer\_Join")  
  
### Dataset Example  
 The following table shows the resulting dataset for a Full Outer Join between the Sales Header table and Salesperson/Purchaser table in sample query.  
  
|Name|No|Sell\_to\_Customer\_Name|  
|----------|--------|------------------------------|  
|Annette|1000|Autohaus|  
|Bart|null|null|  
|Debra|2000|Blanemark|  
|John|3000|Candoxy|  
|null|4000|New Concept|  
  
 The records for **Bart** in the Salesperson/Purchaser table and **New Concepts** in the Sales Header table are included in a row, even though they not have matching values for columns.  
  
### SQL SELECT Statement for Full Outer Join  
 To specify a left outer join with an SQL statement, you use the FULL OUTER JOIN condition.  
  
 The following example shows how to create a full outer join on the Salesperson/Purchaser and Sales Header tables by using a SQL statement.  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser" FULL OUTER JOIN "Sales Header"  
  ON "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"  
```  
  
##  <a name="CrossJoin"></a> Cross Join  
 A *cross join* contains rows that combine each row from the upper data item table with each row from a lower data item table. Cross joins are also called Cartesian products. A cross join does not apply any comparisons between columns of data items, so the DataItemLink property is left blank.  
  
### Dataset Example  
 The following table shows the resulting dataset for a Cross Join between the Sales Header table and Salesperson/Purchaser table in sample query.  
  
|Name|No|Sell\_to\_Customer\_Name|  
|----------|--------|------------------------------|  
|Annette|1000|Autohaus|  
|Annette|2000|Blanemark|  
|Annette|3000|Candoxy|  
|Annette|4000|New Concept|  
|Bart|1000|Autohaus|  
|Bart|2000|Blanemark|  
|Bart|3000|Candoxy|  
|Bart|4000|New Concept|  
|Debra|1000|Autohaus|  
|Debra|2000|Blanemark|  
|Debra|3000|Candoxy|  
|Debra|4000|New Concept|  
|John|1000|Autohaus|  
|John|2000|Blanemark|  
|John|3000|Candoxy|  
|John|4000|New Concept|  
  
### SQL SELECT Statement for Cross Join  
 To specify a cross join with a SQL statement, you can do either of the following:  
  
-   Use the CROSS JOIN condition  
  
-   Create an implicit join, which has no join condition, without using a WHERE clause  
  
 The following examples shows how to create a cross join of the Salesperson/Purchaser and Sales Header tables by using a SQL statement.  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser" CROSS JOIN "Sales Header"  
```  
  
```  
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser", "Sales Header"  
```