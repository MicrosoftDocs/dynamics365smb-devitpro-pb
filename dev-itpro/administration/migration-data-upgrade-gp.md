---
title: Upgrade Dynamics GP Data During Cloud Migration
description: Learn how Dynamics GP data is transformed into Business Central data, control automatic migration, monitor company progress, and handle upgrade failures.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: upgrade-and-migration-article
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---
# Upgrade data for Dynamics GP cloud migration

This article explains the process for running the data upgrade as part of cloud migration. Data upgrade transforms Dynamics GP tables into Business Central tables.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

## Prerequisites

You ran data replication on the company or companies that you're migrating to the online environment. Learn more in [Run and manage data replication](migrate-data-replication-run.md).

You have the **SUPER** permission set. Complete company setup and resolve replication errors before starting data upgrade.

## Prepare for data transformation

Dynamics GP migration transforms data for individual companies in background tasks or sessions. It doesn't use the environment-wide upgrade process that disconnects all users. Keep users from entering data in the companies being migrated until migration is complete.

On **GP Migration Settings**, **Run migration after replication** is on by default. Transformation starts automatically after successful replication. Turn this option off before replication if you want to start the upgrade manually. The manual upgrade action is hidden while this option is on.

## Run data upgrade

1. Search for and open the **Cloud Migration Management** page.
1. Select the latest successful replication run, then select **Run Data Upgrade Now**.

The data upgrade process starts in the background. Use **Refresh Status** to update the page. In the **GP Migration Overview** FactBox, select **Migration Errors**, **Failed Companies**, or **Failed Batches** to investigate problems.

> [!NOTE]
> Dynamics GP uses the previous **Cloud Migration Management** interface. If **Run Data Upgrade Now** isn't visible after you turn off automatic migration, reopen the page.

> [!TIP]
> [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]

## Recover from upgrade failures

Investigate and fix the reported errors before continuing. A failed Dynamics GP company upgrade can't be restarted by selecting **Run Data Upgrade Now** again. The migration requires you to delete the failed target companies and migrate them again. Don't use **Data Migration Overview** to restart this cloud migration.

> [!WARNING]
> Deleting a company removes its Business Central data. Confirm that the failed target company contains no data you need to retain before deleting it.

## Next steps

After data upgrade completes, verify the migrated data by running validation tests. Learn more in [Validate Dynamics GP data migration](migrate-gp-validation.md).

Then proceed to [Complete cloud migration](migration-finish-gp.md).  

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[Compare work processes in Dynamics GP to Business Central](migrate-dynamics-gp-videos.md)\
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  
