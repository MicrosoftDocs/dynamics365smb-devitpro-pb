---
title: Run and Manage Cloud Migration Data Replication
description: Learn how to run and monitor cloud migration data replication from an on-premises database to Business Central online and resolve replication errors.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---

# Run and manage data replication

This article explains how to run data replication to move data from an on-premises database to your online environment. Learn more in [Data replication overview](migration-data-replication.md).

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process.md)]

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-sl.md)]

## Prerequisites

- You set up cloud migration. Learn more in one of the following articles:

  - [Run data migration setup for Business Central on-premises](migration-setup.md) 
  - [Run data migration setup for Dynamics GP](migration-setup-gp.md)
  - [Run data migration setup for Dynamics SL](migration-setup-sl.md)
- You have the **SUPER** permission set in the online environment.

## Prepare for data replication

Before running data replication, we recommend doing a test, or *diagnostics*, run. A diagnostic run doesn't migrate data from the on-premises database to the online tenant. It helps identify and fix issues before the actual replication, reducing the risk of failure.

To do a diagnostics run, follow these steps:

1. Open the **Cloud Migration Management** page.
1. Select **Create diagnostic run**, if the action is available for your migration source.

1. Monitor the progress on the **Cloud Migration Management** page by checking the **Migration Log** list and status fields.

## Run data replication

Follow these steps to replicate data to the online tenant.

<!--This task runs the cloud migration that you set up previously, copying data from your on-premises database to your online environment.-->

1. Search for and open the **Cloud Migration Management** page.
1. On the **Cloud Migration Management** page, select **Run data replication** > **Yes**. In the legacy interface, select **Run Migration Now**.

   This step starts replicating data to the online tenant.
1. If the data replication starts, you get a message that the cloud migration was successfully started. Select **OK** to continue.
1. Monitor the progress on the **Cloud Migration Management** page by following entries in the **Migration Log** list and changes in the status fields at the top of the page.

   > [!TIP]
   > [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]

## Troubleshoot and fix problems

If errors occur during data replication, fix them then rerun the data replication. Learn more in [Cloud migration troubleshooting documentation for Business Central](/troubleshoot/dynamics-365/business-central/welcome-business-central).

When you're ready to run the data replication again, select **Run data replication**. Generally, only data changed since the last replication is replicated. Learn more in [Rerunning data replication](migration-data-replication.md#rerunning-data-replication).

## Pause or abandon cloud migration

You can't use **Pause migration** or **Abandon migration** to stop an in-progress replication. Wait for all in-progress migrations to finish before using either action. Data that was migrated remains in the online database.

Select **Pause migration** if you intend to continue migration later, or **Abandon migration** if you don't. Enter any additional details, select **Finish**, and confirm **Yes**. Both actions disable cloud migration. To migrate again, run cloud migration setup again.

## Next steps

For Business Central on-premises migration:

- [Run data upgrade for Business Central on-premises](migration-data-upgrade.md)
- [Complete Business Central on-premises cloud migration](migration-finish.md)

For Dynamics GP migration:

- [Run data upgrade for Dynamics GP](migration-data-upgrade-gp.md)
- [Validate Dynamics GP data migration](migrate-gp-validation.md)
- [Complete Dynamics GP cloud migration](migration-finish-gp.md)

For Dynamics SL migration:

- [Run data upgrade for Dynamics SL](migration-data-upgrade-sl.md)
- [Complete Dynamics SL cloud migration](migration-finish-sl.md)

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  