---
title: "Performance of Business Central On-Premises Installations"
ms.custom: na
ms.date: 01/29/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# Performance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] On-Premises Installations

In this section, we have highlighted a number of resources that might be useful when doing performance investigations and tuning of on-premises installations of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In this context, on-premises means deployment to any environment that is not the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service, which means that if you are running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Azure resources, this is also considered on-premises.

Content is ordered into four groups:

- [Tuning the technology stack](#tuningstack)
- [Scaling [!INCLUDE[prodshort](../developer/includes/prodshort.md)]](#scaling)
- [Measure and monitor performance](#measure)
- [How to troubleshoot a performance problem]() <!-- this is not yet a section, comment out?

## <a name="tuningstack"></a>Performance tuning the technology stack

A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation typically consists of the following components, which can be tuned to improve performance:

- Client
- Web Server
- Server (NST)
- Database

### Client 

There are three things of importance when dealing with client performance:

- Hardware of the computer running the client
- Choice of browser
- Network bandwidth and latency between the client and the data center running [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

These topics are described in [Performance in Business Central Online](performance-online.md).

### Web Server 

You can adjust the following settings related to web server performance. For more information, see [Configuring Kernel Mode Authentication on the Business Central Web Server](../deployment/configure-delegation-web-server.md#Kernel).

### Server (NST)

You can adjust the following NST settings related to database performance.

| Server setting | Description  | Read more    |
|----------------|--------------|--------------|
| BufferedInsertEnabled | Disabling bulk inserts can be helpful when you are troubleshooting failures that occur when inserting records. | [Disabling Bulk Inserts](../administration/optimize-sql-bulk-inserts.md) | 
| DisableQueryHintForceOrder | Check if this setting is set to **true**. | [Configuring Query Hints for Optimizing SQL Server Performance with Business Central](../administration/sql-server-query-hints.md) |
| DisableQueryHintLoopJoin | Check if this setting is set to **true**. | [Configuring Query Hints for Optimizing SQL Server Performance with Business Central](../administration/sql-server-query-hints.md) |
| DisableSmartSql | If the performance of loading a page that contains FlowFields in [!INCLUDE[prodshort](../developer/includes/prodshort.md) is bad, you might want to try isolating and testing FlowField queries separately. | [Troubleshooting: Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](../administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql.md) |
| SqlBulkImportBatchSize | Specifies how many SQL memory chunks that a data import must be distributed across. Lowering the value increases the number of network transfers and decreases performance, but also lowers the amount of memory that the server instance consumes.  | [Database Settings](../administration/configure-server-instance.md#Database) |


#### Web service limits 

You can adjust NST settings related to web service calls to implement resource governance (and avoid resource starvation on the NSTs) here: 

- [SOAP Services Settings](../administration/configure-server-instance.md#SOAPServices)  
- [OData Services Settings](../administration/configure-server-instance.md#ODataServices)  

#### Task Scheduler

You can adjust NST settings related to the task scheduler to implement resource governance (and avoid resource starvation on the NSTs) here: 

- [Maximum Concurrent Running Tasks](../administration/configure-server-instance.md#Task)


### Database (SQL Server or Azure SQL database)

First of all, make sure that you avoid common pitfalls in your SQL Server setup: 

- [Installation Considerations for Microsoft SQL Server and Business Central](../deployment/installation-considerations-for-microsoft-sql-server.md)  
- [Setting SQL Compatibility Level to Optimize Database Performance](../administration/optimize-sql-set-compatibility-level.md)

#### Tune data access

These topics describe how you can utilize SQL Server table partitioning and data compression to get faster data retrieval:

- [Using SQL Server table partitioning](../administration/optimize-sql-data-access.md#TablePartitioning)  
- [Using SQL Server data compression](../administration/optimize-sql-data-access.md#Compression)  

#### SQL Server vs. Azure SQL database  
Read more about the difference between SQL Server and Azure SQL database with respect to performance:

- [Differences between Azure SQL database and SQL Server](../deployment/deploy-database-azure-sql-database.md#differences-between-azure-sql-database-and-sql-server)  

#### Troubleshooting database performance issues

These topics can be useful when troubleshooting database performance issues:

- [Troubleshooting: Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](../administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql.md)  
- [Configuring Query Hints for Optimizing SQL Server Performance with Business Central](../administration/sql-server-query-hints.md)  
- [Troubleshooting: Using Query Store to Monitor Query Performance in Business Central](../administration/troubleshoot-query-performance-using-query-store.md)

#### Performance of bacpac generation

In the February 2019 update of sqlpackage (the command line tool that is used to generate bacpac/dacpac files), a significant schema compare performance issue when generating a script was solved. Make sure that you use **version 18.1 or later** if you experience issues in bacpac generation performance.

#### Performance impact on setting up CDC on SQL Server

There is a performance impact if you set up CDC on the database. SQL Server will be slower (depends on the retention period used) and you also need storage for the extra data.

#### Performance impact of enabling Transparent Data Enryption (TDE)

Enabling Transparent Data Enryption (TDE) has a slight performance degradation on SQL Server as it need CPU resources for encryption/decryption of data.


## <a name="scaling"></a>Scaling [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

On compute (NSTs and Web servers), it is possible to scale horizontally by separating NSTs and Web servers on different nodes. For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).

It is also common on larger installations to separate traffic based on client type (direct UI and OData traffic to different NSTs). Possibly co-hosting NSTs and Web servers on the same nodes.

The [!INCLUDE[prodshort](../developer/includes/prodshort.md) server (NST) has a built-in thread dispatcher for AL execution. This means that more cores mean more parallel execution (but have in mind that AL execution as such is single-threaded (until the [!INCLUDE[prodshort](../developer/includes/prodshort.md) 2019 release wave 2, where we started introducing async processing)). For long running operations such as heavy reports, using faster CPUs will give better performance.

On the database side, make sure that SQL Server has enough resources for sessions (both CPU and memory) and try to optimize the setup of SQL Server to [!INCLUDE[prodshort](../developer/includes/prodshort.md). For more information, see [Installation Considerations for Microsoft SQL Server and Business Central](../deployment/installation-considerations-for-microsoft-sql-server.md).

## <a name="measure"></a>Measure and Monitor performance

The following resources describes ways that you measure and monitor performance in your [!INCLUDE[prodshort](../developer/includes/prodshort.md) installation on-premises:

- [Monitoring Business Central Server Events](../administration/monitor-server-events.md)  
- [Tools for Monitoring Performance Counters and Events](../administration/tools-monitor-performance-counters-and-events.md)  
- [Troubleshooting: Using the Event Viewer to Monitor Long Running SQL Queries in Business Central](../administration/troubleshoot-long-running-queries-using-event-log.md)  
- [Troubleshooting: Using Query Store to Monitor Query Performance in Business Central](../administration/troubleshoot-query-performance-using-query-store.md)

## See Also

[Performance Overview](performance-overview.md)  
[Performance Topics For Developers](performance-developer.md)  
[How Application Configurations Affect Performance](performance-application.md)  
[Performance Online](performance-online.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md) 
