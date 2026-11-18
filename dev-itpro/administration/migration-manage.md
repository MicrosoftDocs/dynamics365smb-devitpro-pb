---
title: Manage Business Central Cloud Migration
description: Learn which actions are available on the Cloud Migration Management page in Business Central to replicate data, track progress, and complete migration.
author: jswymer 
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: overview 
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Managing cloud migration

Business Central offers two ways to manage cloud migration: the Business Central web client in the online environment or the cloud migration API. The web client provides a user-friendly interface for managing migration runs and services through the **Cloud Migration Management** page, while the API offers more advanced and automated capabilities. Both options allow users to set up, move data, track progress, and manage migration services.

The following section provides an overview of the **Cloud Migration Management** page. Learn more in [Cloud Migration APIs Overview](cloudmigrationapi/cloud-migration-api-overview.md).

<!--Cloud migration API provides capability for automating the cloud migration process end-to-end by using APIs. You will be able to complete the setup, move the data, and track the progress, trigger upgrade if needed and switch off the cloud migration.-->

## Cloud Migration Management page

<!--The **Cloud Migration Management** page provides information about your data migration runs and the ability to manage your migration services, for example.  

The page provides a view of the status of all migration runs. You can view the time the migration ran and the status of each migration. The **Migration Information** tiles show the number of migrated tables and the number of tables that didn't migrate due to warnings or errors. Choose a tile to drill into more details and guidance to correct any errors.  

There's also a tile that shows tables that aren't migrated due to problems with the data. For example, tables with permissions aren't migrated from on-premises solutions because permissions work differently between online and on-premises.

The following table gives a brief description of the actions that you can run from the page. More details about how and when to use these actions are provided in other articles of the help.   

> [!NOTE]
> Many actions aren't available until after you've set up cloud migration.-->

The **Cloud Migration Management** page in the web client is a central hub for managing cloud data migration. This page provides you with the necessary actions and information to manage your migration services and keep track of data migration runs.

:::image type="content" source="../developer/media/cloud-migration-replication-completed.png" alt-text="Screenshot of Cloud Migration Management showing completed replication and migration statistics.":::

On the page, the **Migration Log** gives you the status of all migration runs, including the time they ran and their current progress. Above the **Migration Log**, fields provide details about the companies including the number of migrated tables and those tables that didn't migrate due to warnings or errors. By selecting a field, you can drill down to view more details and guidance on how to correct any errors.

<!--Furthermore, there's a tile that highlights tables that weren't migrated due to data-related issues. For example, tables with permissions aren't migrated from on-premises solutions because permissions work differently between online and on-premises.-->

The following table provides a brief description of the actions you can take and when to use them. More detailed information on how to use these actions is available in other articles in the help section.

Most actions require the **SUPER** permission set, and replication actions require completed cloud migration setup. Available actions also depend on the migration source and configuration. The table uses captions from the new interface.

