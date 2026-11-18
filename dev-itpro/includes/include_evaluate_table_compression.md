---
author: jswymer
ms.topic: include
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
To evaluate whether a table is a good candidate to compress, you can use the stored procedure `sp_estimate_data_compression_savings` in SQL Server. Learn more in [sp_estimate_data_compression_savings (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-estimate-data-compression-savings-transact-sql).

> [!NOTE]
> The stored procedure `sp_estimate_data_compression_savings` fails if the table has columns with `&` in the name.