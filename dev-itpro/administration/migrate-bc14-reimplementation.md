---
title: Business Central 14 Reimplementation tool for cloud migration
description: Learn about the Business Central 14 reimplementation tool that migrates only essential data from Business Central 14 on-premises to Business Central online.
author: jswymer
ms.topic: conceptual
ms.date: 05/23/2026
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: bap-template
---

# Business Central 14 Reimplementation tool for cloud migration

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

The Business Central 14 Reimplementation tool is a cloud migration option for customers on Business Central version 14 who want to start fresh in the cloud. Instead of migrating all data and customizations, the tool migrates only essential business data. It's designed for reimplementation projects where you want a clean start without legacy customizations or historical transactions.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-d365.md)] 

## When to use this tool

Choose the **Business Central 14 Reimplementation** tool when:

- You're on Business Central version 14 and want to move to the cloud
- You want to leave behind obsolete customizations and start fresh
- You don't need historical ledger entries in your new environment
- You're doing a reimplementation rather than a lift-and-shift migration

Choose the standard full data migration tool (**Dynamics 365 Business Central current version** or **Dynamics 365 Business Central earlier versions**) when:

- You need all historical data and transactions
- You want to preserve existing customizations
- You're on a version other than BC14

> [!NOTE]
> The Business Central 14 reimplementation tool only supports Business Central version 14. For other versions, use the standard cloud migration.

## What data is migrated

The reimplementation approach prioritizes a clean system by migrating only essential business data needed to operate going forward.

> [!NOTE]
> Data is moved by *migrators*, which are modular components that transfer defined sets of business data from the source environment to Business Central. The tool currently includes more than 40 migrators, with more expected over time.

The following table shows the types of data that are migrated and examples of each type.

| Data category | Examples |
|---------------|----------|
| Master data | Customers, vendors, items, G/L accounts, dimensions |
| Transactional data | Open sales orders, open purchase orders |
| Opening balances | G/L balances, customer balances, vendor balances, item inventory |
| Setup data | Company information, posting setup, number series |

Legacy C/AL customizations and their extension data aren't migrated. A defined subset of historical posted entries (for example, posted G/L entries and posted sales invoices) is included; arbitrary ledger history beyond that subset isn't migrated by default. If you want to migrate specific customizations and extension data, learn more in [Extend the tool](#extend-the-tool).

## How to set up

The Business Central 14 reimplementation tool uses the same cloud migration setup as other Business Central migrations. The only difference is the product you select.

1. Complete the preparation steps in [Plan and prepare for cloud migration](cloud-migration-plan-prepare.md) and [Cloud migration prerequisites](cloud-migration-prerequisites.md).
2. Follow the setup process in [Run cloud migration setup](migration-setup.md). On the **Product** page, select **Business Central 14 Reimplementation**.

After setup, run and manage the migration from the **Cloud Migration Management** page.

## Next steps

After setup, complete the remaining migration steps:

1. [Run data replication](migrate-data-replication-run.md) - Migrate data from on-premises to online.
2. [Run data upgrade](migration-data-upgrade.md) - Upgrade platform-related data if the status shows *Upgrade Pending*.
3. [Complete cloud migration](migration-finish.md) - Finalize setup, configure user access, and go live.

## Extend the tool

The Business Central 14 reimplementation tool is open source and extensible. Partners and developers can:

- Add or remove tables from the migration scope
- Add migration modules for ISV solutions
- Customize data transformation logic

Learn more about extending the Business Central 14 reimplementation tool in the [BCTech GitHub repository](https://github.com/microsoft/BCTech/blob/master/samples/CloudMigration/BC14ReimplementationToolExtendingSample/Extending.md).

## Related information

[Migrate on-premises data to Business Central online](migrate-data.md)  
[Business Central on-premises to online migration: End-to-end overview](migrate-business-central-on-premises.md)  
[Run cloud migration setup](migration-setup.md)  
[Run and manage data replication](migrate-data-replication-run.md)  
[Cloud migration prerequisites](cloud-migration-prerequisites.md)
