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

<!--An assisted setup guide in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] can help you migrate data from Dynamics GP. You can migrate data from Dynamics GP 2015 and later versions of Dynamics GP. For more information, see [System requirements](faq-migrate-data.md#system-requirements).  

> [!IMPORTANT]
> Migrating from Dynamics GP using the **Cloud Migration Setup** assisted setup guide is currently only supported for the following markets: United States, Canada, United Kingdom, Australia.

The end-to-end process is described [here](migrate-data.md). In this article, we talk about background information and things to take into consideration.  

<!--As part of the Business Central 21.1 release--> The Business Central cloud migration tools for Dynamics GP include the **GP Company Migration Configuration** page. This page allows you to make global settings for all companies selected to migrate with the ability to update at a company level if necessary.

In addition to the GP Company Migration Configuration page you can select which modules you would like migrated from GP to Business Central. You will be able to select from the following modules to migrate: Accounts Payable, Accounts Receivable, Bank, Open Purchase Orders and Inventory.

*Note: General Ledger information will always be migrated.*  

## Prerequisites

You've set up cloud migration. For more information, go to [Run cloud migration setup](migration-setup.md).

## Get started with the GP Company Migration Configuration page

The **GP Company Migration Configuration** page opens automatically when you complete the **Cloud Migration Setup** assisted setup, but you can also open the page from the **Cloud Migration Management** page and selecting the **GP Company Migration Configuration** action.

Use this new page to select the data you want migrated from Dynamics GP to Business Central. The following sections the options on the page. 

## Modules

## Master data only

## Disable auto posting

## Classes

## Vendor 1099

## Historical snapshot

## Per company

## Next steps

[Run data replication](migrate-data-replication-run.md) 
