---
title: "Missing Indexes in Dynamics 365 Business Central"
description: "Description about missing indexes and database missing indexes page"
author: jswymer
ms.date: 06/09/2022
ms.reviewer: 
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: 
ms.author: jswymer
ms.custom: 
---

# Missing Indexes in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]

This article gives an insight about missing indexes for administrators and developers. **Database Missing Indexes** will help administrators and developers to enhance the performance of their applications.

## Indexes overview

[!INCLUDE[indexes_overview_md](../includes/indexes_overview.md)]

For more information on indexes and their types, see [Clustered and nonclustered indexes described](/sql/relational-databases/indexes/clustered-and-nonclustered-indexes-described).

## Missing indexes

When you run a database query, the query optimizer, which is an important database component, analyzes and chooses the best possible plan to complete the instruction. In doing so, it provides additional information about the ongoing operation that the operation might perform well if the particular column (or columns) is indexed. The SQL server's Query optimizer gets this information from Dynamic Management Views (DMV), in our case, [sys.dm_db_missing_index_details](/sql/relational-databases/system-dynamic-management-views/sys-dm-db-missing-index-details-transact-sql). *sys.dm_db_missing_index_details* returns details about missing indexes, which will help you in creating right indexes.

To know more about Dynamic Management Views (DMV), see [System Dynamic Management Views (Transact-SQL)](/sql/relational-databases/system-dynamic-management-views/system-dynamic-management-views).

To understand how AL plays a part in efficient data access with SQL components, see [Efficient data access](../performance/performance-developer.md#efficient-data-access).

## Database missing indexes in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

To get information on missing indexes, go to **Database Missing Indexes** in Business Central, and you'll see the data in the following columns:

|Column|Description|
|------|-----------|
| **Table Name**|The name of the table on which the suggested columns are based.|
| **Extension Id**|The ID of your application to which this data is related.|
|**Index Equality Columns**|The data in these columns is based on equality queries. For example, “Select * from customer where id = 021”|
| **Index Inequality Columns**|The data in these columns comes from queries, which aren't based on equality operations. For example, “Select * from customer where id < 200”|
| **Index Include Columns**|These columns have a copy of associated data for fast retrieval of information, which is based on the columns suggested in *Index Equality Columns* and *Index Inequality Columns*. Include columns aren't indexed columns themselves but point to the additional information linked to the indexed columns. For example, they include the fields in the "Select" part.|

> [!Important]
> The information provided on **Database Missing Indexes** page are the suggestions and must not be taken as mandatory actions. You need to analyze where and how many indexes are best suited for optimal performance of your application. Indexes also take storage space, can affect updates for the tables where insertions and deletions are more common, and therefore can be an expensive operation if you overdo it.

## See Also

[Performance Article For Developers](../performance/performance-developer.md)  
[Optimizing SQL Server Performance with Business Central](optimize-sql-server-performance.md)  
