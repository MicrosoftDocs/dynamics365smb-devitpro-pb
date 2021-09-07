---
title: "Microsoft Dynamics 365 Business Central Performance Counters"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: 5c13ad00-234e-4307-8159-deef62da9b90
caps.latest.revision: 28
manager: edupont
author: jswymer
---
# Business Central Performance Counters
The following table describes the performance counters that are available in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for monitoring [!INCLUDE[server](../developer/includes/server.md)] instances.

##  Client session counters
These counters pertain to sessions from the clients, NAS, and web services, to the server instance.

|  Counter  |  [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]  |
|-----------|-----------------------------------------------------------------------|
|\# Active child sessions|Number of active child sessions on the [!INCLUDE[server](../developer/includes/server.md)] instance. An active child session is a connection to the server instance from a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client, such as the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], NAS, or Web services. A child session is created by a background task that is run asynchronously on a page. For more information, see [Page Background Tasks](../developer/devenv-page-background-tasks.md).|
|\# Active sessions|Number of active sessions on the [!INCLUDE[server](../developer/includes/server.md)] instance.<br /><br /> An active session is a connection to the [!INCLUDE[server](../developer/includes/server.md)] instance from a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client, such as the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], and Web services (OData and SOAP).|
|Server operations/sec|Number of operations that have started on the [!INCLUDE[server](../developer/includes/server.md)] per second.<br /><br /> An operation is a call to the [!INCLUDE[server](../developer/includes/server.md)] instance from a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to run [!INCLUDE[prod_short](../developer/includes/prod_short.md)] objects.<br /><br />Note: OData and SOAP requests are not included.|
|Average server operation time \(ms\)|Average duration of server operations in milliseconds.|

<!-- This information is for SRE and should be added to the Runbooks
### Analyzing poor client performance
If you are experiencing poor or degraded performance of the clients, perform the following tasks:

1.  Monitor the ‘CPU usage %’ (% Processor Time counter).

    If the value consistently matches ‘logical cores’ – 1 (50% on 1-core machines, 75% on 2-core machines), this indicates that the thread dispatcher constantly has threads waiting to execute.

2.  Monitor the **# Active sessions** counter
    High ‘CPU usage %’ can be caused by background tasks or client sessions. Looking at **# Active sessions** gives an indication of whether the load is because of the large number of sessions (see notes below).

3. Monitor the **Total # Pending Tasks** counter

    Another strong indicator of an overloaded CPU is a persistently high **Total # Pending Tasks** value. If **Total # Pending Tasks** is high, take a look at the scheduled task performance counters to help identify possible cause.
4.  Monitor the **Heartbeat time \(ms\)** counter

    The **Heartbeat time \(ms\)** counter can indicate whether there is high latency to the database server.

### Analyzing # Active sessions
-   Prior to [!INCLUDE[nav2017](../developer/includes/nav2017.md)], NAS services would keep sessions open to run background jobs, so you would see a lot of active sessions. Now, jobs are run in system sessions, so they do not influence this performance counter. Therefore, you would expect that the number of active sessions is occasionally 0. If you expect that there should be no active sessions, but the counter is indicating otherwise, this could be caused by a deadlock situation that is keeping sessions alive.

-  To get a view of how many customers are hitting a server instance, you should aggregate over an hour, for example, and then look at either the maximum or average values. If you see large values, use TelemetryInformation tag *000007R* to find which client types are using the sessions.  but notice that “000007R” also includes system sessions.

> [!NOTE]
>System sessions are not counted. Sessions are incremented just before writing to the event log.-->

## SQL Server connection counters
These counters pertain to the connection from the server instance to the SQL Server instance and databases.

