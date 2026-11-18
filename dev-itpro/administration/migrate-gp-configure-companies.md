---
title: Dynamics GP Company Migration Configuration
description: Configure the Dynamics GP modules, company options, dimensions, historical data, and validation settings to migrate to Business Central online.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Configure Dynamics GP company migration

The Business Central cloud migration tools for Dynamics GP include the **GP Company Migration Configuration** page. This page allows you to make global settings for all companies selected to migrate with the ability to update at a company level if necessary. Learn more in [Dynamics GP data migrated to Business Central online](migrate-dynamics-gp.md).

Complete this task after you set up cloud migration and before you replicate data.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

## Prerequisites

Complete [Run cloud migration setup for Dynamics GP migration](migration-setup-gp.md).

## Open the configuration page

The **GP Company Migration Configuration** page opens automatically after you select **Finish** in the **Cloud Migration Setup** assisted setup. You can also open the page by searching for and opening the **Cloud Migration Management** page and then selecting the **Configure GP Migration** action.

:::image type="content" source="../developer/media/gp-company-migration-configuration.png" alt-text="Screenshot of the GP Company Migration Configuration page with global settings and per-company options.":::

Once you have the **GP Company Migration Configuration** page open, you can start to configure what data you want to migrate by using the different sections of the page. The page enables you to configure the migration globally for all companies that you chose to migrate using the upper sections of the page, or on a per-company basis using the **Per Company** section.

You don't necessarily have to make any changes on this page. However, if your Dynamics GP accounts have segments in addition to the main account segment, specify which segments to use as global dimensions. We recommend that you specify how many years back to migrate data. Otherwise, the tool migrates all years. Whether or not you make changes, we recommend that you review the default settings before you close the page and continue the migration process.

## Configure migration globally

The steps in this section configure the data migration globally for all companies that you chose to migrate during cloud migration setup. If you're migrating more than one company, you can specify the [configuration on a per-company basis](#configure-migration-per-company). Make global changes first, because changing a global setting updates that setting for companies whose migration isn't complete, including company-specific overrides.

1. Set the dimensions.

   To assign default dimensions for all companies you're migrating, select the **Set All Dimensions** action. Then select the two segments from Dynamics GP that you want to use as the global dimensions in Business Central. The remaining segments are automatically set up as shortcut dimensions. Learn more in [Work with dimensions](/dynamics365/business-central/finance-dimensions).

   When you're migrating several companies, each selected dimension is assigned only to companies that have a segment with that name in Dynamics GP. For companies that use different segment names, go to the **Per Company** section of the page and set the dimensions manually.

   You don't have to use the **Set All Dimensions** action. You can always specify the dimensions separately for each company in the **Per Company** section.

1. Choose the modules to migrate.

   Use the **Modules** section to choose the specific modules you want to migrate data from to Business Central. By default, all modules are selected for migration. If you don't want to migrate data for a module, turn off its switch. For example, if you don't want to migrate data for payables, turn off the **Payables** switch. In this case, the **Open Purchase Orders** switch is automatically turned off because the open purchase orders module relies on vendors, which are part of the payables module.

   Open purchase orders also require the Inventory and General Ledger modules. Turning off General Ledger turns off open purchase orders and class migration, and limits the remaining enabled modules to master data only.

   If you're migrating the General Ledger module, be sure to go to the **Per Company** section and specify the **Oldest GL Year** field. The year and all future years are migrated to Business Central. If you don't set the **Oldest GL Year** field, all years are migrated.
1. Choose whether to migrate master data only for modules.

   Use the **Master Data Only (no transactions)** section to specify those modules for which you only want to migrate master data. For example, if you only want to migrate bank account information, turn on the **Bank** switch. Bank transactions aren't migrated in this case.

   By default, both master data and transactional data for the selected modules are migrated. Master data represents core information about entities that changes infrequently, like information about a bank. Transactional data captures specific activities or events for an entity, like bank deposits and withdrawals.

