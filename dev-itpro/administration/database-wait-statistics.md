---
title: "Database Wait Statistics in Dynamics 365 Business Central"
description: "Description about wait statistics page"
author: jswymer
ms.date: 06/21/2022
ms.reviewer: 
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: 
ms.author: jswymer
ms.custom: 
---

# Database Wait Statistics in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]

You can check the performance of your database by looking at the information provided by **Database Wait Statistics** in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. You can see how long the previous queries had to wait with the wait type indicating the reason of the wait. The wait times give you a quick idea about the database performance and where it can be optimized. There can be different reasons for a query to wait, for example, a query can wait for a resource that isn't free or the wait can be because of a queue. For details about the types of wait in SQL database, see [Types of Waits](/sql/relational-databases/system-dynamic-management-views/sys-dm-os-wait-stats-transact-sql#types-of-waits). The **Database Wait Statistics** presents a table with information divided into these types of columns:

* Wait category type, which states reasons for a query to wait. For example, CPU, Idle, Lock, 
Buffer IO, and so on. For more information about these objects, see [SQL Server, Wait Statistics Objects](/sql/relational-databases/performance-monitor/sql-server-wait-statistics-object).
* Different wait time counters, for example, Wait Time in ms, Max Wait Time in ms, and Signal Wait Time in ms.
* Waiting tasks count shows the total count of each wait category that has happened.
* Database start time indicates the time when database was first started or is restarted.

[!INCLUDE[include_note_database_wait_statistics_md](../includes/include-note-database-wait-statistics.md)]

You can also emit this data to telemetry and can analyze it in Application Insights. To do this, choose the **Emit telemetry** icon from the tab. To set the telemetry signal for the application, see [Monitoring and Analyzing Telemetry](telemetry-overview.md). To know more about which information you'll get in Application Insights and how to analyze it, see [Analyzing Database Wait Statistics Telemetry](telemetry-database-wait-statistics-trace.md).


## See Also

[sys.dm_os_wait_stats (Transact- SQL)](/sql/relational-databases/system-dynamic-management-views/sys-dm-os-wait-stats-transact-sql)  
[How to work with a Performance problem](../performance/performance-work-perf-problem.md)  
[Performance Article for Developers](../performance/performance-developer.md)



