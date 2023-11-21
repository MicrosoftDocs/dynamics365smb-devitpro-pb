---
title: Estimating the data size in your Business Central online tenant
description: This article outlines how to estimate the data size in your Business Central online tenant
author: kennienp 
ms.author: kepontop
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 11/06/2023
ms.custom: bap-template
---

# Estimating the data size in your Business Central online tenant

In the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], data is compressed using the SQL Server data compression feature. As a consequence, the data size in your on-premises database might not match the data size when migrated to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service.

Currently, all tables in the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] are compressed with **CompressionType** set to **Page**.

[!INCLUDE[evaluate_table_compression](../includes/include_evaluate_table_compression.md)]

If you want to estimate the compressed size of all or some tables in your database, you can create (and possibly modify) the following stored procedure:

```SQL
CREATE PROCEDURE estimate_page_compressed_table_sizes
AS 
SET NOCOUNT ON
BEGIN
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
 
DECLARE tables_cur cursor for 
SELECT name
  FROM sys.tables
-- adjust this part if you want to restrict the tables in the calculation
-- WHERE table_name in ('table name 1', 'table name 2', 'table name 3') 
;
 
OPEN tables_cur;
 
FETCH NEXT FROM tables_cur INTO @table_name
WHILE @@Fetch_Status = 0 
BEGIN
    INSERT INTO #compressed_table_report
    EXEC sp_estimate_data_compression_savings
        @schema_name = 'dbo', -- Business Central use the dbo schema
        @object_name = @table_name,
        @index_id = NULL,
        @partition_number = NULL,
        @data_compression = 'PAGE'
    ;
 
    FETCH NEXT FROM tables_cur INTO @table_name
END;
 
CLOSE tables_cur;
DEALLOCATE tables_cur;
 
SELECT table_name
     , avg(size_with_current_compression_setting) as avg_size_with_current_compression_setting_KB
     , avg(size_with_requested_compression_setting) as avg_size_with_requested_compression_setting_KB
     , avg(size_with_current_compression_setting - size_with_requested_compression_setting) AS avg_size_saving_KB
  FROM #compressed_table_report
 GROUP BY table_name
 ORDER BY avg_size_saving_KB DESC 
;
 
DROP TABLE #compressed_table_report
;
 
END
SET NOCOUNT OFF
GO
```

When running the stored procedure, do this

```SQL
USE <tenant database> // change to your database
GO

EXEC estimate_page_compressed_table_sizes
GO
```

As mentioned above, the stored procedure `sp_estimate_data_compression_savings` fails if the table has columns with `&` in the name. With this query you can find the table names that should be excluded in definition of the stored procedure `estimate_page_compressed_table_sizes`.

```SQL
SELECT t.name AS table_name,
     , ind.name AS index_name,
     , col.name AS column_ame
  FROM sys.indexes ind 
 INNER JOIN sys.index_columns ic ON ind.object_id = ic.object_id AND ind.index_id = ic.index_id 
 INNER JOIN sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id 
 INNER JOIN sys.tables t ON ind.object_id = t.object_id 
 WHERE col.name LIKE '%&%'
```


## Next steps

- [Using table partitioning and data compression in Business Central](./using-sql-partitioning-and-compression.md)  
- [Check prerequisites](cloud-migration-prerequisites.md)  
- [Optimizing cloud migration performance](migration-optimize-replication.md)  
- [Run data migration setup](migration-setup.md)