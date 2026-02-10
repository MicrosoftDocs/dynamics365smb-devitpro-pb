---
title: Run and manage data replication
description: This article explains how to run data replication to move data from Business Central on-premises database to on line.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 12/20/2024
ms.custom: bap-template 
---

# Run and manage data replication

This article explains how to run data replication to move data from an on-premises database to your online environment. Learn more about data replication mechanics in [Data replication overview](migration-data-replication.md).

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process.md)]

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-sl.md)]

## Prerequisites

- You set up cloud migration. Learn more in one of the following articles:

  - [Run data migration setup for Business Central on-premises](migration-setup.md) 
  - [Run data migration setup for Dynamics GP](migration-setup-gp.md)
  - [Run data migration setup for Dynamics SL](migration-setup-sl.md)

## Preparation

Before running data replication, we recommend doing a test, or *diagnostics*, run. A diagnostic run doesn't migrate data from the on-premises database to the online tenant. It helps identify and fix issues before the actual replication, reducing the risk of failure.

To do a diagnostics run, follow these steps:

1. Open the **Cloud Migration Management** page.

2. Select **Create diagnostics run** and follow the instructions.

3. Monitor the progress on the **Cloud Migration Management** page by checking the **Migration Log** list and status fields.

## Run data replication

Follow these steps to replicate data to the online tenant.

<!--This task runs the cloud migration that you set up previously, copying data from your on-premises database to your online environment.-->

1. Search for and open the **Cloud Migration Management** page.
2. On the **Cloud Migration Management** page, select **Run data replication** (or **Run Migration Now**) > **Yes**. 

   This step starts replicating data to the online tenant.
1. If the data replication starts, you get a message that the cloud migration was successfully started. Select **OK** to continue.
1. Monitor the progress on the **Cloud Migration Management** page by following entries in the **Migration Log** list and changes in the status fields at the top of the page.

   > [!TIP]
   > [!INCLUDE [cloud-migration-telemetry](../developer/includes/cloud-migration-telemetry.md)]

## Migration Validation Feature Overview

The Migration Validation feature allows you to verify data migrated from GP to Business Central, either automatically or manually. This process ensures accuracy and improves efficiency by comparing source data in GP with migrated data in Business Central.

### Accessing Validation Results

On the Cloud Migration Management page, in the Company Status Fact Box area, a tile called Validation Errors will appear.

- If validation issues are detected, click the tile to view detailed results.
- The Migration Validation Results page provides a summary view across all migrated companies, including: 

  - Entities tested
  - Description of each validation test
  - Number of records that failed validation

You can drill down into failed records to see:

- Specific record details
- Company context
- Expected value versus migrated value

### Running Validation

You can choose to run validation:

- Automatically after migration by enabling Automatic Validation in the Configure GP Migration > GP Migration Settings window.
- Manually after migration completion:

  - Navigate to Validation Errors Tile > Company Migration Status > Run All Validation, or
  - From the Migration Management page: Actions > Validation Status > Run All Validation

## Managing Validation Tests

If you do not want a specific validation test to run, select Ignore on the Migration Validation Results page.

### Entities Included in Validation

- G/L Accounts
- Statistical Accounts
- Bank Accounts
- Customers
- Items
- Purchase Orders
- Vendors
- Vendor 1099 Information

## Troubleshoot and fix problems

If errors occur during data replication, fix them then rerun the data replication. Learn more about some common errors at [Cloud migration troubleshooting documentation for Business Central](/troubleshoot/dynamics-365/business-central/welcome-business-central) in Microsoft troubleshooting documentation.

When you're ready to run the data replication again, select **Run data replication**. Generally, only data changed since the last replication is replicated. To learn more, go to [Rerunning data replication](migration-data-replication.md#rerunning-data-replication).

## Stop data replication

You can stop the data replication before it finishes. When stopped, any data that was migrated remains in the online database.  

To stop the currently running data replication, select **Abandon migration** or **Pause migration**, enter a reason, then select **Finish**. The process can't be stopped while replicating a table, so the action waits until the current table is replicated before stopping.

## Next steps

For Business Central on-premises migration:

- [Run data upgrade for Business Central on-premises](migration-data-upgrade.md)
- [Complete  Business Central on-premises cloud migration](migration-finish.md)  

For Dynamics GP migration:

- [Run data upgrade for Dynamics GP](migration-data-upgrade-gp.md)
- [Complete Dynamics GP cloud migration](migration-finish-gp.md)

For Dynamics SL migration:

- [Run data upgrade for Dynamics SL](migration-data-upgrade-sl.md)
- [Complete Dynamics SL cloud migration](migration-finish-sl.md)

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  