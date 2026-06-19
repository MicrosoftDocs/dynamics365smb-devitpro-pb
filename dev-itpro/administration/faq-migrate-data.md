---
title: FAQ about Migrating to Business Central Online
description: Get answers to frequently asked questions about migrating to Business Central online from on-premises solutions, including supported versions and data limits.
author: jswymer
ms.reviewer: jswymer
ms.topic: faq
ms.search.keywords: cloud, edge, migration, faq
ms.date: 05/27/2026
ms.author: jswymer
---

# FAQ about migrating to Business Central online from on-premises solutions

This section contains answers to frequently asked questions about migrating from on-premises solutions to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.  

> [!TIP]
> Check the tips in this article if your organization is not yet ready to migrate to [!INCLUDE [prod_short](../includes/prod_short.md)] online but are thinking hard about it. For more information about migration, see [Migrate On-Premises Data to Business Central Online](migrate-data.md).  

## Which products and versions are supported?

[!INCLUDE [bc-cloud-products](../includes/bc-cloud-products.md)]

For more information, see [Upgrading from Dynamics NAV to Business Central online](../administration/migrate-nav.md).

<!-- - Dynamics SL 2018 CU 1-->

### System requirements

To migrate to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, the on-premises solution must use SQL Server 2016 or a later version, and the database must have compatibility level 130 or higher. The on-premises solution must also be one of the supported versions.  

For comparison, see the [System Requirements for [!INCLUDE[prod_long](../developer/includes/prod_long.md)] (on-premises) 2021 Release Wave 1](../deployment/system-requirements-business-central-v18.md) and subsequent versions.  

## How is my on-premises data migrated to my [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant?

Data is migrated using an Azure service called Azure Data Factory (ADF). ADF is a service that is always running within the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online service manager. When you start the cloud migration, a data pipeline is created in the ADF service so that data can flow from your on-premises solution to your Business Central online tenant. If your data source is a local SQL Server instance, you're also asked to configure a self-hosted integration runtime (SHIR). The runtime is installed locally and manages the communication between the cloud services and your on-premises data without opening any ports or firewalls.  

## Are there any limits on the amount or type of data that can be migrated?

There are no restrictions on the type of data that can be migrated. [!INCLUDE [db-storage-limit](../includes/db-storage-limit.md)]  

We recommend that you reduce the number of companies that you're migrating data for in each migration run. You can specify which companies to include in the migration in the assisted setup wizard.  

If you want to add more companies after the first selection of companies, you can add more companies in the **Cloud Migration Management** page in Business Central online. For more information, see [Run the tool multiple times](migration-setup.md#rerunning-cloud-migration-setup-guide).

## Is my SQL connection string required to set up the connection?

Yes. The SQL connection string is passed to Azure Data Factory, where it's encrypted and delivered to your Self-Hosted Integration Runtime. The connection string is used to communicate with your SQL Server instance during the data replication process. For more information, see [How do I find my SQL connection string?](#how-do-i-find-my-sql-connection-string).  

## How do I find my SQL connection string?

You can find the connection string in SQL Management Studio for an on-premise SQL Server database or in Azure portal for an Azure SQL database. The user name and password defined in the connection requires a SQL Authenticated user name/password

A connection string to an on-premise SQL Server database looks like this:

`Server={SQLServerName}{SQLServerInstance};Database={DatabaseName};User ID={UserName};Password={Password};`

A connection string to an Azure SQL database looks like this:

`Server=tcp:{ServerName},1433;Initial Catalog={DatabaseName};Persist Security Info=False; User ID={UserName};Password={Password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30;`

To learn more, go to [Define SQL database connection and integration runtime](migration-setup.md#define-sql-database-connection-and-integration-runtime).

## How do I find the Integration Runtime name or key?

Find the Integration Runtime name in the Microsoft Integration Runtime Manager, which you can find in your Windows system tray or by searching for the program. You must type the name. You can't copy and paste the name.  You can get the key from the **Cloud Migration Management** by selecting the **Get runtime service key** action. 

## I'm a hosting partner - do I need to configure the Self-Hosted Runtime Service for each tenant?

No, there's no limit on the number of tenants that can be added to your Self-Hosted Integration Runtime. Each added tenant has a dedicated pipeline created. However, if there are multiple tenants migrating using the same Integration Runtime, it's important to plan their migrations in a way that avoids overlapping in time. This will help prevent your Integration Runtime service from experiencing an excessive load.

## Will data from tables with code customizations migrate?

It depends on your approach:

- **Standard migration**: Only tables that are available in both your on-premises solution and your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant migrate. Any customization must be converted to an extension and installed on both your on-premises solution and your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant to replicate.
- **With table mappings**: You can define table mappings to move data from customized fields to standard or extension fields. For more information, go to [Define Migration Table Mappings](migration-table-mapping.md).
- **BC14 reimplementation**: If you use the [Business Central 14 reimplementation tool](migrate-bc14-reimplementation.md), only essential business data (master data, opening balances, setup) migrates. This option doesn't require converting customizations to extensions.

## Why are my permissions restricted in the Business Central online tenant?

When you connect your on-premises solution to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online as part of the migration, all existing users are automatically added to the *Intelligent Cloud* user group, unless they have the SUPER permission set. In this configuration, your on-premises solution is the primary source where all business transactions take place. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online environment is read-only, and the data is used to generate intelligent business insights based on your on-premises data for you. We restrict permissions to prevent users from accidentally entering transactions or updating primary records only to have that information overwritten and lost when data replication takes place. Once the migration is complete, you can assign the relevant permissions to all users and stop using your on-premises solution.  

## Will my on-premises users and permissions replicate?

No. Since you aren't required to configure your on-premises solution with Microsoft Entra ID, we can't guarantee a mapping between on-premises users and users in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online requires Microsoft Entra accounts, and users must be manually added. All permissions must be granted in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant, independent from your on-premises permissions.  

For more information, see [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions).

## Is the data replication only one way?

Yes, data is only replicated from the on-premises solution to your Business Central online tenant for the purposes of migration. Once you start using [!INCLUDE [prod_short](../includes/prod_short.md)] online, you must stop using your on-premises solution.  

## Should I uninstall all my Business Central extensions?

No. But if your cloud migration includes data upgrade of a large amount of data, we recommend that you uninstall the extensions that include any data to move. It speeds up the upgrade and overall cloud migration process. You can reinstall the extensions after the migration.

## How long does the initial migration take, and how can I reduce the data volume?

The initial migration takes the longest because all data is moved. After the initial migration, only changes are transferred, so later replications run faster. The exact duration depends on the amount of data, your SQL Server configuration, and connection speeds.

To help manage timing and avoid storage limits, consider the following practices:

- If your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online storage exceeds 80 GB, some administrative tasks are disabled. We recommend that you keep the amount of data to less than 30 GB per migration run.
- Reduce the number of companies you migrate in a single run. You can migrate specific companies and add more companies later.
- Delete outdated data in tables that contain log entries and archived records before you start the migration.
- Consider deploying the source database to Azure SQL Database for improved migration speeds. Learn more at [Optimize cloud migration performance](migration-optimize-replication.md).

## Related information

[Plan and prepare for cloud migration](cloud-migration-plan-prepare.md)  
[Troubleshooting Cloud Migration](migration-troubleshooting.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
