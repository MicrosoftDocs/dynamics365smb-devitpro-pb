---
title: Manage Dynamics GP Cloud Migration in Business Central
description: Learn how to monitor Dynamics GP cloud migration, investigate errors, configure companies, and manage replication, data upgrade, and runtime service keys.
author: jswymer 
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: overview 
ms.collection: 
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Managing Dynamics GP cloud migration

Business Central offers two ways to manage cloud migration: the Business Central web client in the online environment or the cloud migration API. The web client provides a user-friendly interface for managing migration runs and services through the **Cloud Migration Management** page, while the API offers more advanced and automated capabilities. Both options allow users to set up, move data, track progress, and manage migration services.

The following section provides an overview of the **Cloud Migration Management** page. Learn more about the API in [Cloud Migration APIs overview (v1.0)](cloudmigrationapi/cloud-migration-api-overview.md).

## Cloud Migration Management page

The **Cloud Migration Management** page in the web client is a central hub for managing cloud data migration. Dynamics GP uses the previous version of this interface. If the new interface is open, select **Enable/Disable new UI** to switch back.

- The list shows migration runs, including their start and end times, status, and details.
- The replication statistics FactBox shows table counts. Select a tile to investigate tables with warnings or errors.
- The **GP Migration Overview** FactBox shows **Migration Errors**, **Failed Companies**, **Failed Batches**, and **Migration Warnings**. Select a tile to investigate.
- The **GP Detail Snapshot Migration Status** FactBox shows progress and errors for historical data migration.

   :::image type="content" source="../developer/media/gp-migration-management.png" alt-text="Screenshot of migration runs and replication and GP detail snapshot statistics on the Cloud Migration Management page.":::

<a name="available-actions"></a>
## Available migration actions

> [!NOTE]
> Most management actions require the **SUPER** permission set and completed cloud migration setup. Available actions also depend on the migration source and configuration. The table uses captions from the previous interface, which supports Dynamics GP.

|Action   |Description|
|---------|---------|
|**Configure GP Migration**|Configure migration settings for company data in Dynamics GP. Learn more in [Configure Dynamics GP company migration](migrate-gp-configure-companies.md).|
|**Rerun GP Detail Snapshot**|Rerun the migration of GP historical transactions based on your company settings.|
|**Run Migration Now**|Start data replication manually. You can run replication again after resolving errors or to copy later source changes. Change tracking identifies changes for tables that support incremental replication. Plan migration between environment updates. If you need to update the target environment, disable cloud migration, update the environment, and run cloud migration setup again. Learn more in [Run and manage data replication](migrate-data-replication-run.md).|
|**Run Data Upgrade Now**|Transform replicated GP data into Business Central data. This action is visible when **Run migration after replication** is off on **GP Migration Settings**. Learn more in [Upgrade data for Dynamics GP cloud migration](migration-data-upgrade-gp.md).|
|**Refresh Status**|If a migration run is in progress, you can choose to refresh status to update the page. If the run is complete, the status updates using the refresh status action without having to close the window and reopen it.|
|**Get Runtime Service Key**|Returns the existing runtime key.|
|**Reset Runtime Service Key**|Regenerate the integration runtime service keys if you suspect that a key is no longer secure. The action displays the new primary key.|
|**Disable Cloud Migration**|Open **Cloud Ready Checklist** to review the completion tasks and disable cloud migration. Use the guide after you migrate and validate the desired data, or before an environment update. Learn more in [Complete Dynamics GP cloud migration to Business Central online](migration-finish-gp.md).|
|**Check for Update**|Check for a newer migration service version. The page shows the current and latest versions and lets you update the service. We recommend that you update the service if a newer version is available.|
|**Manage Custom Tables**|Open **Migration Table Mapping** to configure custom table mappings for migration. Requires the **SUPER** permission set. Learn more in [Define cloud migration table mappings](migration-table-mapping.md).|
|**Azure Data Lake**|Copy Dynamics GP data to Azure Data Lake while cloud migration is enabled. Learn more in [Copy Dynamics GP data to Azure Data Lake](cloud-migration-azure-data-lake-gp.md).|

## Next steps

- [Prepare and plan for cloud migration from Dynamics GP](cloud-migration-plan-prepare-gp.md)
- [Run cloud migration setup](migration-setup-gp.md)
- [Run data replication](migrate-data-replication-run.md)
- [Run data upgrade](migration-data-upgrade-gp.md)
- [Complete cloud migration](migration-finish-gp.md)  

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  
