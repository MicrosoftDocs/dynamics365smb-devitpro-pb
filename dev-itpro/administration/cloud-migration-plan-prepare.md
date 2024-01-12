---
title: Prepare and plan for cloud migration from Business Central on-premises
description: This article provides recommendations to help you define your cloud migration strategy and get environments and users ready for cloud migration.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 07/26/2023
ms.custom: bap-template 
---

# Prepare and plan for cloud migration from Business Central on-premises

This article provides recommendations to help you define your cloud migration strategy and get environments and users ready for cloud migration.

## Determine what data to migrate

The data that's migrated is determined on two levels: per-company and per-extension.

### Company data

When a company is migrated, data in company-specific tables of base application is migrated, along with company-specific data belonging to other extensions (for information, see the next section).

You can choose to migrate data for all companies or only specific companies. It's recommended to determine which companies to migrate upfront to save time and resources. Keep in mind that the more companies you replicate in a single operation, the longer the migration takes. The cloud migration capabilities are optimized to migrate data in batches of up to 10 companies. If you have more than 250 companies, it's recommended to plan to run the migration in smaller batches. For more information, see [Optimizing cloud migration performance](migration-optimize-replication.md#reduce-the-number-of-companies-migrated).

[!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

> [!NOTE]
> Per-database tables are always migrated, no matter which companies are selected for a migration run.

### Extension data

In general, on-premises data in table objects and table extension objects belonging to an extension is only migrated if the following conditions are met:

- The extension is installed on online environment.
- The extension's [ReplicateData property](../developer/properties/devenv-replicatedata-property.md) is set to `true`.

Because `true` is the default setting, most extensions that are installed on the [!INCLUDE[prod_short](../includes/prod_short.md)] online environment will have table data migrated.  

In certain circumstances, you may not want to migrate all data. Here are a couple examples:

- The extension is installed in the [!INCLUDE[prod_short](../includes/prod_short.md)] online environment but not in the [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises solution

    In this case, [!INCLUDE[prod_short](../includes/prod_short.md)] attempts to migrate the data but shows a warning. Because the extension isn't installed on-premises, any table related to that extension table won't migrate, and warning notifications appear in the cloud migration status page.

    If you own the extension, we recommend that you set the **ReplicateData** property to *No* on the extension tables. If you don't, and if you want data to migrate, install the extension in both [!INCLUDE[prod_short](../includes/prod_short.md)] online and your on-premises solution. If you don't want data to migrate, uninstall the extension from the [!INCLUDE[prod_short](../includes/prod_short.md)] online environment.  

- The extension references a base table

    This condition can cause your base table to appear empty when you view data in your [!INCLUDE[prod_short](../includes/prod_short.md)] online tenant. In such cases, uninstall the extension from your [!INCLUDE[prod_short](../includes/prod_short.md)] online tenant and then run the cloud migration process again.

    Business Central will insert the default values and records into the table extensions automatically. If there are any problems, you can use the **Repair Companion Table Records** action on the **Cloud Migration Management** page to insert the missing table extension record

> [!TIP]
> Use the **Cloud Migration Management** page to verify that data migrated correctly. [!INCLUDE [bc-cloud-migrate-tableext](../includes/bc-cloud-migrate-tableext.md)]

For more information, see [FAQ about Migrating to Business Central Online from On-Premises Solutions](faq-migrate-data.md) and [Troubleshooting Cloud Migration](migration-troubleshooting.md).  

## Estimate the data size in your [!INCLUDE[prod_short](../includes/prod_short.md)] online tenant
In the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], data is compressed using the SQL Server data compression feature. This means that the data size in your on-premises database might not match the data size when migrated to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service. For more information on estimating the compressed size of your data, see [Estimating the data size in your Business Central online tenant](./cloud-migration-estimate-compressed-data-size.md). 


## Define migration strategy

<!--Ideally, to ensure all data is migrated, you'd stop all users from working in the on-premises environment while you made the migration to online. However, given the time it takes to complete the migration, this downtime typically isn't feasible. So, you want to devise a strategy that provides a stable migration, limits downtime for users, and results in no data loss. There's no exact approach to follow, because of the unknowns that can arise. But in general, the following approach provides a solid basis or starting point for most migrations.-->

It's important to have a solid migration strategy in place to ensure a smooth transition. While it's ideal to stop all users from working in the on-premises environment during migration, this downtime is often not feasible due to the time it takes to complete the migration. To minimize downtime and ensure a successful migration, consider following these steps:

<!--
1. Back up the on-premises database.

    Users can continue to work in the on-premises environment.
1. Set up cloud migration.
1. Run a diagnostic on the backup to identify potential problems
1. Resolve any problems, then run the diagnostic again.
1. Run the actual data migration.

   This step migrates most of the data, while on-premises users may still be working.
1. Resolve any problems.
1. Repeats steps 1 to 6 as needed, until you get to a state where that's suitable for the final migration run.
1. Stop users from working on-premise, then repeat steps 1 to 6 for the final migration.
-->
1. Back up the on-premises database.

   Users can continue to work in the on-premises environment while the backup is being made.
1. Set up cloud migration from the restored backup.
1. Run a diagnostic on the backup to identify potential problems.
1. Resolve any issues and run the diagnostic again.
1. Begin the actual data migration.

   This step migrates most of the data, while users may still be working in the on-premises environment.
1. Address any problems that arise.
1. Repeat steps 1-6 as needed until you reach a state that's suitable for the final migration run.
1. Stop users from working on-premises and repeat steps 1-6 for the final migration.

Following these steps can help ensure a stable migration that minimizes downtime for users and results in no data loss. However, keep in mind that the migration process can be complex, and issues may arise that require more troubleshooting. It's important to stay flexible and be prepared to adjust your migration strategy as needed to address any problems that arise.

## Schedule

- Plan the switch to use [!INCLUDE [prod_short](../includes/prod_short.md)] online for production carefully to not start until migration is complete  

  [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]  

- Schedule the migration to not conflict with an update of [!INCLUDE [prod_short](../includes/prod_short.md)] online

  [!INCLUDE [bc-cloud-migrate-upgrade](../includes/bc-cloud-migrate-upgrade.md)]

## Next steps

- [Check prerequisites](cloud-migration-prerequisites.md)  
- [Optimizing cloud migration performance](migration-optimize-replication.md)  
- [Run data migration setup](migration-setup.md)
