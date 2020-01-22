---
title: Datbase Replicas
description: Create a new database in the development environment and by using the New-NAVDatabase cmdlet in the Administration Shell. 
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Utilizing Read Scale-Out for Better Performance

The way [!INCLUDE[server](../developer/includes/server.md)] interacts with the database can broadly be categorized in two patterns:
- Business processes that read and write data, such as codeunits that run from UI pages or web services.
- Analytical workloads that only read data, such as queries, reports, or API pages.

Where business process transactions typically are frequent and small, transactions from analytical workloads typically read a lot of data and run for a long time. Mixing these two types of transactions in the same database can often lead to performance problems: the analytical transactions can cause locking issues (which in turn impose waiting time for business processes) and can also disrupt the data cache in the database, essentially moving out data from the cache that speeds up business process transactions.

If you run the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in a High Availability architecture, you can utilize the built-in **Read Scale-Out** feature in Azure SQL Database or SQL Server to load-balance read-only workloads by using the capacity of one of the read-only replicas instead of sharing the read-write replica (also known as the primary database). This way read-only workloads (reports, queries, and API pages) will be isolated from the main read-write workload (codeunits) and will not affect the performance of business processes.

## Getting started using read scale-out

You need to do three things to start using read scale-out:

1. Enable read scale-out on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.
2. As a developer, define the default database access intent (read-only or read-write) on selected reports or query objects.
3. At runtime, overwrite the default database access intent on reports, pages of the type API, and queries.

### Enable read scale-out on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database

In the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online service, read scale-out is readily available and automatically enabled on the databases.

For on-premises installations, see [Configuring your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database for read scale-out](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-dataaccessintent-property?branch=tfs337368-readscaleout) to learn how to enable read scale-out on the databases.

### Define the default database access intent in AL code

When you develop solutions for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in AL, you can set the default intended database access intent (read-only or read-write) on reports and query objects that you create. For more information, see [DataAccessIntent property](/dynamics365/business-central/dev-itpro/developer/properties/devenv-dataaccessintent-property).

### Overwrite the database access intent on reports, API pages, and queries

Because of the way High Availability databases replicate data changes from the primary database to its secondary replicas, there can be a delay of up to a few seconds when reading data from a secondary replica of the database. If this data delay is not acceptable for a given report, query, or API page used in a business process, you can overwrite the default database access intent. For more information, see [Managing Database Access Intent](https://review.docs.microsoft.com/en-us/dynamics365/business-central/admin-data-access-intent?branch=tfs337368-readscaleout).

## Frequently asked questions about read scale-out

#### Which objects are supported?

Reports, API pages and query objects.

#### What happens in case of a failover to the replica being used for reading?

The [!INCLUDE[server](../developer/includes/server.md)] specifies database access intent as a parameter in the connection string to the database. The [!INCLUDE[server](../developer/includes/server.md)] does not know about primary/secondary replicas, so in case of a fail-over, the [!INCLUDE[server](../developer/includes/server.md)] will be redirected by the database.

#### Why is there a delay in when a data change is available on the secondary replicas?

When data is committed to the primary database, the transaction log entries are log-shipped to the transaction log for the secondary replicas. Then, an asynchronous transaction log redo operation makes the data available in the secondary databases.

## See also

[Optimizing SQL Server Performance](optimize-sql-server-performance.md)  