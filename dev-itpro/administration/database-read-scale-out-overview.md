---
title: Using Read Scale-Out for Better Performance 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Using Read Scale-Out for Better Performance

[!INCLUDE[2020_releasewave1.md](../includes/2020_releasewave1.md)]

The way [!INCLUDE[server](../developer/includes/server.md)] interacts with the database can broadly be categorized in two patterns:
- Business processes that read and write data, such as codeunits that run from UI pages or web services.
- Analytical workloads that only read data, such as queries, reports, or API pages.

Where business process transactions typically are frequent and small, transactions from analytical workloads typically read many data and run for a long time. Mixing these two types of transactions in the same database often lead to performance problems. The analytical transactions can cause locking issues, which in turn impose waiting time for business processes. This condition also may disrupt the data cache in the database. Data  will essentially be moved from the cache that speeds up business process transactions

If you run the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database in a High Availability architecture, you can use the built-in **Read Scale-Out** feature in Azure SQL Database or SQL Server to load-balance read-only workloads. **Read-Scale-Out** uses the capacity of a read-only replica instead of sharing the read-write replica (also known as the primary database). This way, read-only workloads like reports, queries, and API pages, are isolated from the main read-write workload codeunits. So they won't affect the performance of business processes. As an added bonus, read-only workloads will run on a dedicated database and their performance will likely be better.

## Getting started using read scale-out

To start using read scale-out, do these three steps:

1. Enable read scale-out on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.
2. As a developer, define the default database access intent (read-only or read-write) on selected reports or query objects.
3. If needed, overwrite the default database access intent on reports, pages of the type API, and queries at runtime.

### Enable read scale-out on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database

In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online service, read scale-out is readily available and automatically enabled on the databases.

For on-premises installations, see [Configuring your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database for read scale-out](database-read-scale-out-configuration.md) to learn how to enable read scale-out on the databases.

### Define the default database access intent in AL code

When you develop solutions for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in AL, you can set the default intended database access intent (read-only or read-write) on reports and query objects that you create. For more information, see [DataAccessIntent property](/dynamics365/business-central/dev-itpro/developer/properties/devenv-dataaccessintent-property).

### Overwrite the database access intent on reports, API pages, and queries

Read scale-out may introduce a slight delay when reading data from a database's secondary replica. The delay is caused by the way High Availability databases replicate data changes from the primary database to secondary replicas. If a delay isn't acceptable for an object, you can overwrite the default database access intent.

For more information, see [Managing Database Access Intent](/dynamics365/business-central/admin-data-access-intent).

## FAQ about read scale-out

#### Which objects are supported?

Reports, API pages, and query objects.

#### What happens if there's a failover to the replica being used for reading?

The [!INCLUDE[server](../developer/includes/server.md)] specifies database access intent as a parameter in the connection string to the database. The [!INCLUDE[server](../developer/includes/server.md)] doesn't know about primary/secondary replicas. So if there's a fail-over, the [!INCLUDE[server](../developer/includes/server.md)] will be redirected by the database.

#### Why is there a delay in when a data change is available on the secondary replicas?

When data is committed to the primary database, the transaction log entries are log-shipped to the transaction log for the secondary replicas. Then, an asynchronous transaction log "redo" operation makes the data available in the secondary databases.

#### What about Sandboxes?

Sandbox environments can't be enabled with read scale-out. Objects that use the **DataAccessIntent** property will compile and run. But they'll just access the primary database.

## See also

[Optimizing SQL Server Performance](optimize-sql-server-performance.md)  
[Performance Overview](../performance/performance-overview.md)
