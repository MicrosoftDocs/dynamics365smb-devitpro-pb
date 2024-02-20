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

The Business Central cloud migration tools for Dynamics GP include the **GP Company Migration Configuration** page. This page allows you to make global settings for all companies selected to migrate with the ability to update at a company level if necessary.

You complete this task after you after you set up cloud migartion and before you replicate data.

 [!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

## Prerequisites

You set up cloud migration. For more information, go to [Run cloud migration setup](migration-setup-gp.md).

## Get started

The **GP Company Migration Configuration** page opens automatically when you complete the **Cloud Migration Setup** assisted setup. You can also open the page searching for and opening the **Cloud Migration Management** page and then selecting the **GP Company Migration Configuration** action.

![Shows GP company migration configuration page](../developer/media/gp-company-migration-configuration.svg)

## Configure the data for migration

Once you have the **GP Company Migration Configuration** open, you can start to configure what data you to migrate using the different sections of the page. The following steps walk you through each section. You don't have to make any changes on this page. If you're satisfied with the default setting, you can close the page and continue the migration process.

1. Choose the modules to migrate

   Use the **Modules** section to choose the specific modules you want to migrate data from to Business Central. By default, all modules are selected for migration. If you don't want to migrate data for a module, turn off its switch. For example, if you don't want to migrate data for payables, turn off the **Payables** switch. In this case, the **Open Sales Orders** switch is automatically turned off because the open sales orders module relies on vendors, which are part of the payables module.

1. Choose whether to migrate master data only for modules

   Use the **Master data only** section to specify those modules for which you only want to migrate master data. For example, if you only want to migrate bank information and bank transactions, turn on the **Bank** switch.

   By default, both master data and transactional data for the selected modules are migrated. Master data represents the core information that about entities that changes infrequently, for example, like information about a bank. Transactional data captures specific activities or events for an entity, like bank deposits and withdrawals.

1. Choose whether to disable auto posting for migrated transactions.

   By default, the migration process automatically posts migrated transactions in batches based on the type. Use the **Disable auto posting** section to specify transactions that you don't want posted automatically. To disable auto posting, turn off the switch for batch. 

   Disabling auto posting is useful if you wanted to modify transactions before they're posted. For example, if you wanted to adjust some general ledger accounts before they're posted, turn off the **Account batches** switch.

1. Choose the inactive record or discontinued items that you want to migrate

   Use the **Inactive records** section to inactive records or discontinued items that you want to migrate. By default, no inactive records or discontinued items are migrated. Sp, for example, if you wanted to migrate inactive customers, turn on the **Inactive Customers** switch.

1. Choose the classes that you want to migrate as posting groups

   Use the **Classes** section to specify the classes that you want migrated to Business Central. For each class you migrate, a posting group that has the same name as the class is created in Business Central. For example, if you want to migrate the Customer class in Dynamics GP to a posting group called **Customer** in Business Central, turn on the **Customer class** switch.

## Historical snapshot

## Per company

## Next steps

[Run data replication](migrate-data-replication-run.md) 
