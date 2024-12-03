---
title: Optimizing cloud migration performance
description: This article explains things you can do to improve the performance of the cloud migration, especially when migrating large databases.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual
ms.date: 03/22/2023
ms.custom: bap-template
---
# Optimizing cloud migration performance for Dynamics GP

This article outlines practical steps that you can take to enhance the performance of your cloud migration, especially when dealing with large databases. By implementing these measures, you can improve the efficiency and reliability of the migration process while minimizing the risk of data loss or downtime.

> [!TIP]
> We continually work on improving and optimizing the migration tool for larger database sizes. For example, customers can buy more environments, and they can buy extra storage. For more information, see [Managing Capacity](tenant-admin-center-capacity.md). If more assistance is required, contact support as described in [Escalating support issues to Microsoft](manage-technical-support.md#escalating-support-issues-to-microsoft).

## Reduce the number of companies migrated

The cloud migration capabilities are optimized to migrate data in batches of up to 250 companies. Consider reducing the number of companies that you migrate.

Here are our recommendations for how to manage companies during the migration:

- Break the migration into batches.  
- If the companies include large data sets, break the migration into smaller batches.  

   For example, you're migrating 10 companies, but two companies include 50 GB each plus 30-GB shared data. In this example, we recommend that you migrate each of the large companies individually.
- When moving many companies, use Cloud Migration APIs.

  For more information, go to [Cloud Migration API Overview](/dynamics365/business-central/dev-itpro/administration/cloudmigrationapi/cloud-migration-api-overview). Find samples in the [BC Tech GitHub 
repo](https://github.com/microsoft/BCTech/tree/master/samples/CloudMigration/CloudMigrationAPIScript).  

## Update statistics and reorganize indexes
  
Update statistics and reorganize indexes on all tables on the source database. For more information, see the documentation for [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).

## Use dedicated SQL Server

Use an SQL Server instance installed with a copy of the source database and is only used for cloud migration.

## Next steps

[Check prerequisites](cloud-migration-prerequisites-gp.md)  

[Cloud migration setup](migration-setup-overview.md)  
