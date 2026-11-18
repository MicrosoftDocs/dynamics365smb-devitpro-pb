---
title: Run a Cloud Migration Data Upgrade
description: Learn how to prepare for and run a data upgrade during Business Central cloud migration, monitor progress, and handle upgrade errors.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: upgrade-and-migration-article
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---
# Run data upgrade during cloud migration

This article explains the process for running the data upgrade as part of cloud migration. Data upgrade is typically required when migrating from a Business Central version that is earlier than the version used on the destination online environment. Data upgrade runs the logic that's required to upgrade the migrated data. No data upgrade is needed when the source and destination use the same major version.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process.md)]

## Prerequisites

Data replication was run on the company or companies that you're migrating to the online environment. Learn more in [Run data replication](migrate-data-replication-run.md).

You have the **SUPER** permission set in the online environment.

[!INCLUDE [cloud-migration-telemetry](../includes/bc-cloud-migrate-replicate-all-before-upgrade.md)]

## Prepare for data upgrade

When the environment-wide data upgrade starts, all client connections are terminated. You can't reconnect until the upgrade process completes. Also, hotfixes can't be applied and scheduled tasks can't be run. This behavior means data upgrade is the only process running on the environment, which helps prevent potential database locks and errors. The Business Central 14 migration uses a different, company-level upgrade workflow, described later in this article.

Inform any active Business Central online users to finish what they're doing and sign out.

### Avoid long running data upgrades

> **APPLIES TO:** Business Central on-premises only

When running the data upgrade during cloud migration, you can experience that it takes a long time to complete. You can speed up the data upgrade by temporarily skipping API upgrade. Learn more in [Skip API data upgrade](migration-skip-api-data-upgrade.md).

## Run data upgrade

The following procedure describes the environment-wide upgrade. For Business Central 14 migration, use the company-level workflow described in the next section instead.

1. Search for and open the **Cloud Migration Management** page.
1. Select **Run data upgrade** > **Yes** > **OK** to schedule the data upgrade.

   The upgrade starts as soon as possible according to the following flow:

    1. The tenant status changes to **Update** and any client connections are lost.
    1. You can track the data upgrade in the Business Central admin center from the **Environment Operations** page or admin center API.

       Learn more in [Log of administrative operations](tenant-admin-center-environments.md#opslog).
    1. When the data upgrade completes, the environment has one of the following statuses:

       - If the data upgrade is successful, the data upgrade status on the **Environment Operations** page switches to **Complete**. The environment state becomes active again, and you can reconnect via the client. If you open the **Cloud Migration Management** page, you notice that the **Status** field changed to **Upgrade completed successfully**.
       - If the data upgrade fails, the data upgrade status on the **Environment Operations** page switches to **Failed**. An automatic point-in-time restore is run to revert the tenant to the point before upgrade. The environment state becomes active again, and you can reconnect via the client. If you open the **Cloud Migration Management** page, you notice that the **Status** field changed to **Upgrade pending**.

> [!TIP]
> [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]
>
> You can also track the status of the data upgrade on the **Operations** page in the admin center. Learn more in [Operations log](tenant-admin-center-environments.md#opslog).

### Upgrade companies migrated from Business Central 14

The Business Central 14 migration schedules upgrades for individual companies in the background. Complete assisted company setup before upgrading a company. If one-step upgrade is enabled, the upgrade can start automatically after replication.

On the **Cloud Migration Management** page, use **Companies Upgrade status** to view per-company progress and **Upgrade Error Details** to view errors. After the upgrade starts, **Resume Business Central 14 Upgrade** replaces **Run data upgrade**. Use the resume action to continue pending work or retry failed companies after fixing the errors. This workflow doesn't use the environment-wide upgrade and restore process described earlier.

## Fix upgrade errors

On the **Environment Operations** page, select the **Failed** status for the data upgrade operation to open a pane that displays the full stack trace for the error.

You can then fix the errors and try to run the upgrade again. Data replication is blocked for selected, replicated companies whose upgrade status is **Started**, **Failed**, or **Completed**. Don't rerun replication for a company after its upgrade starts.


<!--
Alternatively, you can start the cloud migration in another environment, or you can restore the current environment from a backup from a point in time before the data upgrade. Or, delete all companies in the current environment and start the migration again.

-->

## Cancel data upgrade

If you need to cancel a running environment-wide data upgrade operation, you can do so from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. To cancel a running data upgrade, go to the **Operation Details** pane from the **Environment Details** or **Operations** page and select **Cancel update** next to the operation status.

Canceling a running data upgrade operation stops the process and restores the environment to its state immediately before the data upgrade started. Depending on the size of the environment database, this process might take more than an hour, during which the environment isn't accessible.

## Next steps

[Complete cloud migration](migration-finish.md)  


<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