|  Counter  |  [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]  |
|-----------|-----------------------------------------------------------------------|
|\# Mounted tenants|Number of tenants that are mounted on the [!INCLUDE[server](../developer/includes/server.md)] instance. This counter is relevant with a multitenant server instance, where tenants are often mounted and dismounted.<br /><br />|
|\# Open connections|The current number of open connections from the [!INCLUDE[server](../developer/includes/server.md)] instance to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases on SQL Servers.<br /><br />The value is always equal to the sum of the **# Open tenant connections** counter and the **# Open application connections** counter. -We recommend that you use these counters instead.|
|# Open application connections|Current number of open application connections from the [!INCLUDE[server](../developer/includes/server.md)] instance to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application database on SQL Servers.<br /><br />Because all connections are to only one application database, you will see failures when the total number of connections for all server instances exceeds the maximum number of connections allowed to the database.<!--<br /><br />This value should be fairly low at all times (most likely in the single-digits). Pay particular attention to startup and shutdown scenarios.-->|
|\# Open tenant connections|Current number of open tenant connections from the [!INCLUDE[server](../developer/includes/server.md)] instance to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant databases on SQL Servers.<br /><br />If there are multiple tenant databases, you cannot see the distribution of opened connections per database (or database pool).<br /><br />With Azure SQL Database, connections are denied if the throttling limit is reached. The limit depends on the database configuration. Be aware that in clusters, other server instances will also have connections to the same database, so the total load on a database requires that you look at multiple server instances.<br /><br /><!-- You can expect the number to be up to twice that of **# Active Sessions** counter. High numbers on SharedDB or elastic database pool can cause connection failures on Azure SQL, in which case we will have to either move tenants out of the SharedDB / elastic pool, or increase the database tier.-->|
|% Query repositioning rate|Percentage of queries that are re-executed when fetching the query result.|
|Hard throttled connections|Number of connections that were hard-throttled.|
|Soft throttled connections|Number of connections that were soft-throttled.|
|Transient errors|Number of transient errors.|
|Heartbeat time \(ms\)|The time that it takes to complete a single write to a system table. Conceptually, this counter measures the time it takes to call the application database server to update the 'last active' field the **dbo.Service Instance** table for the [!INCLUDE[server](../developer/includes/server.md)] instance. Every 30 seconds, the instance writes a record to indicate that the instance is "alive."<br /><br />You can use this counter to indicate if there is network latency between the [!INCLUDE[server](../developer/includes/server.md)] and the database.|
|\# Preferred connection total requests|Count of the total number of requests to the preferred connection cache. The preferred connection cache contains requests from the SQL connection pool that was last used by a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user.|
|% Preferred connection cache hit rate|Percentage of hits in the preferred connection cache, compared to the total number of requests.|

<!-- This info is for SRE and should be added to the Runbooks ### Analyzing database connection failures
If you are experiencing significant instances where the server instance cannot establish a session with the database, monitor **# Open application connections** and **# Open tenant database connections**.

Each database has a limit on the number of connections/sessions that can be made to it. When the limit for the database is reached, new connections are denied.

### <a name="MountedTenants"></a>Analyzing # Mounted Tenants
If operating successfully, when a server instance starts, the counter value will increase until is reaches a steady value. Sharp drop-offs indicate that a server instance is stopping (and possibly restarting again).

Example:

The following figure shows an example of the **# Mounted Tenants** counter for a cluster of server instances.

