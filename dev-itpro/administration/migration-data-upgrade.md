---
title: Run data upgrade
description: This article explains the process for running the data upgrade as part of cloud migration. 
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer 
ms.topic: conceptual 
ms.date: 02/22/2023
ms.custom: bap-template 
---
# Upgrade data

This article explains the process for running the data upgrade as part of cloud migration. Data upgrade is typically required when migrating from Business Central version that is earlier than the version used on the destination online environment. Data upgrade runs the logic that's required upgrade the platform-related data in database.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process.md)]

## Prerequisites

Data replication has been run on the company or companies that you're migrating to the online environment. For more information, go to [Run data replication](migrate-data-replication-run.md).

## Prepare

Once you start the data upgrade on an environment, all client connections are terminated. You can't reconnect until the upgrade process has completed. Also, hotfixes can't be applied and scheduled tasks can't be run. This behavior means data upgrade is the only process running on the environment, which helps prevent potentials database locks and errors.

Inform any active Business Central online users to finish what they're doing and sign out.

## Run data upgrade

1. Search for and open the **Cloud Migration Management** page.
2. Select **Run data upgrade** > **Yes** > **OK** to schedule the data upgrade.

   The upgrade starts as soon as possible according to following flow: 

    1. The tenant status changes to **Update** and any client connections are lost.
    2. You can track the data upgrade in the Business Central admin center from the **Environment Operations** page or admin center API.  

       For more information, go to [Log of administrative operations](tenant-admin-center-environments.md#opslog).
    3. When the data upgrade completes, the environment has one of the following statuses:

       - If the data upgrade is successful, the data upgrade status on the **Environment Operations** page switches to **Complete**. The environment state become active again, and you can reconnect connect via the client. If you open the **Cloud Migration Management** page, you notice that **Status** field has changed to **Upgrade completed successfully**.
       - If the data upgrade fails, the data upgrade status on the **Environment Operations** page switches to **Failed**. An automatic point-in-time restore is run to revert the tenant to the point before upgrade. The environment state become active again, and you can reconnect connect via the client. If you open the **Cloud Migration Management** page, you notice that **Status** field has changed to **Upgrade pending**.

> [!TIP]
> [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]. You can also track the status of the data upgrade on the **Operations** page in the admin center (see [Operations log](tenant-admin-center-environments.md#opslog)).

## Fix upgrade errors

On the **Environment Operations** page, select the **Failed** status for the data upgrade operation to open a pane that displays the full stack trace for the error.

You can then fix the errors and try run the upgrade again. You can rerun the cloud migration setup or data replication to replicate more data. 

<!--
Alternatively, you can start the cloud migration in another environment, or you can restore the current environment from a backup from a point in time before the data upgrade. Or, delete all companies in the current environment and start the migration again.

-->

## Next steps

[Complete cloud migration](migration-finish.md)  


<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
