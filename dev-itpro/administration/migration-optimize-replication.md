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
# Optimizing cloud migration performance

This article outlines practical steps that you can take to enhance the performance of your cloud migration, especially when dealing with large databases. By implementing these measures, you can improve the efficiency and reliability of the migration process while minimizing the risk of data loss or downtime.

> [!TIP]
> We continually work on improving and optimizing the migration tool for larger database sizes. For example, customers can buy more environments, and they can buy extra storage. For more information, see [Managing Capacity](tenant-admin-center-capacity.md). If more assistance is required, contact support as described in [Escalating support issues to Microsoft](manage-technical-support.md#escalating-support-issues-to-microsoft).

## Deploy source database to Azure SQL Database

<!--In certain cases, the customer wants to migrate large amounts of data. For large source databases, we recommend deploying the source database to an Azure SQL Database, and then setting up cloud migration from Azure SQL source instead of the on-premise SQL Server. This eliminates the need to install and maintain self-hosted integration runtime on-premise, and ensures much faster data replication.

Deploying to Azure SQL can be an easy and quick process if done in SQL Server Management Studio connected to the on-premise database. Follow the **Deploy Database to Microsoft Azure SQL Database** wizard, which you find in the **Tasks** context menu on the database. When prompted to choose a service tier for the new Azure SQL database, remember that the lowest configurations may not be adequate for migrating large amounts of data. Consider the right balance between performance and price that would be preferable in your case. The database service tier can be tuned later in Azure Portal.-->

If you're migrating a large amount of data, we recommend deploying your source database to an Azure SQL Database instead of using an on-premises SQL Server. Azure SQL Database eliminates the need to install and maintain a self-hosted integration runtime on-premises and ensures faster data replication. An easy way to deploy to Azure SQL is to use the **Deploy Database to Microsoft Azure SQL Database** wizard in SQL Server Management Studio.

When using the wizard, consider the service tier of the new Azure SQL database carefully. The lowest configurations may not be adequate for migrating large amounts of data. To choose the right balance between performance and price, consider factors such as the size of your source database, the required level of performance, and your budget. You can tune the service tier later in Azure portal if necessary.

## Upscale Azure SQL Database

If you're using Azure SQL Database to migrate your on-premises database, you can monitor CPU and memory utilization in the Azure portal to ensure optimal performance. To monitor utilization, use [Metrics]((/azure/azure-sql/database/monitoring-sql-database-azure-monitor?view=azuresql) for Azure Sql Database in the Azure portal. Metrics shows you real-time performance data for your database, including CPU and memory usage. 

If you notice high consumption of CPU and memory, it may be time to upscale your database. Upscaling the database can improve performance by providing more resources for your database to work with. For more information about upscaling, visit [Dynamically scale database resources with minimal downtime](/azure/azure-sql/database/scale-resources). Keep in mind that upscaling increases the cost of your database, so weigh the benefits against the cost before making any changes.

By monitoring and upscaling your Azure SQL Database as needed, you can ensure optimal performance and avoid performance issues caused by resource constraints.

You can always downscale whenever data replication isn't running.

## Reduce the number of companies migrated

The cloud migration capabilities are optimized to migrate data in batches of up to 250 companies. However, a [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises or [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] database often includes more companies. In some cases, the database contains several hundred companies. Consider reducing the number of companies that you migrate.

<!--[!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]-->

You can specify which companies to include in the migration in the **Cloud Migration Setup** assisted setup guide and view the migration status of each company in the **Cloud Migration Management** page.  

If you want to add more companies after the first selection of companies, you can add more companies in the **Cloud Migration Management** page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. For more information, see [Run the tool multiple times](migration-setup.md#rerunning-cloud-migration-setup-guide). But use the [Capacity](tenant-admin-center-capacity.md) section of the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to keep track of how much data you migrate.  

> [!TIP]
> On page 9035 **Data Administration**, you can find reports that are used to compress or cleanup the data. In earlier Business Central versions, the page may not be present. However, most reports can be found using **Search** .

Here are our recommendations for how to manage companies during the migration:

- Break the migration into batches.  
- If the companies include large data sets, break the migration into smaller batches.  

   For example, you're migrating 10 companies, but two companies include 50 GB each plus 30-GB shared data. In this example, we recommend that you migrate each of the large companies individually.
- Be mindful of any extensions that might complicate the migration as described in [Data from extensions](cloud-migration-plan-prepare.md#determine-what-data-to-migrate).
- Check that the company names are valid. For more information, see [Company names](migration-troubleshooting.md#company-names) in the Troubleshooting article.
- When moving many companies, use Cloud Migration APIs.

  For more information, go to [Cloud Migration API Overview](/dynamics365/business-central/dev-itpro/administration/cloudmigrationapi/cloud-migration-api-overview). Find samples in the [BC Tech GitHub 
repo](https://github.com/microsoft/BCTech/tree/master/samples/CloudMigration/CloudMigrationAPIScript).  

## Update statistics and reorganize indexes
  
Update statistics and reorganize indexes on all tables on the source database. For more information, see the documentation for [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).

## Use dedicated SQL Server

Use an SQL Server instance installed with a copy of the source database and is only used for cloud migration.

## Next steps

[Check prerequisites](cloud-migration-prerequisites.md)  

[Cloud migration setup](migration-setup-overview.md)  
