---
title: Configure Dynamics GP company migration
description: Learn how to specify the Dynamics GP company data for migrating to Business Central on-premises.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.collection: 
ms.date: 01/31/2024
ms.custom: bap-template
---

# Configure Dynamics GP company migration

The Business Central cloud migration tools for Dynamics GP include the **GP Company Migration Configuration** page. This page allows you to make global settings for all companies selected to migrate with the ability to update at a company level if necessary. For more information about the data that can be migrated, see [Dynamics GP data migrated to Business Central online](migrate-dynamics-gp.md).

You complete this task after you set up cloud migration and before you replicate data.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

## Prerequisites

[Run cloud migration setup](migration-setup-gp.md)

## Get started

The **GP Company Migration Configuration** page opens automatically when you complete the **Cloud Migration Setup** assisted setup. You can also open the page searching for and opening the **Cloud Migration Management** page and then selecting the **GP Company Migration Configuration** action.

![Shows GP company migration configuration page](../developer/media/gp-company-migration-configuration.svg)

Once you have the **GP Company Migration Configuration** open, you can start to configure what data you to migrate by using the different sections of the page. The page enables you to configure the migration globally for all companies that you chose to migrate (using the upper sections of the page) or on a per-company basis using the **Per-company** section.

You don't have to make any changes on this page. However, we do recommend that you review the default settings. If you're satisfied with the default settings, you can close the page and continue the migration process.

## Configure migration globally

The steps in this section configure the data migration globally for all companies that you chose to migrate cloud migration setup. If you're migrating more than one company, you can specify the [configuration on a per-company basis](#configure-data-migration-per-company).

1. Set the dimensions.

   Select the **Set All Dimensions** action to assign dimensions for all companies. Then select the two segments from Dynamics GP that want to use as the global dimensions in Business Central. The remaining segments are automatically set up as shortcut dimensions. [Learn more about dimensions in Business Central](/dynamics365/business-central/finance-dimensions).

1. Choose the modules to migrate.

   Use the **Modules** section to choose the specific modules you want to migrate data from to Business Central. By default, all modules are selected for migration. If you don't want to migrate data for a module, turn off its switch. For example, if you don't want to migrate data for payables, turn off the **Payables** switch. In this case, the **Open Sales Orders** switch is automatically turned off because the open sales orders module relies on vendors, which are part of the payables module.

   If you-re migrating the Remember to set the 
1. Choose whether to migrate master data only for modules.

   Use the **Master data only** section to specify those modules for which you only want to migrate master data. For example, if you only want to migrate bank information and bank transactions, turn on the **Bank** switch.

   By default, both master data and transactional data for the selected modules are migrated. Master data represents the core information that about entities that changes infrequently, for example, like information about a bank. Transactional data captures specific activities or events for an entity, like bank deposits and withdrawals.

1. Choose whether to disable auto posting for migrated transactions.

   By default, the migration process automatically posts migrated transactions in batches based on the type. Use the **Disable auto posting** section to specify transactions that you don't want posted automatically. To disable auto posting, turn off the switch for batch. 

   Disabling auto posting is useful if you wanted to modify transactions before they're posted. For example, if you wanted to adjust some general ledger accounts before they're posted, turn off the **Account batches** switch.

1. Choose the inactive record or discontinued items that you want to migrate.

   Use the **Inactive records** section to inactive records or discontinued items that you want to migrate. By default, no inactive records or discontinued items are migrated. Sp, for example, if you wanted to migrate inactive customers, turn on the **Inactive Customers** switch.

1. Choose the classes that you want to migrate as posting groups.

   Use the **Classes** section to specify the classes that you want migrated to Business Central. For each class you migrate, a posting group that has the same name as the class is created in Business Central. For example, if you want to migrate the Customer class in Dynamics GP to a posting group called **Customer** in Business Central, turn on the **Customer class** switch.

1. Choose the historical transactions that you want to migrate.

   Use the **historical snapshots** section to specify historical transactions that you want migrated to Business Central. The selected transactions are migrated to extension tables in Business Central. User in the Business Central client can then view the data from specific GP list pages.

   To migrate historical transactions, do the following steps.
   1. Turn on the **Enable/Disable All Transactions** switch.
   1. Turn on the switch for each transaction type you want to migrate, like **GL Transactions** and AR **Transactions**.
   1. Go to the **Per company** section and set **Oldest Snapshot Year** field the earliest year in GP that you want migrated.

## Configure migration per company

Use the **Per company** section to set the data migration settings separately for each company when you're migrating more than one company. You can specify the same settings as you can globally, plus a couple more. By default, each company uses the global settings.



Account summary transactions are generated and posted for open and history years that were set up in Dynamics GP. The summary amounts are created based on the fiscal periods set up in Dynamics GP. In the GP Company Migration Configuration page, you can select the oldest historical year you want migrated to Business Central. For example, if 2019, 2020, and 2021 are historical years in Dynamics GP, you could select that the oldest historical year you want migrated is 2020. Summary transactions for 2019 wouldn't be migrated to Business Central.

## Next steps

[Run data replication](migrate-data-replication-run.md) 
