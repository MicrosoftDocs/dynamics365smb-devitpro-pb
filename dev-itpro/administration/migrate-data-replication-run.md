---
title: Run and manage data replication
description: This article explains how to run data replication to move data from Business Central on-premises database to on line.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 07/23/2023
ms.custom: bap-template 
ms-service: dynamics365-business-central
---

# Run and manage data replication

This article explains how to run data replication to move data from on-premises database to your online environment. To learn more about the mechanics behind data replication, go to [Data replication overview](migration-data-replication.md).

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process.md)]

## Prerequisites

You've set up cloud migration. For more information, go to [Set up data migration](migration-setup.md).

## Preparation

Before you run the actual data replication, we recommend you do a test, or *diagnostics*, run. With a diagnostics run, no data from the on-premises database is migrated to the online tenant. But it allows you to identify issues and fix them before you run the actual replication to help decrease the risk of a failed migration.

To do a diagnostics run, complete the following steps:

1. Search for and open the **Cloud Migration Management** page.

2. On the **Cloud Migration Management** page, select the **Create diagnostics run**, and following the instructions.

3. Monitor the progress on the **Cloud Migration Management** page by following entries in the **Migration Log** list and changes in the status fields at the top of the page.

## Run data replication

Follow these steps replicate data to the online tenant.

<!--This task runs the cloud migration that you set up previously, copying data from your on-premises database to your online environment.-->

1. Search for and open the **Cloud Migration Management** page.

2. On the **Cloud Migration Management** page, select the **Run data replication** > **Yes**.

   This step starts replicating data to the online tenant.
3. If the data replication starts, you get a message that the cloud migration was successfully started. Select **OK** to continue.
4. Monitor the progress on the **Cloud Migration Management** page by following entries in the **Migration Log** list and changes in the status fields at the top of the page.

<!--
   - If data replication succeeds, the **Status** will change to **Completed** and the **Details** will change to **Replication completed successfully.**
   - If data replication fails, the **Status** will change to **Failed** and the **Details** will change to **Replication completed with failed tables.**-->
<!--## Track progress and migration status

The **Cloud Migration Management** page gives you access to details about the data replication.-->

   > [!TIP]
   > [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]

## Fix errors

If errors occur, fix them then rerun the data replication. For information about some of the most common issues, go to [Data replication troubleshooting](migration-data-replication-troubleshooting.md).

When you're ready to run the data replication again, select **Run date replication**. In general, only data that has changed since the last replication is replicated. To learn more, go to [Rerunning data replication](migration-data-replication.md#rerunning-data-replication).


## Stop data replication

You can stop the data replication before it finishes. When stopped, any data that has been migrated remains in the online database.  

To stop the currently running data replication, select the **Abandon migration** or **Pause migration**, enter reason, then select **Finish**.  The process can't be stopped while in the middle of replicating a table, so the action waits until the current table has been replicated, then it stops the process.

## Next steps

- [Run data upgrade](migration-data-upgrade.md)
- [Complete cloud migration](migration-finish.md)  
