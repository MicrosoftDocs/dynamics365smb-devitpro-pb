---
title: "Data Access"
description: Learn how to improve data access performance in Business Central.
ms.custom: na
ms.date: 03/03/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.search.keywords: data access,sql,partitioning,constraints
author: jswymer
---
# Data Access
Data that is needed in the client goes through the following path from the [!INCLUDE[server](../developer/includes/server.md)] to the SQL Server database:
1.  If the data is cached in the [!INCLUDE[server](../developer/includes/server.md)] data cache, it's returned.
2.  If the data isn't cached in the [!INCLUDE[server](../developer/includes/server.md)] data cache, it's fetched from SQL Server over the network as follows:
    1. If the data resides in SQL Servers data cache, it's returned.
    2. If the data doesn't reside in SQL Servers data cache, it's fetched from storage and returned.

## [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server data caching
In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], the data cache is shared by all users who are connected to the same [!INCLUDE[server](../developer/includes/server.md)] instance. So, after one user has read a record, a second user who reads the same record gets it from the cache.  

The following AL methods use the cache system:  
-   GET  
-   GETBYSYSTEMID
-   FIND  
-   FINDFIRST  
-   FINDLAST  
-   FINDSET  
-   COUNT  
-   ISEMPTY  
-   CALCFIELDS  

There are two types of caches, global and private:  

-   Global cache is for all users connected to a [!INCLUDE[server](../developer/includes/server.md)] instance.  
-   Private cache is per user, per company, in a transactional scope. Data in a private cache for a given table and company is flushed when a transaction ends.  

The cache that is used is determined by the lock state of a table. If a table isn't locked, then the global cache is queried for data; otherwise, the private cache is queried.  

Results from query objects aren't cached.  

For a call to any of the **FIND** functions, 1024 rows are cached. You can set the size of the cache by using the **Data Cache Size** setting in the [!INCLUDE[server](../developer/includes/server.md)] configuration file. The default size is 9, which approximates a cache size of 500 MB. If you increase this number by one, then the cache size doubles.  

You can bypass the cache by using the [SELECTLATESTVERSION method \(Database\)](../developer/methods-auto/database/database-SELECTLATESTVERSION-method.md).  

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] synchronizes caching between [!INCLUDE[server](../developer/includes/server.md)] instances that are connected to the same database. By default, the synchronization occurs every 30 seconds.  

You can set the cache synchronization interval by using the *CacheSynchronizationPeriod* parameter in the CustomSettings.config file. This parameter isn't included in the CustomSetting.config file by default, so you must add it manually using the following format:

```
<add key="CacheSynchronizationPeriod" value="hh:mm:ss" />
```
For example, to set the interval to 50 seconds, set the `value` to `"00:00:50"`. For more information about the CustomSettings.config file, see [Configuring Business Central Server](configure-server-instance.md).  

## [!INCLUDE[server](../developer/includes/server.md)] connections to SQL Server
The [!INCLUDE[server](../developer/includes/server.md)] uses ADO.NET to connect to the SQL Server database. The ADO.NET interface is a managed data access layer that supports SQL Server connection pooling, which can dramatically decrease memory consumption by [!INCLUDE[server](../developer/includes/server.md)]. SQL Server connection pooling also simplifies deployment of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] three-tier architecture for deployments where the three tiers are installed on separate computers. Specifically, administrators are no longer required to manually create SPNs or to set up delegation when the client, [!INCLUDE[server](../developer/includes/server.md)], and SQL Server are on separate computers.  

There's no longer a one-to-one correlation between the number of client connections and the number of SQL Server connections. In earlier versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], each SQL Server connection could consume up to 40 MB of memory. Additionally, memory allocation is now in managed memory, which is more efficient than unmanaged memory.  

Records are retrieved using Multiple Active Result Sets \(MARS\). methods such as NEXT, FIND\('-'\), FIND\('+'\), FIND\('>'\), and FIND\('\<'\) are faster with MARS than the server cursors that earlier versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] used.  

## <a name="readwrite"></a>Data read/write performance  
AL functions COUNT and AVERAGE formulas can use SIFT indexes. For more information, see [CALCSUMS method \(Record\)](../developer/methods-auto/record/record-CALCSUMS-method.md) and [CALCFIELDS method \(Record\)](../developer/methods-auto/record/record-CALCFIELDS-method.md). MIN and MAX formulas use SQL Server MIN and MAX functions exclusively.  

 RecordIds and SQL Variant columns in a table don't prevent the use of BULK inserts. For more information, see [Bulk Inserts](optimize-sql-bulk-inserts.md).  

In most cases, filtering on FlowFields issues a single SQL statement. In earlier versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], filtering on FlowFields issued an SQL statement for each filtered FlowField and for each record in the table to calculate the filtered FlowFields. The exceptions in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in which filtering on FlowFields doesn't issue a single SQL statement are as follows:  

-   You use the ValueIsFilter option on a field and the field has a value.  

-   A second predicate is specified on a source field and the field that is used for the second predicate has a value. For example, when you specify the [CalcFormula Property](../developer/properties/devenv-CalcFormula-Property.md) for a FlowField, you can specify table filters in the **Calculation Formula** window. If you specify two or more filters on the same source field, then filtering doesn't issue a single SQL statement.  

<!-- property doesn't exist any longer
-   You specify **Validated** for the [SecurityFiltering Property](../developer/properties/devenv-SecurityFiltering-Property.md) on a record. This value for the **SecurityFiltering** property means that each record that is part of the calculation must be verified for inclusion in the security filter.  -->

In most cases, calling the FIND or NEXT functions after you have set the view to include only marked records issues a single SQL statement. In earlier versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], calling FIND or NEXT functions that have marked records issued an SQL statement for each mark. There are some exceptions if many records are marked. For more information, see [MARKEDONLY method \(Record\)](../developer/methods-auto/record/record-MARKEDONLY-method.md).  

## Default SQL constraints on columns

To add a default constraint to a field (column), use the following SQL statement:

```sql
ALTER TABLE ADD CONSTRAINT constraint_name DEFAULT default_value FOR field_name
```

The name of the default constraint isn't important, as long as it isn't used by another column in the database.

### Default constraint value

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] sets default constraints on fields in a tables. The following table list the values used for default constraints for the different data types:

|Data type|value|
|---------|-------|
|Integer, Option, Boolean, Byte, Duration, BigInteger|0|
|Decimal|0.0|
|DateFormula|''|
|Text|N''|
|RecordId, TableFilter|0x00|
|Guid, Media, MediaSet| 00000000-0000-0000-0000-000000000000|
|Code (Default, VarChar, Variant types)|N''|
|Code (Integer, BigInteger types)|0|
|Time, Date, DateTime|'1753.01.01'|

> [!NOTE]
> Blobs don't get default constraints, but they are allowed to be null.

## See Also

[Query Objects and Performance](optimize-sql-query-objects-and-performance.md)  
[GetBySystemId(Guid)](../developer/methods-auto/record/record-getbysystemid-method.md)  
