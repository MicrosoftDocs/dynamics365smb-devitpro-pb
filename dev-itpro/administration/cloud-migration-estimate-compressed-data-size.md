---
title: Estimate Compressed Data Size for Business Central Online
description: Estimate compressed data size for Business Central online before cloud migration by using SQL Server compression estimates for your source tables.
author: kennienp 
ms.author: kepontop
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Estimate compressed data size in your Business Central online tenant

In the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], data is compressed using the SQL Server data compression feature. As a consequence, the data size in your on-premises database might not match the data size when migrated to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service.

Currently, all tables in the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] are compressed with `CompressionType` set to `Page`.

[!INCLUDE[evaluate_table_compression](../includes/include_evaluate_table_compression.md)]

If you want to estimate the compressed size of all or some tables in your database, you can create and, if needed, modify the following stored procedure:

```SQL
CREATE PROCEDURE dbo.estimate_page_compressed_table_sizes
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @table_name sysname;
 
    CREATE TABLE #compressed_table_report (
        table_name sysname,
        schema_name nvarchar(max),
        index_id int,
        partition_number int,
        size_with_current_compression_setting bigint,
        size_with_requested_compression_setting bigint,
        sample_size_with_current_compression_setting bigint,
        sample_size_with_requested_compression_setting bigint
    );
 
    DECLARE tables_cur CURSOR FOR 
    SELECT name
    FROM sys.tables
    WHERE schema_id = SCHEMA_ID('dbo');
 
    OPEN tables_cur;
 
    FETCH NEXT FROM tables_cur INTO @table_name;

    WHILE @@FETCH_STATUS = 0 
    BEGIN
        INSERT INTO #compressed_table_report
        EXEC sp_estimate_data_compression_savings
            @schema_name = 'dbo',
            @object_name = @table_name,
            @index_id = NULL,
            @partition_number = NULL,
            @data_compression = 'PAGE';
 
        FETCH NEXT FROM tables_cur INTO @table_name;
    END;
 
    CLOSE tables_cur;
    DEALLOCATE tables_cur;
 
    SELECT
        table_name,
        SUM(size_with_current_compression_setting)
            AS size_with_current_compression_setting_KB,
        SUM(size_with_requested_compression_setting)
            AS size_with_requested_compression_setting_KB,
        SUM(
            size_with_current_compression_setting -
            size_with_requested_compression_setting
        ) AS size_saving_KB
    FROM #compressed_table_report
    GROUP BY table_name
    ORDER BY size_saving_KB DESC;
 
    DROP TABLE #compressed_table_report;
END;
GO
```

To run the stored procedure, execute the following commands:

```SQL
USE [TenantDatabase] -- Replace TenantDatabase with your tenant database name.
GO

EXEC dbo.estimate_page_compressed_table_sizes
GO
```

The stored procedure `sp_estimate_data_compression_savings` fails if the table has columns with `&` in the name. With the following query, you can find the table names that should be excluded in definition of the stored procedure `dbo.estimate_page_compressed_table_sizes`.

```SQL
SELECT t.name AS table_name
     , col.name AS column_name
  FROM sys.columns col
 INNER JOIN sys.tables t ON col.object_id = t.object_id
 WHERE col.name LIKE '%&%'
```

## Next steps

- [Understand data compression in Business Central](./using-sql-partitioning-and-compression.md)  
- [Check prerequisites](cloud-migration-prerequisites.md)  
- [Optimizing cloud migration performance](migration-optimize-replication.md)  
- [Run data migration setup](migration-setup.md)
