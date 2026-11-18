---
title: Business Central 14 Reimplementation for Cloud Migration
description: Learn how to migrate selected Business Central 14 data to Business Central online, configure migration options, and extend the reimplementation tool.
author: jswymer
ms.topic: concept-article
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Business Central 14 Reimplementation tool for cloud migration

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

The Business Central 14 Reimplementation tool is a cloud migration option for customers on Business Central version 14 who want to start fresh in the cloud. Instead of migrating all data and customizations, the tool migrates selected business data. It's designed for reimplementation projects where you want a clean start without legacy customizations. You can also migrate selected historical data.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-d365.md)] 

## When to use this tool

Choose the Business Central 14 Reimplementation tool when:

- You're on Business Central version 14 and want to move to the cloud
- You want to leave behind obsolete customizations and start fresh
- You need only the supported subset of data, rather than a full copy of your historical records
- You're doing a reimplementation rather than a lift-and-shift migration

Choose the standard full data migration tool (**Dynamics 365 Business Central current version** or **Dynamics 365 Business Central earlier versions**) when:

- You need a full migration of supported historical data and transactions
- You want to retain supported customization data in compatible online extensions
- You're on a supported version other than Business Central 14

> [!NOTE]
> The Business Central 14 reimplementation tool only supports Business Central version 14. For other versions, use the standard cloud migration. Full migration from Business Central 14 requires an on-premises upgrade first. Neither migration path automatically converts legacy C/AL customizations to online extensions. Learn more in [Supported migration paths](migrate-data.md#supported-migration-paths).

## What data is migrated

The reimplementation approach prioritizes a clean system by migrating selected business data needed to operate going forward. The data migrated depends on the modules and options you enable.

> [!NOTE]
> Data is moved by *migrators*, which are modular components that transfer defined sets of business data from the source environment to Business Central. The tool currently includes more than 40 migrators.

The following table shows the types of data that are migrated and examples of each type.

| Data category | Examples |
|---------------|----------|
| Master data | Customers, vendors, items, G/L accounts, dimensions |
| Transactional data | G/L entries and open customer, vendor, and item ledger entries staged as journal lines |
| Opening balances | G/L balances, customer balances, vendor balances, item inventory |
| Setup data | Posting setup, number series, currencies |
| Historical data | Archived posted sales invoices and old G/L, customer, vendor, and item ledger entries, depending on migration settings |

The built-in migrators don't migrate open sales orders or purchase orders. The historical migration phase stores records in separate archive tables, not as standard posted documents or live ledger entries.

Legacy C/AL customizations and their extension data aren't migrated by the built-in migrators. The tool supports a defined subset of historical posted entries, not all historical data. To migrate specific customizations and extension data, learn more in [Extend the tool](#extend-the-tool).

## How to set up

The Business Central 14 reimplementation tool uses the same cloud migration setup guide as other Business Central migrations. Select the reimplementation product, then configure its migration options before running replication.

1. Complete the preparation steps in [Plan and prepare for cloud migration](cloud-migration-plan-prepare.md) and [Cloud migration prerequisites](cloud-migration-prerequisites.md).
1. Follow the setup process in [Run cloud migration setup](migration-setup.md). In the **Product** field, select **Dynamics 365 Business Central Re-implementation (v.14)**.

After setup, run and manage the migration from the **Cloud Migration Management** page.

## Configure migration options

Before running replication, select **Configure BC14 Re-implementation** on the **Cloud Migration Management** page. Review the following settings.

| Setting | What it controls |
|---------|------------------|
| **General Ledger**, **Receivables**, **Payables**, **Inventory** | Select the modules to migrate. |
| **Skip Posting Journal Batches** | Turn on to leave migrated transactions in journal batches for review and manual posting instead of posting them automatically. |
| **Stop On First Transformation Error** | Choose whether to stop at the first transformation error or continue and collect errors. |
| **Migrate Historical Records** | Choose whether to run the historical migration phase for the supported archive records. |
| **Historical cutoff date** | G/L entries on or after this date are staged for posting to the live ledger. Older G/L entries go to the read-only archive when historical migration is enabled. The date also limits which open customer and vendor entries are recreated in the live subledgers. Leave it blank to stage all eligible G/L entries and open customer and vendor entries for posting to the live ledgers. |

If you set a cutoff date, keep **Migrate Historical Records** on to retain older ledger records in the archives.

Set the defaults first, then use the **Per Company** section to override settings for individual companies. Changing a default setting also changes that setting for existing companies.

Select **Upgrade settings** to review **Run upgrade after replication**. This option is on by default and starts the company-level upgrade automatically after successful replication. Turn it off before replication if you need to run further replications or review the replicated data before starting the upgrade.

> [!IMPORTANT]
> After data upgrade starts, you can't run further replication for the affected companies. Complete all required replication runs before starting the upgrade.

## Next steps

After setup, complete the remaining migration steps:

1. [Run data replication](migrate-data-replication-run.md): Copy the selected data from on-premises to online.
1. [Upgrade companies migrated from Business Central 14](migration-data-upgrade.md#upgrade-companies-migrated-from-business-central-14): Transform the replicated data through the company-level upgrade. If automatic upgrade is off, select **Run data upgrade** on the **Cloud Migration Management** page. Use **Companies Upgrade status** to monitor progress.
1. [Complete cloud migration](migration-finish.md): Review the migrated data and post any journal batches left for manual posting. Then finalize setup, configure user access, and go live.

## Extend the tool

The Business Central 14 reimplementation tool is open source and extensible. Partners and developers can:

- Add or remove tables from the migration scope
- Add migration modules for ISV solutions
- Customize data transformation logic

Learn more in [Extending the BC14 Reimplementation Tool](https://github.com/microsoft/BCTech/blob/master/samples/CloudMigration/BC14ReimplementationToolExtendingSample/Extending.md).

## Related information

[Migrate on-premises data to Business Central online](migrate-data.md)  
[Business Central on-premises to online migration: end-to-end overview](migrate-business-central-on-premises.md)\
[Run cloud migration setup](migration-setup.md)  
[Run data replication](migrate-data-replication-run.md)\
[Cloud migration prerequisites](cloud-migration-prerequisites.md)
