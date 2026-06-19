---
title: Migrate Dynamics NAV to Business Central online
description: Learn how to migrate from Dynamics NAV on-premises to Business Central online, including supported upgrade paths and key considerations.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: upgrade-and-migration-article
ms.collection: get-started
ms.date: 05/23/2026
ms.custom: bap-template
---

# Migrate Dynamics NAV to Business Central online

You can migrate to [!INCLUDE[prod_short](../includes/prod_short.md)] online from supported versions of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] on-premises. Any data from tables with code customizations can't be carried forward unless those customizations are converted to AL extensions.

There are two migration paths:

- **Full migration** - Migrate all data and customizations. Requires converting C/AL customizations to AL extensions and upgrading to the latest version.
- **Reimplementation** - Migrate only essential business data (master data, balances, subset of posted historical entries, setup). Doesn't require extension conversion or upgrading beyond version 14. Learn more at [Business Central 14 reimplementation tool](migrate-bc14-reimplementation.md).

Both paths require upgrading from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to [!INCLUDE[prod_short](../includes/prod_short.md)] version 14 as the first step. Learn more at [Upgrading to Business Central on-premises](../upgrade/upgrading-to-business-central-on-premises.md).

## Supported upgrade paths from NAV

Because [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] versions before version 14 can't migrate directly to the cloud, you must first upgrade to [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises. The following table summarizes the supported standard upgrade routes.

|Starting version|Upgrade route|
|---|---|
|[!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] 2015 through 2018|<ol><li>[!INCLUDE[prod_short](../includes/prod_short.md)] version 14 on-premises</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] on-premises (version 25 or later).</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] online</li></ol>|
|[!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] 2013 and 2013 R2|<ol><li>[!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] 2018</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] on-premises version 14</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] on-premises (version 25 or later).</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] online</li></ol>|
|[!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] 2009 SP1 and 2009 R2|<ol><li>[!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] 2013 or 2015</li><li>NAV 2018</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] on-premises version 14</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] on-premises (version 25 or later).</li><li>[!INCLUDE[prod_short](../includes/prod_short.md)] online</li></ol>|

> [!NOTE]
> **Alternative for Business Central version 14:** After you reach [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises version 14, you can choose the [Business Central 14 reimplementation tool](migrate-bc14-reimplementation.md) instead of the standard cloud migration path. This option migrates essential data only (for example, master data, opening balances, and setup).

## Migration roadmap

The end-to-end migration from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to [!INCLUDE[prod_short](../includes/prod_short.md)] online follows six high-level phases:

1. **Preparation for cloud migration** — Assess your current state, plan scope, validate prerequisites, clean data, and decide on company batches. Learn more in [Plan and prepare for cloud migration](cloud-migration-plan-prepare.md).
1. **Business Central upgrade** — Upgrade [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to a supported [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises version (version 14 or later). You must convert C/AL customizations to AL extensions unless you choose the Business Central 14 reimplementation path. Learn more in [Upgrading to Business Central on-premises](../upgrade/upgrading-to-business-central-on-premises.md) and [Customization migration guide](migrate-nav-customization-playbook.md).

   After upgrading to Business Central on-premises, you follow the standard cloud migration workflow, as listed below.
1. **Cloud migration setup** — Configure the connection between the on-premises database and the online tenant, install the Integration Runtime, select companies, and set a replication schedule. Learn more in [Set up cloud migration](migration-setup-overview.md).
1. **Data replication** — Run initial and delta replications through Azure Data Factory, validate results, and fix issues. Learn more in [Replicate data](migration-data-replication.md).
1. **Data upgrade and completion** — Run the data upgrade as the final step, then complete the cloud migration to make the online environment the primary system. Learn more in [Upgrade data](migration-data-upgrade.md) and [Complete cloud migration](migration-finish.md).
1. **Post-migration follow-up** — Enable users, reconnect integrations, monitor the environment, and optimize performance.

For a detailed description of each phase, including how cloud migration works (Azure Data Factory, Integration Runtime, pipelines, and what data is migrated), see [Business Central on-premises to online migration: End-to-end overview](migrate-business-central-on-premises.md).

## Key considerations for NAV migrations

- **Business Central online tenant and licenses**  
  
  Before you begin, make sure you have a [!INCLUDE[prod_short](../includes/prod_short.md)] online tenant and the appropriate licenses for all users who access the cloud environment. [!INCLUDE[prod_short](../includes/prod_short.md)] Essentials and Premium are licensed per user. Internal users with select Microsoft 365 plans can get read-only access to [!INCLUDE[prod_short](../includes/prod_short.md)] data from within Microsoft Teams at no additional cost, provided the organization has at least one [!INCLUDE[prod_short](../includes/prod_short.md)] license. Learn more in [Licensing in Dynamics 365 Business Central](../deployment/licensing.md).

- **Customizations must be extensions**  
  
  Before you can migrate to [!INCLUDE[prod_short](../includes/prod_short.md)] online, all C/AL code customizations must be converted to AL extensions. Data from tables with code customizations can't be carried forward from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] unless the customizations are handled by extensions installed on both on-premises and online. Learn more in [Customization migration guide](migrate-nav-customization-playbook.md).

  > [!TIP]
  > If converting customizations to extensions isn't practical for your situation, consider the [Business Central 14 reimplementation tool](migrate-bc14-reimplementation.md) as an alternative. This tool migrates only essential business data without requiring extension conversion, but it doesn't carry forward historical transactions or legacy customizations.

- **Data preparation**  
  
  Before you start the upgrade and migration process, use the opportunity to reduce technical debt in the database. Archive obsolete history, shrink oversized transaction and log tables where appropriate, validate that schema changes are intentional, and confirm the SQL Server version and compatibility level (130 or higher). If you plan a multi-company migration, design batches early so that timing and validation can be repeated consistently.

- **Localizations**  
  
  Country/region-specific functionality in [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] is delivered through localization apps in [!INCLUDE[prod_short](../includes/prod_short.md)] online. Verify that the required localization apps are available for your target country/region, and confirm that any locally customized tax, regulatory, or reporting logic has been converted to AL extensions that are compatible with the online localization. Localization migration is typically managed by the implementation partner.

- **Dry runs before cutover**  
  
  Perform at least one dry run of the full migration in a sandbox environment before the production cutover. This approach allows you to identify issues, measure timing, and validate results with business users before committing to the final migration. Learn more in [Plan and prepare for cloud migration](cloud-migration-plan-prepare.md).

## Alternative: Business Central 14 reimplementation

If you already upgraded to Business Central version 14 on-premises and want a fresh start in the cloud, consider using the Business Central 14 reimplementation tool. This tool migrates only essential business data (master data, opening balances, and required setup) without carrying forward obsolete customizations.

The reimplementation approach is useful when you want to:

- Start fresh with standardized business processes
- Take advantage of cloud AI and automation features
- Avoid migrating legacy customizations and historical data

Learn more at [Business Central 14 reimplementation tool for cloud migration](migrate-bc14-reimplementation.md).

## Next steps

- [Plan and prepare for cloud migration](cloud-migration-plan-prepare.md)
- [Upgrading to Business Central on-premises (version 14)](../upgrade/upgrading-to-business-central-on-premises.md)
- [Customization migration guide: Dynamics NAV to Business Central online](migrate-nav-customization-playbook.md)
- [Migrate on-premises data to Business Central online](migrate-data.md)
