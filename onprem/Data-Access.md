---
title: "Data Access"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fd5a62ed-50c7-49ad-9610-f299e1961725
caps.latest.revision: 19
manager: edupont
---
# Data Access
Data that is needed in the client goes through the following path from the [!INCLUDE[nav_server](includes/nav_server_md.md)] to the SQL Server database:
1.  If the data is cached in the [!INCLUDE[nav_server](includes/nav_server_md.md)] data cache, it is returned.
2.  If the data is not cached in the [!INCLUDE[nav_server](includes/nav_server_md.md)] data cache, it is fetched from SQL Server over the network as follows:
    1. If the data resides in SQL Servers data cache, it is returned.
    2. If the data does not reside in SQL Servers data cache, it is fetched from storage and returned.

## Dynamics NAV Server data caching
In [!INCLUDE[navnow](includes/navnow_md.md)], the data cache is shared by all users who are connected to the same [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. This means that after one user has read a record, a second user who reads the same record gets it from the cache. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], the data cache was isolated for each user.  

The following C/AL functions utilize the cache system:  
-   GET  
-   FIND  
-   FINDFIRST  
-   FINDLAST  
-   FINDSET  
-   COUNT  
-   ISEMPTY  
-   CALCFIELDS  

There are two types of caches, global and private:  

-   Global cache is for all users connected to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
-   Private cache is per user, per company, in a transactional scope. Data in a private cache for a given table and company is flushed when a transaction ends.  

The cache that is used is determined by the lock state of a table. If a table is not locked, then the global cache is queried for data; otherwise, the private cache is queried.  

Results from query objects are not cached.  

For a call to any of the **FIND** functions, 1024 rows are cached. You can set the size of the cache by using the **Data Cache Size** setting in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration file. The default size is 9, which approximates a cache size of 500 MB. If you increase this number by one, then the cache size doubles.  

You can bypass the cache by using the [SELECTLATESTVERSION Function \(Database\)](SELECTLATESTVERSION-Function--Database-.md).  

[!INCLUDE[navnow](includes/navnow_md.md)] synchronizes caching between [!INCLUDE[nav_server](includes/nav_server_md.md)] instances that are connected to the same database. By default, the synchronization occurs every 30 seconds.  

You can set the cache synchronization interval by using the *CacheSynchronizationPeriod* parameter in the CustomSettings.config file. This parameter is not included in the CustomSetting.config file by default, so you must add it manually using the following format:

```
<add key="CacheSynchronizationPeriod" value="hh:mm:ss" />
```
For example, to set the interval to 50 seconds, set the `value` to `"00:00:50"`. For more information about the CustomSettings.config file, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

## [!INCLUDE[nav_server](includes/nav_server_md.md)] connections to SQL Server
Starting from [!INCLUDE[nav7long_md](includes/nav7long_md.md)], the [!INCLUDE[nav_server](includes/nav_server_md.md)] uses ADO.NET to connect to the SQL Server database. Installations of [!INCLUDE[nav2009](includes/nav2009_md.md)] and earlier uses ODBC to connect to the SQL Server database.

The ADO.NET interface is a managed data access layer that supports SQL Server connection pooling, which can dramatically decrease memory consumption by [!INCLUDE[nav_server](includes/nav_server_md.md)]. SQL Server connection pooling also simplifies deployment of the [!INCLUDE[navnow](includes/navnow_md.md)] three-tier architecture for deployments where the three tiers are installed on separate computers. Specifically, administrators are no longer required to manually create SPNs or to set up delegation when the client, [!INCLUDE[nav_server](includes/nav_server_md.md)], and SQL Server are on separate computers. For more information, see [Walkthrough: Installing the Three Tiers on Three Computers](Walkthrough--Installing-the-Three-Tiers-on-Three-Computers.md).  

There is no longer a one-to-one correlation between the number of client connections and the number of SQL Server connections. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], each SQL Server connection could consume up to 40 MB of memory. Additionally, memory allocation is now in managed memory, which is generally more efficient than unmanaged memory.  

 Records are retrieved using Multiple Active Result Sets \(MARS\). Functions such as NEXT, FIND\('-'\), FIND\('+'\), FIND\('>'\), and FIND\('\<'\) are generally faster with MARS than the server cursors that earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)] used.  

## Data read/write performance  
C/AL functions COUNT and AVERAGE formulas can use SIFT indexes. For more information, see [CALCSUMS Function \(Record\)](CALCSUMS-Function--Record-.md) and [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md). MIN and MAX formulas use SQL Server MIN and MAX functions exclusively.  

 RecordIds and SQL Variant columns in a table do not prevent the use of BULK inserts. For more information, see [Bulk Inserts](Bulk-Inserts.md).  

In most cases, filtering on FlowFields issues a single SQL statement. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], filtering on FlowFields issued an SQL statement for each filtered FlowField and for each record in the table in order to calculate the filtered FlowFields. The exceptions in [!INCLUDE[navnow](includes/navnow_md.md)] in which filtering on FlowFields does not issue a single SQL statement are as follows:  

-   You use the ValueIsFilter option on a field and the field has a value. For more information about the ValueIsFilter option, see [How to: Create, View, and Edit a Calculation Formula](How-to--Create--View--and-Edit-a-Calculation-Formula.md).  