1. Choose whether to disable auto posting for migrated transactions.

   By default, the migration process automatically posts migrated transactions in batches based on the type. Use the **Disable Auto Posting** section to specify transactions that you don't want posted automatically. To disable auto posting, turn on the switch for the batch.

   Disabling auto posting is useful if you wanted to modify transactions before they're posted. For example, if you wanted to adjust some general ledger accounts before they're posted, turn on the **Account Batches** switch.

1. Choose the inactive records or discontinued items that you want to migrate.

   Use the **Include These Records** section to specify the inactive records or discontinued items that you want to migrate. By default, no inactive records or discontinued items are migrated. So, for example, if you wanted to migrate inactive customers, turn on the **Inactive Customers** switch. **Temporary Vendors** and **Kit Items** are included by default. You can also use **Item Desc. 2 Source** to choose whether **Short Description** or **Generic Description** from Dynamics GP populates the item's **Description 2** field.

   Turning off **Temporary Vendors** doesn't exclude temporary vendors needed for selected open purchase orders. When you select payables master data only, temporary vendors with open payables transactions can also be retained.

1. Choose whether to generate recurring sales or purchasing lines.

   Use the **Recurring Lines** section to specify whether to generate recurring sales or purchasing lines using the default sales or purchasing accounts defined on the vendor, customer, class, or posting setup in GP. These options require the General Ledger module. Class-level accounts are used only when you also migrate the corresponding classes.

   Learn more in [Generating recurring purchase lines](migrate-dynamics-gp.md#generating-recurring-purchase-lines) and [Generating recurring sales lines](migrate-dynamics-gp.md#generating-recurring-sales-lines).

1. Choose the classes that you want to migrate as posting groups.

   Use the **Classes** section to specify the classes that you want migrated to Business Central. For each class you migrate, a posting group that has the same name as the class is created in Business Central. For example, to migrate Dynamics GP customer classes as customer posting groups, turn on the **Customer Classes** switch.

1. Choose the historical transactions that you want to migrate.

   Use the **Historical Snapshot** section to specify historical transactions that you want migrated to Business Central. The selected transactions are migrated to extension tables in Business Central. Users in the Business Central client can then view the data from specific Dynamics GP list pages.

   To migrate historical transactions, do the following steps.
   1. Turn on the **Enable/Disable All Transactions** switch.
   1. Turn off the switch for each transaction type you don't want to migrate, such as **GL Transactions** or **AR Transactions**. The all-transactions switch selects all types.
   1. Go to the **Per Company** section and set the **Oldest Snapshot year** field to the earliest year in GP that you want migrated.

1. Configure validation settings.

   To configure validation settings that apply across all companies, select the **Migration settings** action at the top of the page. The **GP Migration Settings** page opens. In the **Automatic Validation** group, review the **GP** option, which is on by default. When enabled, validation runs automatically as part of the data upgrade to check that data migrated correctly from Dynamics GP to Business Central.

   Learn more in [Validate Dynamics GP data migration](migrate-gp-validation.md).

## Configure migration per company

Use the **Per Company** section to set the data migration settings separately for each company when you're migrating more than one company. You can specify the same settings as you can globally, plus a couple more. By default, each company uses the global settings.

Use the following fields to specify how far back in time you want to migrate general ledger (GL) account summary data and historical snapshots:

- **Oldest GL Year**: Use this field to select from which year in the past you want to migrate GL account summary transactions. If the **Oldest GL Year** field is empty, all years are migrated. Account summary transactions are generated and posted for open and history years that are set up in Dynamics GP, unless you disable auto posting. The summary amounts are created based on the fiscal periods set up in Dynamics GP. For example, suppose 2019, 2020, 2021, and 2022 are historical years in Dynamics GP, but you only wanted to migrate data from 2021 and later. In this case, you set the **Oldest GL Year** to 2021. As a result, summary transactions for 2019 and 2020 aren't migrated to Business Central. Changing this field also sets **Oldest Snapshot year** to the same year, so review the snapshot year afterward.

- **Oldest Snapshot year**: Use this field to select from which year in the past you want to migrate history snapshots. If the **Oldest Snapshot year** field is empty, history snapshots from all years are migrated.

## Next steps

[Run and manage data replication](migrate-data-replication-run.md).
