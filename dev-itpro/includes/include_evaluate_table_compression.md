To evaluate whether a table is a good candidate to compress, you can use the stored procedure `sp_estimate_data_compression_savings` in SQL Server. For more information, see [sp_estimate_data_compression_savings (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-estimate-data-compression-savings-transact-sql).

> [!NOTE]
> The stored procedure `sp_estimate_data_compression_savings` fails if the table has columns with `&` in the name.