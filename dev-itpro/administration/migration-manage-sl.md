---
title:  Managing Dynamics SL cloud migration
description: Describes the Cloud Migration Management page in Business Central for migrating from Dynamics SL.
author: lcontreras 
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: overview 
ms.collection: 
ms.date: 12/13/2024
ms.custom: bap-template
---

# Managing Dynamics SL cloud migration

Business Central offers two ways to manage cloud migration: the Business Central web client in the online environment or the cloud migration API. The web client provides a user-friendly interface for managing migration runs and services through the **Cloud Migration Management** page, while the API offers more advanced and automated capabilities. Both options allow users to set up, move data, track progress, and manage migration services.

The following section provides an overview of the **Cloud Migration Management** page. For more information about the cloud management API, see [Cloud Migration APIs Overview](cloudmigrationapi/cloud-migration-api-overview.md).

## Cloud Migration Management page

The **Cloud Migration Management** page in the web client is a central hub for managing cloud data migration. This page provides you with the necessary actions and information to manage your migration services and keep track of data migration runs.

- The **Migration Log** gives you the status of all migration runs, including the time they ran and their current progress.
- Above the **Migration Log**, fields provide details the number of successfully migrated tables. By selecting a field, you can drill down to view more details and guidance on how to correct any errors.
- The **Migration Information** tiles, as illustrated in the following figure, show the number of migrated tables and the number of tables that didn't migrate due to warnings or errors. Select a tile to drill into more details and guidance to correct any errors. There's also a tile that shows tables that aren't migrated due to problems with the data. For example, tables with permissions aren't migrated from on-premises solutions because permissions work differently between online and on-premises.

   ![Shows the flow for cloud migration setup ](../media/SL-migration-management.png)

## Available actions

> [!NOTE]
> Some actions aren't available until after you've set up cloud migration, and others aren't active for Dynamics SL migration.

|Action   |Description|
|---------|---------|
|**Configure SL Migration**|Configure migration settings for migrating company data in Dynamics SL. [Learn more](migrate-SL-configure-companies.md)|
|**Run data replication**|Choose this action to start the data migration manually. The migration can also be used for subsequent runs after the initial migration. On subsequent runs, the migration tool only migrates changes that happened since the previous migration was run. Change tracking is used to identify what data should be moved in those |
|**Run Data Upgrade Now**|Choose this action to upgrade data. [Learn more](migration-data-upgrade-sl.md)|
|**Refresh Status** |If a migration run is in progress, you can choose to refresh status to update the page. If the run is complete, the status updates using the refresh status action without having to close the window and reopen it.|
|**Complete migration menu - Complete migration**| Completes cloud migration setup.|
|**Pause migration**| Pauses cloud migration. Use this action if you want to continue cloud migration in the future.|
|**Abandon migration**| Abandons cloud migration. Use this action if you do not want to restart the cloud migration in the future.|
|**Manage custom tables**| Open the **Migration Table Mapping** page. Displays the source table name from Dynamics SL and the Business Central table name.|
|**Actions** |The **Actions** menu gives you access to action options related to the Dynamics SL Migration process.|

## Next steps

- [Prepare and plan for cloud migration](cloud-migration-plan-prepare-SL.md)
- [Run cloud migration setup](migration-setup-SL.md)
- [Run data migration](migration-data-replication.md)
- [Run data upgrade](migration-data-upgrade-SL.md)
- [Complete cloud migration](migration-finish-SL.md)  

## See also

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-SL-overview.md)  
[FAQ about migrating to Business Central online from on-premise solutions](faq-migrate-data.md)  