![# Mounted Tenants Counter.](media/Nav_Mounted_Tenants_Perf_Counter_Example.png "NAV\Nav_Mounted_Tenants_Perf_Counter_Example")

In this example, several server instances were unstable, which resulted in constant restarts. This is indicated by the erratic behavior in the chart. To resolve this issue, the density of the cluster was lowered by moving tenants from server instances represented by blue/green lines to the server instance represented by the orange lines.

<br /><br />For more information about tenants, see.-->

## Data and caching counters
These counters pertain to the data caching on the server instance.

|  Counter  |  [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]  |
|-----------|-----------------------------------------------------------------------|
|\# Calculated fields cache total requests|Count of the total number of requests to the calculated fields cache. The calculated fields cache contains the results of [CalcFields method \(Record\)](../developer/methods-auto/record/record-calcfields-method.md) calls.|
|% Calculated fields cache hit rate|Percentage of hits in the calculated fields cache, compared to the total requests to the calculated fields cache.|
|\# Command cache total requests|Count of the total number of requests to the command cache. The command cache contains the results of all SQL commands.|
|% Command cache hit rate|Percentage of hits in the command cache, compared to the total requests to the command cache.|
|\# Primary key cache total requests|Count of the total number of requests to the primary key cache. The primary key cache contains the results of requests to get a record by using its primary key.|
|% Primary key cache hit rate|Percentage of hits in the primary key cache, compared to the total requests to the primary key cache.|  
|\# Result set cache total requests|Count of the total number of requests to the result set cache. The result set cache contains result sets that are returned from SQL Server.|
|% Result set cache hit rate|Percentage of hits in the result set cache, compared to the total requests to the result set cache.<BR /><BR />The value also depends on the usage pattern and which parts of the application are is used. For example, the [SelectLatestVersion method](../developer/methods-auto/database/database-selectlatestversion-method.md) will clear the cache, which results in a lower hit rate.<BR /><BR />In general, reading frequently updated values will lower the hit rate because the cache synchronization across [!INCLUDE[server](../developer/includes/server.md)] instances will remove stale values, which causes re-reads.|
|\# Rows in all temporary tables|Count of number of rows in all temporary tables.|

## Scheduled task counters
These pertain to tasks that are run by Task Scheduler.

|  Counter  |  [!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]  |
|-----------|-----------------------------------------------------------------------|
|# Available tasks|Remaining number of tasks that can potentially run simultaneously before the maximum number of tasks is reached. The value of this counter is the value the **Maximum # of tasks** counter minus the value of the **# Running tasks** counter.|
|# of task errors/sec|Number of errors per second that are caused by running tasks. The task are causing errors in AL or exceptions on the server instance. If the value is greater than zero for an extended period of time, this typically indicates a failing task that keeps getting rescheduled.|
|# Running tasks|Number of tasks that are currently running on the server instance. The  value is limited to the value of the **Maximum # of tasks** counter.|
|Average task execution time|The average time (in ticks) that tasks have taken to complete.  Task execution time is counted regardless of whether the task completed successfully or raised an error. <br /><br />There is no general rule for what the normal operations level is. To analyze this counter, look for large spikes to identify long-running tasks.<br /><br />**Note:** A tick is the smallest unit that the your system uses for time measurements, and it is typically determined by the operating system. For example, in Windows, a single tick represents one hundred nanoseconds, which means that there are 10,000 ticks in a millisecond. Tick durations can differ bewteen systems, so be aware of this fact when comparing absolute values across systems.|
|Maximum # of tasks|The maximum number of tasks that can run simultaneously. This value is defined by the **Maximum Concurrent Running Tasks** (TaskSchedulerMaxConcurrentRunningTasks) setting in the server instance configuration. Therefore, this  value is constant until the server instance setting is changed and the instance is restarted. |
|Total # Pending tasks|The total number of tasks in the shared task list that are waiting to be picked up by server instances connected to this application database. The tasks counted are those that are ready and have been scheduled to run now or earlier and that are not currently running.|
|Total # Running tasks|Total number of tasks in the shared task list that are currently running by any server instance connected to this application database. |
|Time (ms) since the list of running tasks last had capacity for new tasks|The time (ms) since the list of running tasks last had capacity for new tasks.|

For more information about task scheduler, see [Task Scheduler](../developer/devenv-task-scheduler.md).

## See Also  
 [Set up Performance Counters in Windows Performance Monitor](set-up-performance-counters-performance-monitor.md)   
 [Create a Data Collector Set From Template](monitor-create-data-collector-set-from-template.md)   
 [Optimizing SQL Server Performance with Business Central](Optimize-SQL-Server-Performance.md)
