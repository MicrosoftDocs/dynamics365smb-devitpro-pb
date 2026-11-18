---
title: Plan Dynamics GP Cloud Migration to Business Central
description: Plan your Dynamics GP migration to Business Central online, select company data, test replication, and schedule the final backup, upgrade, and validation.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---
# Prepare and plan for cloud migration from Dynamics GP

This article provides recommendations to help you define your cloud migration strategy and get environments and users ready for cloud migration.

## Run migration assessment tool

The migration assessment tool delivers valuable insight into your overall readiness to migrate. It provides migration options based on your needs and detects potential migration issues based on your Dynamics GP system structure. To get started, go to the [cloud migration assessment tool](https://bcmigrationassessments.com/).

Learn more about the tool in the video [Are You Ready for Business Central](https://www.youtube.com/watch?v=r2gNgQrCgoo&list=PLcakwueIHoT9yVFOV6_BXMVeodPq3lt3o&index=15).

## Determine what data to migrate

The data that's migrated is determined on a per-company basis. The GP migration apps transform supported GP data into Business Central data according to the company options you select. Learn more in [Configure Dynamics GP company migration](migrate-gp-configure-companies.md).

You can choose to migrate data for all companies or only specific companies. We recommend that you determine which companies to migrate upfront to save time and resources. Keep in mind that the more companies you replicate in a single operation, the longer the migration takes.

[!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

## Determine your migration approach

It's important to have a solid migration strategy in place to ensure a smooth transition. Most migrations can run from the on-premises production database with minimal downtime for end users. However, for especially large migrations, it might be better to run migration from a backup of the on-premises database<!--deployed as Azure SQL Database-->. Doing migrations this way improves migration speeds and minimizes performance loss and downtime on the on-premises production database. The following steps outline a typical migration approach.

1. [Create a full backup](/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server) of the GP system and company databases that you plan to migrate. Restore the backups to a SQL Server instance that meets the migration prerequisites and is licensed for the workload.
1. Complete the usual preparation steps on the backup on-premises database and address any issues that arise.
1. Complete cloud migration setup, including choosing the companies and configuring the GP data to migrate. On **GP Migration Settings**, turn off **Run migration after replication** so that data transformation doesn't start after a test replication.
1. Run the [replication](migrate-data-replication-run.md) and address any issues that arise.
1. Stop users from entering data in the on-premises environment before taking the final backups.
1. Restore the final backups to the migration source SQL Server instance, run the final replication, and resolve any errors. Keep the on-premises environment closed to data entry.
1. Run [data upgrade](migration-data-upgrade-gp.md) and [validate the migrated data](migrate-gp-validation.md) in the online environment.
1. Optionally, copy Dynamics GP data to Azure Data Lake for future reference and wait for the copy to complete. This copy requires cloud migration to remain enabled and is separate from the SQL Server backup. Learn more in [Copy Dynamics GP data to Azure Data Lake](cloud-migration-azure-data-lake-gp.md).
1. [Complete the migration](migration-finish-gp.md) and go live in the online environment.

> [!IMPORTANT]
> Keep the Dynamics GP source version and Business Central online version unchanged while cloud migration is set up. [Schedule updates](update-rollout-timeline.md) to the online environment for a date after cloud migration is complete.
>
> Avoid changing extensions while cloud migration is enabled. If you need to install or uninstall extensions, disable cloud migration, make the changes, and then set up cloud migration again.

Keep in mind that the migration process can be complex, and issues might arise that require more troubleshooting. It's important to stay flexible and be prepared to adjust your migration strategy as needed to address any problems that arise.

<a name="schedule"></a>
## Schedule the final migration

- Plan the switch to use [!INCLUDE [prod_short](../includes/prod_short.md)] online for production carefully so that production use doesn't start until migration is complete.

  [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]  

- Schedule the migration so that it doesn't conflict with an update of [!INCLUDE [prod_short](../includes/prod_short.md)] online.

  [!INCLUDE [bc-cloud-migrate-upgrade](../includes/bc-cloud-migrate-upgrade.md)]

## Next steps

- [Check prerequisites](cloud-migration-prerequisites-gp.md)  
- [Optimizing cloud migration performance](migration-optimize-replication.md)  
- [Run cloud migration setup for Dynamics GP](migration-setup-gp.md)
