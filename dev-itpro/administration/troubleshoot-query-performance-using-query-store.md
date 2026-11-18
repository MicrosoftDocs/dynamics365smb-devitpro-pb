---
title: "Troubleshooting: Using Query Store to Monitor Query Performance"
description: Use SQL Server Query Store to troubleshoot query performance. The SQL Server Query Store feature provides insight on database query plan choice and performance.
author: KennieNP
ms.date: 11/17/2026
ms.topic: troubleshooting
ms.author: kepontop
ms.reviewer: jswymer
ai-usage: ai-assisted
---
# Troubleshooting: Using Query Store to monitor query performance in Business Central

## What is SQL Server Query Store?
The SQL Server Query Store feature provides you with insight on database query plan choice and performance. It simplifies database performance troubleshooting by helping you quickly find performance differences caused by query plan changes. Query Store automatically captures a history of queries, plans, and runtime statistics, and retains these for your review.

## Where is SQL Server Query Store available?
SQL Server Query Store is available in SQL Server (starting with SQL Server 2016) and in Azure SQL Database.

## What are the common scenarios for using the Query Store feature?
Query Store keeps a history of compilation metrics and runtime statistics aggregated over time intervals. It isn't a log of every individual query execution. With this information, you can get answers to questions about your workload, such as:
-   Which *n* captured queries ran most recently?
-   What was the number of executions for each query?
-   Which queries had the longest average execution time within the last hour?
-   Which queries had the biggest average physical IO reads in the last 24 hours, with the corresponding average row count and execution count?

## Do you want to read more?
Learn more about setting up, configuring, and using Query Store in the following articles:

[Monitoring Performance By Using the Query Store](/sql/relational-databases/performance/monitoring-performance-by-using-the-query-store)

[Operating the Query Store in Azure SQL Database](/azure/sql-database/sql-database-operate-query-store)

## Related information
[Installation Considerations for Microsoft SQL Server](../deployment/installation-considerations-for-microsoft-sql-server.md)  
