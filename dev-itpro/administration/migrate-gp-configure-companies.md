---
title: Configure Dynamics GP company migration
description: Learn how to specify the Dynamicss GP company data for migrating to Business Central on-premises
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

## Prerequisites

You've set up cloud migration. For more information, go to [Run cloud migration setup](migration-setup-gp.md).

## Get started

The **GP Company Migration Configuration** page opens automatically when you complete the **Cloud Migration Setup** assisted setup, but you can also open the page from the **Cloud Migration Management** page and selecting the **GP Company Migration Configuration** action.

![Shows GP company migration configuration page](../developer/media/gp-company-migration-configuration.svg)

Use this new page to select the data you want migrated from Dynamics GP to Business Central. The following sections the options on the page. 

## Modules

Use the **Modules** section to choose the specific modules you want to migrate data from to Business Central. All modules are selected for migration by default. For example, if you don't want to migrate data for payables, turn off the **Payables** switch. In this case, the **Open Sales Orders** switch is because oepn sales orders are dependant on vendors whihc are part of the payables module.

## Master data only

Master data represents the core information about entities, like general ledgers and inventory.    
 
## Disable auto posting

## Classes

## Vendor 1099

## Historical snapshot

## Per company

## Next steps

[Run data replication](migrate-data-replication-run.md) 
