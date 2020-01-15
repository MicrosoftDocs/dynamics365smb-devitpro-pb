---
title: ""
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: 
---

# Performance of On-Premises installations
In this section, we have highlighted a number of resources that might be useful when doing performance investigations and tuning of on-premises installations of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In this context, on-premises mean deployment to any environment that is not the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service (so if you run [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Azure resources, this is also considered on-premises).

Content is ordered in three groups 
- Tuning the technology stack:
- Scaling [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
- Measure and Monitor performance

## Performance Tuning the technology stack
A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installations typically consists of the following components, off of which can be tuned to improve performance:
- Web Server
- Server (NST)
- Database
- Network

### Web Server 
TODO

### Server (NST)

NST Database settings 
- Hints, Enabling Smart SQL https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/configure-server-instance#Database
- Buffered insert https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-bulk-inserts
- SQL Bulk Import Batch Size
- Enable SQL Parameters by Ordinal

How to setup web service limits: 
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/configure-server-instance#SOAPServices
- https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/configure-server-instance#ODataServices

Task Scheduler: Maximum Concurrent Running Tasks https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/configure-server-instance#Task


### Database (SQL Server or Azure SQL database)

First of all, make sure that you avoid common pitfalls in your SQL Server setup: 
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/installation-considerations-for-microsoft-sql-server
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-set-compatibility-level

Tune data access
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-data-access#TablePartitioning
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/optimize-sql-data-access#Compression

SQL Server vs. Azure SQL database
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/deploy-database-azure-sql-database#differences-between-azure-sql-database-and-sql-server


https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshooting-queries-involving-flowfields-by-disabling-smartsql

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/sql-server-query-hints

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshoot-query-performance-using-query-store

**Performance of bacpac generation**
In the February 2019 update of sqlpackage (the commandline tool that is used to generate bacpac/dacpac files), a significant schema compare performance issue when generating a script was solved. Make sure that you use version 18.1 or later if you experience issues in bacpac generation performance.

**Performance Impact on setting up CDC on SQL Server**
Customer can set up CDC on their database. Impact can be that SQL Server will be slower (depends on the retention period) and that they need storage for the extra data.

**Performance impact of enabling Transparent Data Enryption (TDE)**
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/security/security-filters#PerformanceImpact


### Network

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/installation-considerations-for-microsoft-sql-server

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/configure-delegation-web-server#Kernel

## Scaling [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
On compute (NSTs and web servers), it is possible to scale horizontally by separating NSTs and web servers on different nodes (see https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/configure-server-instance )

It is also common on bigger installations to separate traffic based on client type (direct UI and Odata traffic to different NSTs). Possibly co-hosting NSTs and web servers on the same nodes

The BC server (NST) has a built-in thread dispatcher for AL execution. This means that more cores means more parallel execution (but have in mind that AL execution as such is single-threaded (until 2020 Wave 2 release, where we start introducing async processing)). For long running operations such as heavy reports, using faster CPUs will give better performance

On the database side, make sure that SQL Server has enough resources for sessions (both CPU and memory) and try to optimize the setup of SQL Server to BC (see https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/installation-considerations-for-microsoft-sql-server )

## Measure and Monitor performance
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/monitor-server-events 
 
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/tools-monitor-performance-counters-and-events 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshoot-long-running-queries-using-event-log 

https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/troubleshoot-query-performance-using-query-store



## See Also
