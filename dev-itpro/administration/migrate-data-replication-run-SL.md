---
title: Run and manage data replication for Dynamics SL cloud migration
description: This article explains how to run data replication to move data from Dynamics SL on-premises database to Business Central on line.
author: lcontreras
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 12/13/2024
ms.custom: bap-template 
---

# Run and manage data replication for Dynamics SL cloud migration

This article explains how to run data replication to move data from on-premises database to your online environment. To learn more about the mechanics behind data replication, go to [Data replication overview](migration-data-replication.md).

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-SL.md)]

## Prerequisites

- You set up cloud migration. Learn more in [Run cloud migration setup for Dynamics SL migration](migration-setup-sl.md).

## Run data replication

Follow these steps to replicate data to the online tenant.

<!--This task runs the cloud migration that you set up previously, copying data from your on-premises database to your online environment.-->

1. Search for and open the **Cloud Migration Management** page.
2. On the **Cloud Migration Management** page, select one of the following actions:

   - **Run data replication** > **Yes** if you're migrating from Dynamics SL on-premises.
   - This step starts replicating data to the online tenant.
3. If the data replication starts, you get a message that the cloud migration was successfully started. Select **OK** to continue.
4. Monitor the progress on the **Cloud Migration Management** page by following entries in the **Migration Log** list and changes in the status fields at the top of the page.

<!--
   - If data replication succeeds, the **Status** will change to **Completed** and the **Details** will change to **Replication completed successfully.**
   - If data replication fails, the **Status** will change to **Failed** and the **Details** will change to **Replication completed with failed tables.**-->
<!--## Track progress and migration status

The **Cloud Migration Management** page gives you access to details about the data replication.-->

   > [!TIP]
   > [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]

## Troubleshoot and fix problems

If errors occur during data replication, fix them then rerun the data replication. Learn more about some common errors at [Cloud migration troubleshooting documentation for Business Central](/troubleshoot/dynamics-365/business-central/welcome-business-central) in Microsoft troubleshooting documentation.

When you're ready to run the data replication again, select **Run data replication**. In general, only data changed since the last replication is replicated. To learn more, go to [Rerunning data replication](migration-data-replication.md#rerunning-data-replication).

## Stop data replication

You can stop the data replication before it finishes. When stopped, any data that has been migrated remains in the online database.  

To stop the currently running data replication, select the **Abandon migration** or **Pause migration**, enter reason, then select **Finish**. The process can't be stopped while in the middle of replicating a table, so the action waits until the current table has been replicated, then it stops the process.

## Next steps

- [Run data upgrade for Dynamics SL](migration-data-upgrade-SL.md)
- [Complete Dynamics SL cloud migration](migration-finish-SL.md)

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-SL-overview.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)
