---
title: "Query Objects and Performance"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Query Objects and Performance
A *query* is an object in [!INCLUDE[prod_long](../developer/includes/prod_long.md)] that you use to specify a set of data that you want to read from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. You can query the database to retrieve one or more fields from a single table or multiple tables. You can specify how to join the tables in the query. You can specify totaling methods on fields, such as sums and averages. This topic describes how to design queries and table keys in the most efficient way.  
  
## FlowFields in Queries  
 A sub-query is automatically added to the SQL statement to retrieve each FlowField in a query. This allows [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to retrieve all the data in one request.  
  
> [!IMPORTANT]  
>  You cannot use a FlowField on a virtual table in a query because this cannot be converted automatically into a SQL statement.  
  
## Covering Indexes  
 When you use a query to select a subset of fields in a table, you should consider taking advantage of the covering index strategy. A *covering index* is the index that contains all output fields required by the operation performed on that index. A covering index data access strategy can greatly improve performance because the database must retrieve only data from the index instead of finding data by using the index and then retrieving the data in the clustered index. A covering index data access strategy can be used when the following conditions are true:  
  
-   All columns in a given data item are part of a single [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key.  
  
-   All columns that are used in the DataItem table filters are part of the same [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key.  
  
-   If two DataItems are linked, then the field on the parent DataItem that links the two DataItems \(the **Reference Field** on the **DataItemLink** property\), must be part of the same [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key as the columns in the child DataItem.  
  
 The SQL Server optimizer automatically chooses a covering index strategy whenever possible.  
  
 For more information about SQL Server covering indexes, see [SQL Server Optimization](https://go.microsoft.com/fwlink/?LinkId=257836).  
  
 For more information about SQL Server clustered and non-clustered indexes, see [Types of Indexes](https://go.microsoft.com/fwlink/?LinkID=257835).  
  
## Covering SIFT Indexes  
 Similar to how indexes can be used to retrieve data for a query, SIFT indexes can be used to retrieve data for a query that contains totals. SIFT totals are maintained after each insert, modify, or delete call, and so some or all of the totals are already calculated. A SIFT index can be used when the following conditions are true:  
  
-   The query contains at least one aggregated column with **Method Type** set to **Totals** and with **Method** set to either **Sum**, **Count**, or **Average**.  
  
-   If a DataItem contains an aggregated column, then all columns under that DataItem must be aggregated columns, must use either the **Sum**, **Count**, or **Average** method, and must be part of a SumIndexField defined on a single [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key.  
  
-   In a query in which you have aggregations but not on all DataItems, then for the DataItems without aggregations, the columns are part of a SumIndexField.  
  
-   All non-aggregated columns under the DataItem that have aggregation are part of the key fields defined for the same SIFT index.  
  
-   All columns that are used in the DataItem table filters are part of the same [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key.  
  
-   If two DataItems are linked, then the field on the parent DataItem that links the two DataItems \(the **Reference Field** in the **DataItemLink** property\) must be part of the same [!INCLUDE[prod_short](../developer/includes/prod_short.md)] key as the columns in the child DataItem.  
  
 [!INCLUDE[server](../developer/includes/server.md)] automatically use a SIFT index for query objects whenever possible.  
  
## Differences Between Query and Record Result Sets  
 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] does not do any caching for query result sets. When you run a query, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] always gets the data directly from SQL Server.  
  
 Query result sets are not guaranteed to be dynamic, whereas record result sets are always dynamic. This means that if you insert or modify data in result set row that you have not yet looped through, then it is not guaranteed that the query result set includes those changes. 

## Enabling and Disabling Selected Query Hints

SQL Server query optimizer will try to select the best execution plan for SELECT, INSERT, UPDATE, and DELETE statements. Most of the time, query optimizer makes the right choice. [Query hints](/sql/t-sql/queries/hints-transact-sql-query?view=sql-server-2017) are strategies that can be enforced by the SQL Server query processor to override any execution plan that the query optimizer might select for a query. The [!INCLUDE[server](../developer/includes/server.md)] instance includes configuration settings that let you enable or disable the use of the selected query hints on the database.

For more information, see [Configuring Query Hints for Optimizing SQL Server Performance with Business Central](sql-server-query-hints.md).
  
## See Also  
 [Query Object](../developer/devenv-query-object.md)  
 [Optimizing SQL Server Performance with Business Central](optimize-sql-server-performance.md)