-   A second predicate is specified on a source field and the field that is used for the second predicate has a value. For example, when you specify the [CalcFormula Property](CalcFormula-Property.md) for a FlowField, you can specify table filters in the **Calculation Formula** window. If you specify two or more filters on the same source field, then filtering does not issue a single SQL statement.  

-   You specify **Validated** for the [SecurityFiltering Property](SecurityFiltering-Property.md) on a record. This value for the **SecurityFiltering** property means that each record that is part of the calculation must be verified for inclusion in the security filter.  

In most cases, calling the FIND or NEXT functions after you have set the view to include only marked records issues a single SQL statement. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], calling FIND or NEXT functions that have marked records issued an SQL statement for each mark. There are some exceptions if many records are marked. For more information, see [MARKEDONLY Function \(Record\)](MARKEDONLY-Function--Record-.md).  

## Using SQL Server table partitioning
As of [!INCLUDE[nav2018_md](includes/nav2018_md.md)], the use of SQL Server table and index partitioning is a supported configuration. The data of partitioned tables and indexes is divided into units that can be spread across more than one filegroup in a SQL Server database. All partitions of a single index or table must reside in the same database. The table or index is treated as a single logical entity when queries or updates are performed on the data. Prior to SQL Server 2016 SP1, partitioned tables and indexes were not available in every edition of SQL Server.
Partitioning large tables or indexes can have the following manageability and performance benefits:
-   You can perform maintenance operations on one or more partitions more quickly. The operations are more efficient because they target only these data subsets, instead of the whole table. For example, you can choose to rebuild one or more partitions of an index.
-   You might be able to improve query performance, based on the types of queries you frequently run and on your hardware configuration.
When SQL Server performs data sorting for I/O operations, it sorts the data first by partition. SQL Server accesses one drive at a time, and this might reduce performance. To improve data sorting performance, stripe the data files of your partitions across more than one disk by setting up a RAID (redundant array of independent disks). In this way, although SQL Server still sorts data by partition, it can access all the drives of each partition at the same time.
-   You can use partitioning to distribute parts of tables to different IO sub systems. For example, you could archive data for old transactions on slow and inexpensive disks and keep current data on solid-state drives (SSD).
You can improve performance by enabling lock escalation at the partition level instead of a whole table. This can reduce lock contention on the table.

For more general information about partitioned tables and indexes in SQL Server, see [Partitioned Tables and Indexes](https://docs.microsoft.com/en-us/sql/relational-databases/partitions/partitioned-tables-and-indexes).

### How Dynamics NAV supports partitioning

If you have altered tables in a [!INCLUDE[navnow](includes/navnow_md.md)] database to make them partitioned tables, the synchronization engine, which is responsible for mapping the logical metamodel to physical tables, will respect this configuration during upgrades. After a schema upgrade, even if tables have been dropped and recreated, the partitioning strategy applied to the original tables will be added to the upgraded tables.
You can create a partitioned table or index in SQL Server by using SQL Server Management Studio or Transact-SQL.

> [!NOTE]  
> For partitioning to work, the partition column must be part of the clustering key on the table.

### Table Partioning Example
This example uses Transact-SQL to change table **G_L Entry** to be partitioned on the **Posting Date** field, with data partitioned on the year, and where all partitions are aligned to the PRIMARY file group.

1. In SQL query editor, create a partition function that creates partitions that divide on year (this can be used for partitioning multiple tables):

    ```
    CREATE PARTITION FUNCTION [DataHistoryPartitionFunction] (datetime)
    AS RANGE LEFT FOR VALUES (
    '20151231 23:59:59.997',
    '20161231 23:59:59.997',
    '20171231 23:59:59.997',
    '20181231 23:59:59.997'  )
    GO
    ```

2. Create a partition scheme that maps partitions to file groups. In this example, all partitions are mapped to the PRIMARY file group (this can be used for partitioning multiple tables):

    ```
    CREATE PARTITION SCHEME DataHistoryPartitionScheme
    AS PARTITION DataHistoryPartitionFunction ALL TO ([PRIMARY])
    GO
    ```

3. In the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)], add the **Posting Date** field to the primary key.

    For more information, see [How to: Define Primary and Secondary Keys](How-to--Define-Primary-and-Secondary-Keys.md).

4. In the Transact-SQL Editor, partition table **G_L Entry** by using the previously defined partition scheme:

    ```
    ALTER TABLE [dbo].[G_L Entry]  
    DROP CONSTRAINT [G_L Entry$0]
    GO

    ALTER TABLE [dbo].[G_L Entry]
    ADD CONSTRAINT [G_L Entry$0] PRIMARY KEY CLUSTERED
    (
    [$companyId], [Entry No_], [Posting Date]
    )
    ON DataHistoryPartitionScheme( [Posting Date] )
    GO
    ```

> [!TIP]
> SQL Server Management Studio includes the **Create Partition Wizard** to help you create partitioning functions, partitioning schemes, as well as changing a table to be partitioned. For more information, see [Create Partitioned Tables and Indexes](https://docs.microsoft.com/en-us/sql/relational-databases/partitions/create-partitioned-tables-and-indexes).

## See Also  
 [Changes in C/AL Behavior and Support from Earlier Versions of Microsoft Dynamics NAV](Changes-in-C-AL-Behavior-and-Support-from-Earlier-Versions-of-Microsoft-Dynamics-NAV.md)   
 [SumIndexField Technology \(SIFT\)](SumIndexField-Technology--SIFT-.md)   
 [Query Objects and Performance](Query-Objects-and-Performance.md)
