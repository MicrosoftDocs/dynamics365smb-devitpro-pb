---
title: "Performance of On-Premises Installations"
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# Performance of On-Premises Installations
In this section, we have highlighted a number of resources that might be useful when doing performance investigations and tuning of on-premises installations of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In this context, on-premises mean deployment to any environment that is not the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service, which means that if you are running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Azure resources, this is also considered on-premises.

Content is ordered in three groups

- Tuning the technology stack
- Scaling [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
- Measure and monitor performance

## Performance tuning the technology stack

A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation typically consists of the following components, where the following components can be tuned to improve performance:

- Web Server
- Server (NST)
- Database
- Network

### Web Server 
TODO

### Server (NST)

NST Database settings 
- Hints, [Enabling Smart SQL](../administration/configure-server-instance#Database.md)
- [Buffered insert](../administration/optimize-sql-bulk-inserts.md)
- SQL Bulk Import Batch Size
- Enable SQL Parameters by Ordinal

Web service limits 
- [SOAP Services Settings](../administration/configure-server-instance.md#SOAPServices)
- [OData Services Settings](../administration/configure-server-instance.md#ODataServices)

Task Scheduler

[Maximum Concurrent Running Tasks](../administration/configure-server-instance.md#Task)


### Database (SQL Server or Azure SQL database)

First of all, make sure that you avoid common pitfalls in your SQL Server setup  
[Installation Considerations for Microsoft SQL Server and Business Central](../deployment/installation-considerations-for-microsoft-sql-server.md)  
[Setting SQL Compatibility Level to Optimize Database Performance](../administration/optimize-sql-set-compatibility-level.md)

Tune data access  
[Using SQL Server table partitioning](../administration/optimize-sql-data-access.md#TablePartitioning)  
[Using SQL Server data compression](../administration/optimize-sql-data-access.md#Compression)  

SQL Server vs. Azure SQL database  
[Differences between Azure SQL database and SQL Server](../deployment/deploy-database-azure-sql-database.md#differences-between-azure-sql-database-and-sql-server)  
[Troubleshooting: Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](../administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql.md)  
[Configuring Query Hints for Optimizing SQL Server Performance with Business Central](../administration/sql-server-query-hints.md)  
[Troubleshooting: Using Query Store to Monitor Query Performance in Business Central](../administration/troubleshoot-query-performance-using-query-store.md)

#### Performance of bacpac generation
In the February 2019 update of sqlpackage (the command line tool that is used to generate bacpac/dacpac files), a significant schema compare performance issue when generating a script was solved. Make sure that you use version 18.1 or later if you experience issues in bacpac generation performance.

#### Performance impact on setting up CDC on SQL Server
Customer can set up CDC on their database. Impact can be that SQL Server will be slower (depends on the retention period) and that they need storage for the extra data.

#### Performance impact of enabling Transparent Data Enryption (TDE)

[Performance impact of security filtering Mode](../security/security-filters.md#PerformanceImpact)

### Network

[Installation Considerations for Microsoft SQL Server and Business Central](../deployment/installation-considerations-for-microsoft-sql-server.md)  
[Configuring Kernel Mode Authentication on the Business Central Web Server](../deployment/configure-delegation-web-server.md#Kernel)

## Scaling [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

On compute (NSTs and Web servers), it is possible to scale horizontally by separating NSTs and Web servers on different nodes. For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md)

It is also common on larger installations to separate traffic based on client type (direct UI and Odata traffic to different NSTs). Possibly co-hosting NSTs and Web servers on the same nodes.

The Business Central server (NST) has a built-in thread dispatcher for AL execution. This means that more cores means more parallel execution (but have in mind that AL execution as such is single-threaded (until 2020 Wave 2 release, where we start introducing async processing)). For long running operations such as heavy reports, using faster CPUs will give better performance.

On the database side, make sure that SQL Server has enough resources for sessions (both CPU and memory) and try to optimize the setup of SQL Server to BC. For more information, see [Installation Considerations for Microsoft SQL Server and Business Central](../deployment/installation-considerations-for-microsoft-sql-server.md)

## Measure and Monitor performance

[Monitoring Business Central Server Events](../administration/monitor-server-events.md)  
[Tools for Monitoring Performance Counters and Events](../administration/tools-monitor-performance-counters-and-events.md)  
[Troubleshooting: Using the Event Viewer to Monitor Long Running SQL Queries in Business Central](../administration/troubleshoot-long-running-queries-using-event-log.md)  
[Troubleshooting: Using Query Store to Monitor Query Performance in Business Central](../administration/troubleshoot-query-performance-using-query-store.md)

## See Also