|Action   |Description|
|---------|---------|
|**Run data replication**|Select this action to start the data migration right away. This action can also be used for subsequent runs after the initial migration. On subsequent runs, the migration tool generally migrates changes that have happened since the previous migration was run. Change tracking is used to identify what data should be moved in those subsequent runs. Tables can be fully replicated again if the change tracking retention period has expired. However, the migration tool can't run if the target environment is being upgraded. In that case, you must disable cloud migration, upgrade, and then set up cloud migration again.|
|**Run data upgrade**|Select this action to upgrade data, such as if you're migrating data from an earlier version to the latest version of [!INCLUDE [prod_short](../includes/prod_short.md)]. No data upgrade is needed for a same-major-version migration. Learn more in [Run data upgrade during cloud migration](migration-data-upgrade.md).|
|**Refresh status**|If a migration run is in progress, you can choose to refresh status to update the page. If the run is complete, the status updates using the refresh status action without having to close the window and reopen it.|
|**Complete migration**|Opens a guide that helps you through a checklist of instructions to disable the cloud migration configuration. Use the guide when you've migrated the data that you want to migrate, or when you want to upgrade the target environment. Failed tables, unfinished data repair, or a required data upgrade that hasn't completed block this action. Once the steps in this process are complete, you can use your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant as your primary solution, or you can upgrade the environment.|
|**Pause migration**|Disables cloud migration. Use this action if you plan to run cloud migration on the environment in the future. You must wait for in-progress migrations to finish, then run setup again before resuming replication.|
|**Abandon migration**|Disables cloud migration. Use this action if you don't intend to run cloud migration again on the environment. You must wait for in-progress migrations to finish. You can set up the migration again on the same or a different environment.|
|**Manage table mappings**|Define migration table mappings for renaming tables or moving a subset of fields to a different table or table extension during the cloud migration. Learn more in [Define cloud migration table mappings](migration-table-mapping.md).|
|**Define user mappings**|This action should be done in one of the companies you've migrated. This action gives you a list of the users that were in your on-premises environment. Then, it gives you a list of your online users, so that you can map the two together. This process renames the **User Name** field on the **User Card** to match the user name in your on-premises solution. It isn't a required step, but if you use some of the processes in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that work with the user name, such as time sheets, you may want to map users. Time sheets are visible based on the user name you're signed in as in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Migrate record links and notes before mapping users. Map users only once for each migration. If you run the mapping twice or more, you might run into conflicts.|
|**Migrate record links and notes**|Moves replicated links and notes from the buffer to the record-link table. The action requires an unblocked, nonempty buffer. Run it after the final replication and before defining user mappings. Repeating the action can update previously migrated records and displays a warning about unwanted results. Learn more in [Complete cloud migration](migration-finish.md).|
|**Create diagnostic run**|Does a test run of the data replication. No data from the on-premises database is migrated to the online tenant, but it allows you to identify issues and fix them before you run the actual replication.|
|**Get runtime service key**|Returns the existing authentication key used by the integration runtime service.|
|**Reset runtime service key**|If at any time you suspect that your self-hosted integration runtime key is no longer secure, you can select this option to regenerate a new key. A new key is generated for you and automatically updated in the self-hosted integration runtime service.|
|**Check for update**|If there have been changes to the migration service, we publish the new service. This action checks to see if a new service has been published. The check displays the version of the service you're currently running and then also displays the latest service published. Then, you can choose to update your solution. We recommend that you update the solution if a newer version has been published.|
|**Select companies to replicate**|If your database contains more than one company, use this action to specify which company or companies to run a migration for. For example, you're migrating a large database with multiple companies, so you break down the migration in several runs by including one or a few companies in each migration run. You can see the estimated size of each company.|
|**Setup checklist**|When you're ready to use your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant as your main system, the tables that weren't migrated must be set up or defined as needed. The checklist page shows recommended steps to complete your migration to the cloud. The action is enabled in a company selected for replication.|
|**Repair companion table records**|Inserts missing records in table extensions. Use this action if records were copied during replication, but they're not showing up in the client UI.|
|**Setup cloud migration**|Opens the **Cloud Migration Setup** assisted setup guide to configure the cloud migration. Setting up cloud migration is a necessary step before you can replicate data. Learn more in [Set up cloud migration](migration-setup-overview.md).|
|**Sanitize tables**|Sanitizes code fields in a selected company and table in the online environment. Use this action to resolve invalid code-field values after replication if you didn't sanitize the on-premises data first. Learn more in [Clean data before cloud migration](migration-clean-data.md).|
|**Enable/Disable new UI**|Toggles between the legacy and the new user interface of the **Cloud Migration Management** page.|
|**Enable/Disable Removing Permissions from Users**|Controls whether cloud migration setup resets user permissions. Set this option before setup if you want users to retain permissions. Learn more in [Retain permissions during cloud migration](migration-retain-permissions.md).|
|**Change how the data is replicated**|Lets you include or exclude eligible tables and choose whether replication keeps existing data or replaces the entire table. Availability depends on the migration source.|

<!--
|Disable cloud migration|Opens a guide that helps you through a checklist of instructions to disable the cloud migration configuration. Use the guide when you've migrated the data that you want to migrate, or when you want to upgrade the target environment. Once the steps in this process are complete, you can use your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant as your primary solution, or you can upgrade the environment.|-->
