---
title: Plan and Prepare for Business Central Cloud Migration
description: This article provides recommendations to help you define your cloud migration strategy and get environments and users ready for cloud migration.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---
# Prepare and plan for cloud migration from Business Central on-premises

This article provides recommendations to help you define your cloud migration strategy and get environments and users ready for cloud migration.

## Assess your current state

Before you start planning what data to migrate, assess your current on-premises environment to understand the scope and effort required. The following checklist outlines the key areas to review:

- **Current version and cumulative update level**: Identify your current [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] or [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises version. This information determines the upgrade path you must follow.
- **Database size, growth rate, and number of companies**: Measure the current database size and identify how many companies you need to migrate. Large databases or many companies require more planning around batches and timing.
- **Customization inventory**: Catalog all modified objects, ISV add-ons, and integrations. Customizations typically represent the biggest technical risk and effort in a migration.
- **Performance baseline and largest tables**: Identify the largest transactional and log tables. These tables affect migration duration and may be candidates for archiving or cleanup.
- **Compliance and data residency requirements**: Determine whether data residency, industry compliance, or security requirements affect your migration approach or target environment region.
- **Business validation criteria and sign-off owners**: Define who validates the migrated result and what success criteria must be met before cutover.

## Determine what data to migrate

The data that's migrated is determined on two levels: per-company and per-extension.

### Company data

For full data migration, data in company-specific tables of the base application is migrated, along with company-specific data belonging to other extensions. Learn more in [Extension data](#extension-data).

You can choose to migrate data for all companies or only specific companies. We recommend that you determine which companies to migrate upfront to save time and resources. Keep in mind that the more companies you replicate in a single operation, the longer the migration takes. Cloud migration recommends batches of fewer than 300 companies and warns when you select many companies. This recommendation isn't a hard limit. Use smaller batches for companies with large data sets. Learn more in [Reduce the number of companies migrated](migration-optimize-replication.md#reduce-the-number-of-companies-migrated).

[!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

> [!NOTE]
> - Per-database tables are shared across companies and can be replicated regardless of which companies you select. Review these tables before replication.
>
> - We advise that you move all companies to the tenant before going live. Moving companies into a live tenant can lead to data loss in the live companies. Learn more in [Migrating Business Central on-premises companies to live tenants](migrate-companies-live-tenant.md).

### Extension data

> [!NOTE]
> This section doesn't apply if you're using the [Business Central 14 reimplementation tool](migrate-bc14-reimplementation.md). That tool migrates selected business data and doesn't include extension data by default. You can extend the tool to migrate other fields and custom tables, and to run postmigration actions. Learn more in [Extend the tool](migrate-bc14-reimplementation.md#extend-the-tool).

In general, on-premises data in table objects and table extension objects belonging to an extension is only migrated if the following conditions are met:

- The extension is installed in the online environment.
- The [ReplicateData property](../developer/properties/devenv-replicatedata-property.md) on the relevant tables or table extensions is set to `true`.

Because `true` is the default setting, most extensions that are installed on the [!INCLUDE[prod_short](../includes/prod_short.md)] online environment will have table data migrated.  

In certain circumstances, you might not want to migrate all data. Here are a couple examples:

- The extension is installed in the [!INCLUDE[prod_short](../includes/prod_short.md)] online environment but not in the [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises solution

    In this case, [!INCLUDE[prod_short](../includes/prod_short.md)] attempts to migrate the data but shows a warning. Because the extension isn't installed on-premises, any table related to that extension table isn't migrated, and warning notifications appear in the cloud migration status page.

    If you own the extension, we recommend that you set the `ReplicateData` property to `false` on the extension tables. If you don't, and if you want data to migrate, install the extension in both [!INCLUDE[prod_short](../includes/prod_short.md)] online and your on-premises solution. If you don't want data to migrate, uninstall the extension from the [!INCLUDE[prod_short](../includes/prod_short.md)] online environment.

- Records are missing from a table extension's companion table

    This condition can cause pages to appear empty even when the base table data was copied to your [!INCLUDE[prod_short](../includes/prod_short.md)] online tenant.

    Business Central inserts the default values and records into the table extensions automatically. If records are missing, use the **Repair companion table records** action on the **Cloud Migration Management** page to insert the missing companion records.

> [!TIP]
> Use the **Cloud Migration Management** page to verify that data migrated correctly. [!INCLUDE [bc-cloud-migrate-tableext](../includes/bc-cloud-migrate-tableext.md)]

Learn more in [FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md) and [Troubleshooting cloud migration](migration-troubleshooting.md).

## Estimate the data size in your [!INCLUDE[prod_short](../includes/prod_short.md)] online tenant

In the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], data is compressed using the SQL Server data compression feature. This condition means that the data size in your on-premises database might not match the data size when migrated to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service. Learn more in [Estimating the data size in your Business Central online tenant](cloud-migration-estimate-compressed-data-size.md).

## Prepare your data for migration

Use the period before migration to reduce technical debt and potential issues in the database:

- Archive obsolete history and shrink oversized transaction or log tables where appropriate.
- Validate that any schema changes in your database are intentional and expected.
- Confirm that the SQL Server version and database compatibility level meet the [cloud migration prerequisites](cloud-migration-prerequisites.md): SQL Server 2016 SP1 or later and compatibility level 130 or higher.
- If you plan a multi-company migration, design batches early so that timing and validation can be repeated consistently across dry runs and the final cutover.
- Consider reducing the amount of data so that it's less than 30 GB per migration run. If your tenant's database storage exceeds its licensed capacity, administrative actions that create additional environments are restricted. The capacity includes the base allowance, license allowances, and purchased capacity. Learn more in [Managing capacity](tenant-admin-center-capacity.md).

## Plan your environment strategy

When you set up cloud migration, the migration process replicates data into the target online environment. Don't set up cloud migration for a production environment that's already in use for business, because replication can overwrite data in the target environment.

Instead, use a sandbox environment for dry runs and validation. This approach helps you identify issues and measure timing without risking production data. Only use a production environment as the target for the final cutover when you're ready to go live.

## Plan advanced migration approach

It's important to have a solid migration strategy in place to ensure a smooth transition. Most migrations can run from the on-premises production database with minimal downtime for end users. However, for especially large migrations, it might be better to run migration from a restored copy of the on-premises database on a dedicated SQL Server instance. This approach reduces the replication load on the on-premises production database.

The following procedure uses repeated full backups restored to SQL Server. For a separate Azure SQL Database approach, learn more in [Deploy source database to Azure SQL Database](migration-optimize-replication.md#deploy-source-database-to-azure-sql-database). Azure SQL Database doesn't support restoring native SQL Server backup files. Learn more in [Features comparison: Azure SQL Database and Azure SQL Managed Instance](/azure/azure-sql/database/features-comparison).

If you're using Business Central 14 reimplementation, turn off **Run upgrade after replication** before following this procedure. Otherwise, automatic upgrade can prevent further replication runs. Learn more in [Configure migration options](migrate-bc14-reimplementation.md#configure-migration-options).

Complete any on-premises data upgrade before enabling change tracking.

1. [Enable change tracking](/sql/relational-databases/track-changes/enable-and-disable-change-tracking-sql-server) on the on-premises production database for the expected number of days between the first backup for replication and the next time you'll back up and replicate. Cloud migration recommends a retention period of at least three days. You can change the retention period without disabling change tracking. Learn more in [ALTER DATABASE SET options](/sql/t-sql/statements/alter-database-transact-sql-set-options).
1. [Create a full backup](/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server) of the on-premises production database. Use full backups for this workflow.
1. Restore the full backup to a separate SQL Server instance that's used only for cloud migration.
1. Complete the usual preparation steps on the restored source database and address any issues that arise. Start the first [replication run](migrate-data-replication-run.md) and address any issues that arise.
1. Within the change tracking retention period set up on the on-premises production database in step 1, overwrite the backup database with a new full backup to replicate data that is new or modified since the backup created in step 2.

   Rather than overwriting the backup, the old backup database can also be deleted. If creating a new backup rather than overwriting an existing backup, ensure the new backup database has the same name as the previous one. If the database name changes, run **Cloud Migration Setup** in the cloud environment again to point to the new database. The tool attempts to use change tracking data, if available, to avoid replicating all data in the source database.
1. Repeat steps 2-5 as needed until you reach a state that is suitable for the final migration run.
1. Stop the usage of the on-premises environment ahead of the final backup of the on-premises production database. Run one final replication from the backup database to replicate the last data before running data upgrade.

   [!INCLUDE [bc-cloud-migrate-replicate-all-before-upgrade.md](../includes/bc-cloud-migrate-replicate-all-before-upgrade.md)]
1. Run [data upgrade](migration-data-upgrade.md) on the cloud environment.

   This step isn't required if your on-premises and online environments use the same major version of Business Central.

1. [Complete the migration](migration-finish.md) and go live on the cloud environment.

> [!NOTE]
> Long retention periods for change tracking data might cause database resource starvation when high volumes of data are changed on the database, which may lead to reduced database performance and/or loss of the change tracking data. Pick a change tracking period that strikes a balance between migration strategy needs and available resources on the on-premises database.

> [!IMPORTANT]
> Keep each environment on the Business Central version it used when cloud migration was set up. Don't update the on-premises environment. [Reschedule updates](update-rollout-timeline.md) to the cloud environment to a date after cloud migration is completed.
>
> Avoid modifying the environment after the replication has been enabled. If you need to install or uninstall extensions or delete companies, disable the cloud migration, make the changes, then enable it again.

Keep in mind that the migration process can be complex, and issues might arise that require more troubleshooting. It's important to stay flexible and be prepared to adjust your migration strategy as needed to address any problems that arise.

## Create a governance plan

Create a migration runbook that documents the owners, dependencies, expected durations, decision gates, change freeze timing, and rollback options for each phase of the migration. Update the runbook after each dry run with newly discovered issues and their mitigations. A well-maintained runbook helps ensure that everyone involved understands their responsibilities and that the migration proceeds predictably.

### Runbook checklist

A comprehensive migration runbook should include:

| Section | Contents |
|---------|----------|
| **Roles and owners** | Name the migration lead, technical owner, business validation owner, and escalation contacts. |
| **Timeline and milestones** | Define dates for dry runs, go/no-go decisions, change freeze, cutover weekend, and go-live. |
| **Dependencies** | List external systems, ISV extensions, integrations, and any third parties that must be coordinated. |
| **Decision gates** | Define criteria for proceeding at each phase, such as "Data replication completes with no failed tables" or "Business users sign off on sandbox validation". |
| **Change freeze** | Specify when to stop on-premises development and data changes before the final cutover. |
| **Rollback plan** | Document how to revert to the on-premises system if critical issues arise during cutover. Include data restore procedures and communication templates. |
| **Communication plan** | Outline how and when to notify users about downtime, training, and the switch to the new system. |

### Dry run cadence

Plan at least two dry runs before the production cutover:

1. **First dry run**: Identify technical issues, measure timing, and validate the migration process in a sandbox environment.
1. **Second dry run**: Confirm fixes, refine timing estimates, and conduct business validation with key users.
1. **Final cutover**: Execute the production migration using the validated runbook.

## Schedule migration and updates

- Plan the switch to use [!INCLUDE [prod_short](../includes/prod_short.md)] online for production carefully to not start until migration is complete  

  [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]  

- Schedule the migration to not conflict with an update of [!INCLUDE [prod_short](../includes/prod_short.md)] online

  [!INCLUDE [bc-cloud-migrate-upgrade](../includes/bc-cloud-migrate-upgrade.md)]

## Next steps

- [Check prerequisites](cloud-migration-prerequisites.md)  
- [Optimizing cloud migration performance](migration-optimize-replication.md)  
- [Run cloud migration setup](migration-setup.md)
