---
title: "DataAccessIntent Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---

# DataAccessIntent Property

[!INCLUDE[2020_releasewave1.md](../../includes/2020_releasewave1.md)]

Sets whether to get data for the object from a read-only replica of the database or the primary database.

<!-- 
When you enable Read Scale-Out for a database, the ApplicationIntent option in the connection string provided by the client dictates whether the connection is routed to the write replica or to a read-only replica. Specifically, if the ApplicationIntent value is ReadWrite (the default value), the connection will be directed to the database's read-write replica. This is identical to existing behavior. If the ApplicationIntent value is ReadOnly, the connection is routed to a read-only replica.-->

## Applies to  

- Pages of the type API.

    The [Editable property](devenv-editable-property.md) must be set to **false**.

- Query
- Reports

## Property Value

The property has the following values.  

|  Value  |  Description  |
|---------|---------------|  
|**ReadOnly**|Specifies to get the data from a read-only replica.|  
|**ReadWrite**|Specifies to get the data from the primary database. **ReadWrite** is the default value.|  
  
## Syntax
```
DataAccessIntent = ReadOnly|ReadWrite;
```

## Remarks  

For reports, API pages, and queries, the Business Central server can use read-only database replicas on Azure SQL Database and SQL Server. If replicas are enabled, use this property to reduce the load on the primary database. Using **ReadOnly** might also improve performance when viewing objects. **ReadOnly** works as a hint for the server to route the connection to a secondary (read-only) replica, if one is available. When a workload is executed against the replica, insert/delete/modify operations aren't possible. If any of these operations are executed against the replica, an exception is thrown at runtime.

From the client, the property value can be overwritten by using page **9880 Database Access Intent List** page.

## See Also  

[Using Read Scale-Out for Better Performance](../../administration/database-read-scale-out-overview.md)  
[Optimizing SQL Server Performance](../../administration/optimize-sql-server-performance.md)  
[Properties](devenv-properties.md)   
[Page Properties](devenv-page-properties.md)  
[InDataSet Property](devenv-indataset-property.md)
