---
title: Plan Dynamics SL Cloud Migration to Business Central
description: Plan your Dynamics SL migration to Business Central online, select company data, test replication, and schedule the final backup, upgrade, and validation.
author: lcontreras
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---
# Prepare and plan for cloud migration from Dynamics SL

This article provides recommendations to help you define your cloud migration strategy and get environments and users ready for cloud migration.

## Run migration assessment tool

The **Migration Assessment Tool** provides insight into your readiness to migrate. It offers migration options based on your needs and detects potential issues with your Dynamics SL system.

Download the [Dynamics SL Analysis and Repair tools](https://github.com/microsoft/BCTech/tree/master/samples/DynamicsSLMigrationTools/Analysis%20and%20Repair%20Tool) from Microsoft's BCTech repository.

Details on compiling and using the files are included on GitHub.

> [!WARNING]
> Before installing or running the tools, make sure that you have restorable backups of both the SL application and system databases. The Repair Tool updates data in the SL application database. Learn more in [Repair Tool installation instructions](https://github.com/microsoft/BCTech/blob/master/samples/DynamicsSLMigrationTools/Analysis%20and%20Repair%20Tool/Repair%20Tool/Documentation/Repair%20Read%20Me%20Installation%20Instructions.txt).

- The **Analysis Tool** connects to a Microsoft Dynamics SL database and generates an analysis report text file.
  - The report outlines and provides an overview of the modules in use and examines the data that can be migrated to Business Central.
  - Analysis Report information example:
    - Microsoft Dynamics SL version
    - Microsoft SQL version
    - Overview of Microsoft Dynamics SL modules being used
    - Module details including the number of:
      - Records in master tables
      - Records in transaction tables

  - The **Repair Tool** connects to a Microsoft Dynamics SL database.
    - The Repair tool is used to validate Microsoft Dynamics SL data to identify any issues that require repair before using the online Business Central tool to migrate Microsoft Dynamics SL data to Microsoft Dynamics Business Central.
    - Repair Tool:
      - Includes automated fixes to the Microsoft Dynamics SL data.
      - Includes repair items that need to be addressed.

## Determine what data to migrate

The data migrated is determined on a per-company basis. The SL migration apps transform supported SL data into Business Central data according to the company options you select. Learn more in [Configure Dynamics SL company migration](migrate-sl-configure-companies.md).

You can choose to migrate data for all companies or only specific companies. We recommend that you determine which companies to migrate upfront to save time and resources. Keep in mind that the more companies you replicate in a single operation, the longer the migration takes.

[!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

## Determine your migration approach

Ensure you have a solid migration strategy for a smooth transition. Most migrations can run from the on-premises production database with minimal downtime for end users. For large migrations, consider running the migration from a backup of the on-premises database. Doing migrations this way improves migration speeds and minimizes performance loss and downtime on the on-premises production database. The following steps outline a typical migration approach.

1. [Create a full backup](/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server) of the SL system and application databases that you plan to migrate. Restore the backups to a SQL Server instance that meets the migration prerequisites and is licensed for the workload.
1. [Prepare the SL databases](cloud-migration-prerequisites-sl.md#prepare-the-sl-databases) on the migration source instance and address any issues that arise.
1. Complete the cloud migration setup, including choosing the companies to migrate.
1. Run the [replication](migrate-data-replication-run.md) and address any issues that arise.
1. Stop users from entering data in the on-premises environment before taking the final backups.
1. Restore the final backups to the migration source SQL Server instance, run the final replication, and resolve any errors. Keep the on-premises environment closed to data entry.
1. Run [data upgrade](migration-data-upgrade-sl.md), review posting results, and test the migrated data in the online environment.
1. [Complete the migration](migration-finish-sl.md) and go live in the online environment.

> [!IMPORTANT]
> Keep the Dynamics SL source version and Business Central online version unchanged while cloud migration is set up. [Schedule updates](update-rollout-timeline.md) to the online environment for a date after cloud migration is complete.
>
> Avoid changing extensions while cloud migration is enabled. If you need to install or uninstall extensions, disable cloud migration, make the changes, and then set up cloud migration again.

Keep in mind that the migration process can be complex, and issues might arise that require more troubleshooting. It's important to stay flexible and be prepared to adjust your migration strategy as needed to address any problems that arise.

<a name="schedule"></a>
## Schedule the final migration

- Plan the switch to use [!INCLUDE [prod_short](../includes/prod_short.md)] online for production only after the migration is complete.

  [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]  

- Schedule the migration to avoid conflicts with updates to [!INCLUDE [prod_short](../includes/prod_short.md)] online.

  [!INCLUDE [bc-cloud-migrate-upgrade](../includes/bc-cloud-migrate-upgrade.md)]

## Next steps

- [Cloud migration prerequisites for Dynamics SL](cloud-migration-prerequisites-sl.md)\
- [Optimize cloud migration performance](migration-optimize-replication.md)  
- [Run cloud migration setup for Dynamics SL migration](migration-setup-sl.md)
