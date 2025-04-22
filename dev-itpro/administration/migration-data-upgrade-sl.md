---
title: Upgrade data for Dynamics SL cloud migration
description: Discover the process for running the data upgrade as part of Dynamics SL cloud migration. 
author: lcontreras
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual 
ms.date: 12/13/2024
ms.custom: bap-template 
---
# Upgrade data for Dynamics SL cloud migration

This article explains the process for running the data upgrade as part of cloud migration. Data upgrade transforms Dynamics SL tables into Business Central tables.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-SL.md)]

## Prerequisites

You ran data replication on the company or companies that you're migrating to the online environment. Learn more in [Run data replication](migrate-data-replication-run.md).

[!INCLUDE [cloud-migration-telemetry](../includes/bc-cloud-migrate-replicate-all-before-upgrade.md)]

## Prepare

When you start the data upgrade, all client connections are terminated, and you can't reconnect until the upgrade completes. Hotfixes and scheduled tasks can't run during this time. This behavior ensures the data upgrade is the only process running, preventing potential database locks, and errors.

Ask active Business Central online users to finish their tasks and sign out.

## Run data upgrade

1. Search for and open the **Cloud Migration Management** page.
1. Select **Run data upgrade** > **Yes** > **OK** to schedule the data upgrade.

   The data upgrade process starts. To check whether the migration succeeded or failed. To check if the migration succeeded or failed, go to the **Cloud Migration Management** page. If the upgrade fails, go to the **Migration Errors** FactBox to view the errors.

> [!TIP]
> [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]. You can also track the status of the data upgrade on the **Operations** page in the admin center. Learn more in [Operations log](tenant-admin-center-environments.md#opslog).

## Next steps

[Complete cloud migration](migration-finish-SL.md)  

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-SL-overview.md)  
[Compare Work in Dynamics SL to Business Central](migrate-dynamics-SL-videos.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  
