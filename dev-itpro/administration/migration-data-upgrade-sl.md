---
title: Upgrade Dynamics SL Data During Cloud Migration
description: Learn how to transform replicated Dynamics SL data into Business Central data, monitor company-level background upgrades, and recover from failed migrations.
author: lcontreras
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: upgrade-and-migration-article
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---
# Upgrade data for Dynamics SL cloud migration

This article explains the process for running the data upgrade as part of cloud migration. Data upgrade transforms Dynamics SL tables into Business Central tables.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-sl.md)]

## Prerequisites

You ran data replication on the company or companies that you're migrating to the online environment. Learn more in [Run and manage data replication](migrate-data-replication-run.md).

You have the **SUPER** permission set. Complete company setup and resolve replication errors before starting data upgrade.

## Prepare for data transformation

Dynamics SL migration transforms data for individual companies in background tasks or sessions. It doesn't use the environment-wide upgrade process that disconnects all users. Ask users not to enter data in the companies being migrated until migration is complete.

Complete your final replication before starting data upgrade. After replication, Dynamics SL waits for you to start the upgrade manually.

## Run data upgrade

1. Search for and open the **Cloud Migration Management** page.
1. Select **Run data upgrade** to schedule the data upgrade.

The data upgrade process starts in the background. Use **Refresh status** on **Cloud Migration Management** to update progress. Select **SL Cloud Migration Errors** or **Failed Companies** to investigate failures. Use **Posting Errors** and **SL Cloud Migration Warnings** to investigate posting issues.

> [!TIP]
> [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]

## Recover from upgrade failures

Investigate and fix the reported errors before continuing. A failed Dynamics SL company upgrade can't be restarted by selecting **Run data upgrade** again. The migration requires you to delete the failed target companies and migrate them again. Don't use **Data Migration Overview** to restart this cloud migration.

> [!WARNING]
> Deleting a company removes its Business Central data. Confirm that the failed target company contains no data you need to retain before deleting it.

## Next steps

[Complete Dynamics SL cloud migration to Business Central online](migration-finish-sl.md)

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-sl-overview.md)\
[Compare work processes in Dynamics SL to Business Central](migrate-dynamics-sl-videos.md)\
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  
