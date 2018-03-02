---
title: "Query Objects and Performance"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 95e988c1-f113-4c6d-8d97-14bf971dbc62
caps.latest.revision: 6
manager: edupont
---
# Query Objects and Performance
A *query* is a new object in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] that you use to specify a set of data that you want to read from the [!INCLUDE[navnow](includes/navnow_md.md)] database. You can query the database to retrieve one or more fields from a single table or multiple tables. You can specify how to join the tables in the query. You can specify totaling methods on fields, such as sums and averages. This topic describes how to design queries and table keys in the most efficient way.  
  
## FlowFields in Queries  
 A sub-query is automatically added to the SQL statement to retrieve each FlowField in a query. This allows [!INCLUDE[navnow](includes/navnow_md.md)] to retrieve all the data in one request.  
  
> [!IMPORTANT]  
>  You cannot use a FlowField on a virtual table in a query because this cannot be converted automatically into a SQL statement.  
  
## Covering Indexes  
 When you use a query to select a subset of fields in a table, you should consider taking advantage of the covering index strategy. A *covering index* is the index that contains all output fields required by the operation performed on that index. A covering index data access strategy can greatly improve performance because the database must retrieve only data from the index instead of finding data by using the index and then retrieving the data in the clustered index. A covering index data access strategy can be used when the following conditions are true:  
  
-   All columns in a given data item are part of a single [!INCLUDE[navnow](includes/navnow_md.md)] key.  
  
-   All columns that are used in the DataItem table filters are part of the same [!INCLUDE[navnow](includes/navnow_md.md)] key.  
  
-   If two DataItems are linked, then the field on the parent DataItem that links the two DataItems \(the **Reference Field** on the **DataItemLink** property\), must be part of the same [!INCLUDE[navnow](includes/navnow_md.md)] key as the columns in the child DataItem.  
  
 The SQL Server optimizer automatically chooses a covering index strategy whenever possible.  
  
 For more information about SQL Server covering indexes, see [SQL Server Optimization](http://go.microsoft.com/fwlink/?LinkId=257836).  
  
 For more information about SQL Server clustered and non-clustered indexes, see [Types of Indexes](http://go.microsoft.com/fwlink/?LinkID=257835).  
  
## Covering SIFT Indexes  
 Similar to how indexes can be used to retrieve data for a query, SIFT indexes can be used to retrieve data for a query that contains totals. SIFT totals are maintained after each insert, modify, or delete call, and so some or all of the totals are already calculated. A SIFT index can be used when the following conditions are true:  
  
-   The query contains at least one aggregated column with **Method Type** set to **Totals** and with **Method** set to either **Sum**, **Count**, or **Average**.  
  
-   If a DataItem contains an aggregated column, then all columns under that DataItem must be aggregated columns, must use either the **Sum**, **Count**, or **Average** method, and must be part of a SumIndexField defined on a single [!INCLUDE[navnow](includes/navnow_md.md)] key.  
  
-   In a query in which you have aggregations but not on all DataItems, then for the DataItems without aggregations, the columns are part of a SumIndexField.  
  
-   All non-aggregated columns under the DataItem that have aggregation are part of the key fields defined for the same SIFT index.  
  
-   All columns that are used in the DataItem table filters are part of the same [!INCLUDE[navnow](includes/navnow_md.md)] key.  
  
-   If two DataItems are linked, then the field on the parent DataItem that links the two DataItems \(the **Reference Field** in the **DataItemLink** property\) must be part of the same [!INCLUDE[navnow](includes/navnow_md.md)] key as the columns in the child DataItem.  
  
 [!INCLUDE[nav_server](includes/nav_server_md.md)] automatically use a SIFT index for query objects whenever possible.  
  
## Differences Between Query and Record Result Sets  
 [!INCLUDE[navnow](includes/navnow_md.md)] does not do any caching for query result sets. When you run a query, [!INCLUDE[navnow](includes/navnow_md.md)] always gets the data directly from SQL Server.  
  
 Query result sets are not guaranteed to be dynamic, whereas record result sets are always dynamic. This means that if you insert or modify data in result set row that you have not yet looped through, then it is not guaranteed that the query result set includes those changes.  
  
## See Also  
 [Queries](Queries.md)   
 [SumIndexField Technology \(SIFT\)](SumIndexField-Technology--SIFT-.md)   
 [Optimizing SQL Server Performance with Microsoft Dynamics NAV](Optimizing-SQL-Server-Performance-with-Microsoft-Dynamics-NAV.md)