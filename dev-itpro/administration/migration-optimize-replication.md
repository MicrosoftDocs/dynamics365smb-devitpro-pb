---
title: Optimize Business Central Cloud Migration Performance
description: Learn how to improve Business Central cloud migration performance by managing company batches, source database resources, and API data upgrades.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---
# Optimizing cloud migration performance

This article outlines practical steps that you can take to enhance the performance of your cloud migration, especially when dealing with large databases. By implementing these measures, you can improve the efficiency and reliability of the migration process while minimizing the risk of data loss or downtime.

> [!TIP]
> We continually work on improving and optimizing the migration tool for larger database sizes. For example, customers can buy more environments, and they can buy extra storage. Learn more in [Managing Capacity](tenant-admin-center-capacity.md). If more assistance is required, contact support. Learn more in [Escalating support issues to Microsoft](manage-technical-support.md#escalating-support-issues-to-microsoft).

## Deploy source database to Azure SQL Database

<!--In certain cases, the customer wants to migrate large amounts of data. For large source databases, we recommend deploying the source database to an Azure SQL Database, and then setting up cloud migration from Azure SQL source instead of the on-premise SQL Server. This eliminates the need to install and maintain self-hosted integration runtime on-premise, and ensures much faster data replication.

Deploying to Azure SQL can be an easy and quick process if done in SQL Server Management Studio connected to the on-premise database. Follow the **Deploy Database to Microsoft Azure SQL Database** wizard, which you find in the **Tasks** context menu on the database. When prompted to choose a service tier for the new Azure SQL database, remember that the lowest configurations may not be adequate for migrating large amounts of data. Consider the right balance between performance and price that would be preferable in your case. The database service tier can be tuned later in Azure Portal.-->

If you're migrating a large amount of data, we recommend deploying your source database to an Azure SQL Database instead of using an on-premises SQL Server. Azure SQL Database eliminates the need to install and maintain a self-hosted integration runtime on-premises and can speed up data replication. An easy way to deploy to Azure SQL is to use the **Deploy Database to Microsoft Azure SQL Database** wizard in SQL Server Management Studio.

When using the wizard, consider the service tier of the new Azure SQL database carefully. The lowest configurations may not be adequate for migrating large amounts of data. To choose the right balance between performance and price, consider factors such as the size of your source database, the required level of performance, and your budget. You can tune the service tier later in Azure portal if necessary.

## Upscale Azure SQL Database

If you're using Azure SQL Database to migrate your on-premises database, you can monitor CPU and memory utilization in the Azure portal to ensure optimal performance. To monitor utilization, use **Metrics** for Azure SQL Database in the Azure portal. Metrics shows you real-time performance data for your database, including CPU and memory usage. Learn more in [Monitoring Azure SQL Database with Azure Monitor](/azure/azure-sql/database/monitoring-sql-database-azure-monitor).

If you notice high consumption of CPU and memory, it may be time to upscale your database. Upscaling the database can improve performance by providing more resources for your database to work with. Learn more in [Dynamically scale database resources with minimal downtime](/azure/azure-sql/database/scale-resources). Keep in mind that upscaling increases the cost of your database, so weigh the benefits against the cost before making any changes.

By monitoring and upscaling your Azure SQL Database as needed, you can ensure optimal performance and avoid performance issues caused by resource constraints.

You can always downscale whenever data replication isn't running.

## Reduce the number of companies migrated

Cloud migration recommends batches of fewer than 300 companies and warns when you select many companies. This recommendation isn't a hard limit. A [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises or [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] database can include several hundred companies. Consider reducing the number of companies that you migrate in each batch, especially when companies have large data sets.

<!--[!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]-->

You can specify which companies to include in the migration in the **Cloud Migration Setup** assisted setup guide and view the migration status of each company in the **Cloud Migration Management** page.  

If you want to add more companies after the first selection of companies, you can add more companies in the **Cloud Migration Management** page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. Learn more in [Run the tool multiple times](migration-setup.md#rerunning-cloud-migration-setup-guide). But use the **Capacity** section of the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to keep track of how much data you migrate. Learn more in [Managing Capacity](tenant-admin-center-capacity.md).

> [!TIP]
> On page 9035 **Data Administration**, you can find reports that are used to compress or clean up the data. In earlier Business Central versions, the page may not be present. However, most reports can be found using **Search**.

Here are our recommendations for how to manage companies during the migration:

- Break the migration into batches.  
- If the companies include large data sets, break the migration into smaller batches.  

   For example, you're migrating 10 companies, but two companies include 50 GB each plus 30-GB shared data. In this example, we recommend that you migrate each of the large companies individually.
- Be mindful of any extensions that might complicate the migration. Learn more in [Data from extensions](cloud-migration-plan-prepare.md#determine-what-data-to-migrate).
- Check that the company names are valid. Learn more in [Company names](migration-troubleshooting.md#company-names) in the troubleshooting article.
- When moving many companies, use Cloud Migration APIs.

  Learn more in [Cloud Migration API Overview](/dynamics365/business-central/dev-itpro/administration/cloudmigrationapi/cloud-migration-api-overview). Find samples in the [BC Tech GitHub
repo](https://github.com/microsoft/BCTech/tree/master/samples/CloudMigration/CloudMigrationAPIScript).  

## Update statistics and reorganize indexes
  
Update statistics and reorganize indexes on all tables on the source database. Learn more in [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).

## Use dedicated SQL Server

Use a SQL Server instance with a copy of the source database that is only used for cloud migration.

## Skip API data upgrade

You might experience a long-running data upgrade because of the API upgrade. In this case, you can skip the API data upgrade on a company basis during the cloud migration process, and then run it after going live on the tenant. API data that depends on the skipped upgrades won't be ready until you complete those upgrades.

There are two ways to skip the API data upgrade during cloud migration. One way is to disable it as part of the on-premises upgrade process. The other way is to disable it using cloud migration management in the Business Central online environment.

### From the online environment 

1. Sign in to [Business Central online](https://businesscentral.dynamics.com).
1. [!INCLUDE[open-search](../developer/includes/open-search.md)], enter **Cloud Migration Management**, and then choose the related link.
1. Select the **Manage API Upgrade** action to open the **API upgrade overview** page. 
1. To disable the API data upgrade for a company, do the following steps:

   1. On the **API upgrade overview** page, select the company in the **Company Name** column.

      The **API Data Upgrade List** opens in a new browser tab. 
      
   1. On the **API Data Upgrade List** page, select **Disable API Data Upgrades** > **OK**.
  
      You can close the **API Data Upgrade List** tab after you make the selection. 
1. Repeat the previous step for each company you want to disable the API data upgrade.

   To show the changes  you've made, refresh (<kbd>F5</kbd>) the **API upgrade overview** page.


### If you're running upgrade on-premises

You can use the following SQL query to skip upgrade for a single company. Replace `SetCompanyName` with the company name. Run these statements only on the on-premises database before upgrade, and take a backup first.

```sql
DECLARE @UpgTag nvarchar(250);  
SET @UpgTag = UPPER('MS-469217-DisableAPIDataUpgrade-20230411')  
  
INSERT INTO [dbo].[Upgrade Tags$63ca2fa4-4f03-4f2b-a480-172fef340d3f] (Tag, [Tag Timestamp], [Skipped Upgrade], Company)  
VALUES (  
    UPPER(@UpgTag),  
    '1753-01-01 00:00:00.000',  
    1,  
    UPPER('SetCompanyName')  
);  
```

You can use the following SQL query to skip upgrade for all companies:

```sql
DECLARE @UpgTag nvarchar(250);  
  
SET @UpgTag = UPPER('MS-469217-DisableAPIDataUpgrade-20230411')  
  
INSERT INTO [dbo].[Upgrade Tags$63ca2fa4-4f03-4f2b-a480-172fef340d3f] (Tag, [Tag Timestamp], [Skipped Upgrade], Company)  
SELECT  
    UPPER(@UpgTag),  
    '1753-01-01 00:00:00.000',
    1,  
    UPPER([Name])  
FROM  
    Company   
WHERE  
    UPPER([Name]) NOT IN (  
        SELECT [Company]   
        FROM [Upgrade Tags$63ca2fa4-4f03-4f2b-a480-172fef340d3f]   
        WHERE Tag = UPPER(@UpgTag)  
    )
``` 

## Complete API upgrade after going live

1. Sign in to [Business Central online](https://businesscentral.dynamics.com).
1. [!INCLUDE[open-search](../developer/includes/open-search.md)], enter **Cloud Migration Management**, and then choose the related link.
1. Select **Manage API Upgrade** to open the **API Upgrade Overview** page.
1. For a company whose API upgrade is disabled, select its **Company Name** link to open **API Data Upgrade List**.
1. For each upgrade entry that you need to run whose **Status** isn't blank, select the entry and choose **Reset**.
1. Select the entries to run and choose **Schedule Upgrades**. Only entries with a blank status are scheduled.
1. Follow the prompts to open the **Job Queue Entry Card** and start the job queue entry, or choose to start it immediately.
1. Repeat these steps for each company whose API data upgrade you skipped.

Check **Status** on **API Data Upgrade List** for progress. If the job fails, restart the job queue entry. The job processes entries with **Status** set to **Scheduled**, so completed entries aren't rerun. Upgrade routines commit periodically to release locks, but they can still affect performance.

## Next steps

[Check prerequisites](cloud-migration-prerequisites.md)  

[Cloud migration setup](migration-setup-overview.md)  
