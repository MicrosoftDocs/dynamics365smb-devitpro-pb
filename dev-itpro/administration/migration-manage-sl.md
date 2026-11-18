---
title: Manage Dynamics SL Cloud Migration in Business Central
description: Learn how to monitor Dynamics SL cloud migration, investigate errors, configure companies and table mappings, and manage replication and data upgrade.
author: lcontreras 
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: overview 
ms.collection: 
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Managing Dynamics SL cloud migration

Business Central offers two ways to manage cloud migration: Business Central web client or cloud migration API. The web client provides a user-friendly interface for managing migration runs and services through the **Cloud Migration Management** page. The API offers more advanced and automated capabilities. Both options let you set up, move data, track progress, and manage migration services.

The following section provides an overview of the **Cloud Migration Management** page. Learn more about the API in [Cloud Migration APIs overview (v1.0)](cloudmigrationapi/cloud-migration-api-overview.md).

## Cloud Migration Management page

The **Cloud Migration Management** page in the web client is a central hub for managing cloud data migration. Dynamics SL opens the new management interface by default. This page provides the necessary actions and information to manage your migration services and track data migration runs.

- The **Migration log** gives you the status of migration runs, including the time they ran and their current progress.
- Above the log, **Tables successful**, **Tables remaining**, **Tables failed**, and **Warnings** show replication results. Some fields appear only when there are tables or warnings to show. Select a field to investigate.
- **SL Cloud Migration Errors** and **Failed Companies** help you investigate company migration failures. Use **Posting Errors** and **SL Cloud Migration Warnings** to investigate posting issues.

   :::image type="content" source="../media/SL-migration-management.png" alt-text="Screenshot of Dynamics SL migration runs, table counts, company status, and migration warnings in Business Central.":::

<a name="available-actions"></a>
## Available migration actions

> [!NOTE]
> Most management actions require the **SUPER** permission set and completed cloud migration setup. Available actions also depend on the migration source and configuration. The table uses captions from the new interface.

|Action   |Description|
|---------|---------|
|**Configure SL Migration**|Set up migration settings for company data in Dynamics SL. Learn more in [Configure Dynamics SL company migration](migrate-sl-configure-companies.md).|
|**Rerun SL Historical Snapshot**|Rerun historical data migration according to your company settings. The action requires historical migration to be configured.|
|**Run data replication**|Start data replication manually. You can run replication again after resolving errors or to copy later source changes. Change tracking identifies changes for tables that support incremental replication. Learn more in [Run and manage data replication](migrate-data-replication-run.md).|
|**Run data upgrade**|Transform replicated Dynamics SL data into Business Central data in background tasks or sessions. Learn more in [Upgrade data for Dynamics SL cloud migration](migration-data-upgrade-sl.md).|
|**Refresh status**|Update the migration status and statistics without closing and reopening the page.|
|**Complete migration**|Open **Cloud Ready Checklist** to review completion tasks and disable cloud migration after you migrate and validate the desired data. Learn more in [Complete Dynamics SL cloud migration to Business Central online](migration-finish-sl.md).|
|**Pause migration**|Disable cloud migration if you intend to continue later. This action doesn't stop an in-progress replication. To migrate again, run cloud migration setup again.|
|**Abandon migration**|Disable cloud migration if you don't intend to continue. This action doesn't stop an in-progress replication or remove migrated data. To migrate again, run cloud migration setup again.|
|**Manage table mappings**|Open **Migration Table Mapping** to view source and target table names and configure custom table mappings. Requires the **SUPER** permission set. Learn more in [Define cloud migration table mappings](migration-table-mapping.md).|
|**Get runtime service key**|Display the existing integration runtime key.|
|**Reset runtime service key**|Regenerate the integration runtime service keys and display the new primary key.|
|**Check for update**|Check whether a newer migration service version is available.|
|**Azure Data Lake**|Copy on-premises data to Azure Data Lake while cloud migration is enabled.|

## Next steps

- [Prepare and plan for cloud migration from Dynamics SL](cloud-migration-plan-prepare-sl.md)
- [Run cloud migration setup](migration-setup-sl.md)
- [Run and manage data replication](migrate-data-replication-run.md)
- [Run data upgrade](migration-data-upgrade-sl.md)
- [Complete cloud migration](migration-finish-sl.md)

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-sl-overview.md)\
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  
