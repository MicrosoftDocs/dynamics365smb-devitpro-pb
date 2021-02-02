---
title: Manage the cloud migration
description: Get a cloud copy of your data so you are connected to the intelligent cloud also when you have an on-premises solution based on Business Central, Dynamics GP, or Dynamics NAV.
author: bmeier94

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge
ms.date: 01/27/2021
ms.author: edupont

---

# Managing the Migration to the Cloud

You can connect your on-premises solution to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant for the purpose of migrating your data to the cloud. Once you have set up this configuration, you can manage your cloud environment and data migration from the **Cloud Migration Management** page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.  

> [!NOTE]
> To manage migrations and run the migration tool, you must have the SUPER permission set in [!INCLUDE [prod_short](../includes/prod_short.md)] and be an administrator of the Microsoft 365 tenant.
.

## Cloud Migration Management

The **Cloud Migration Management** page provides information about your data migration runs as well as the ability to manage your migration services, for example.  

The page provides a view of the status of all migration runs. You can view the time the migration ran and the status of each migration. If you have set up a schedule, you can also see when the next migration is scheduled to run. The **Migration Information** tiles show the number of migrated tables and the number of tables that did not migrate due to warnings or errors. Choose a tile to drill into additional details and guidance to correct any errors.  

There is also a tile that shows tables that are not migrated due to problems with the data. For example, tables with permissions are not migrated from on-premises solutions because permissions work differently between online and on-premises.

The following table describes the actions that you can run from the page:  

|Action   |Description|
|---------|---------|
|Manage Schedule     |Opens a page where you can set the migration schedule without having to run the assisted setup wizard again.|
|Run Migration Now    |Choose this to start the data migration manually. This can be helpful if you received errors in the scheduled data migration, you corrected the errors, and you now want to push updated data to the cloud outside of a normally scheduled run. The migration can also be used for subsequent runs after the initial migration. On subsequent runs, the migration tool will only migrate changes that have happened since the previous migration was run. Change tracking is used to identify what data should be moved in those subsequent runs.|
|Refresh Status      |If a migration run is in progress, you can choose to refresh status to update the page. If the run is complete, the status will update using the refresh status action without having to close the window and reopen it.|
|Reset Cloud Data   |You may run into instances where you need to reset your cloud data. This option will clear all data in your cloud tenant and enable you to start over with data migration. Only run this process if you want to start the migration process all over from the beginning. If you need to clear data in your cloud tenant, and you have connectivity issues that persist for more than 7 days, you must contact customer support. They will create a ticket to have your tenant data cleared. This process should *only* be done if you want to start the data migration all over and bring all data from on-premises to your cloud tenant.|
|Get Runtime Service Key    |Returns the existing runtime key.|
|Reset Runtime Service Key    |If at any time you suspect that your Self-Hosted Integration Runtime key is no longer secure, you can choose this option to regenerate a new key. A new key will be generated for you and automatically be updated in the Self Host Integration Runtime service.|
|Disable Cloud Migration    |Opens a guide that helps you through a checklist of instructions to disable the cloud migration configuration. Once the steps in this process are complete, you can use your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant as your primary solution.|
|Check for Update           |If there have been changes to the migration service, we will publish the new service. This action will check to see if a new service has been published. The check will display the version of the service you are currently running and then also display the latest service published. You will then have the option to update your solution. We recommend that you update the solution if a newer version has been published.|
|Select Companies to Migrate|If your database contains more than one company, you this action to specify which company or companies to schedule a migration run for. For example, you're migrating a very large database with multiple companies, so you break down the migration in several runs by including one or a few companies in each migration run. You can see the estimated size of each company|
|Define User Mappings       |This option is available when you log in to a particular company that has been migrated. This action  should be done in one of the companies you have migrated. This action gives you a list of the users that were in your on-premises environment, and then gives you a list of your Microsoft 365 users, so that you can map the two together. This process renames the **Name** field on the **User Card** to match the user name in your on-premises solution. It is not a required step, but if you use some of the processes in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that work in conjunction with the user name, such as timesheets, you may want to map users. Timesheets are visible based on the user name you are logged in as in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|
|Setup Checklist      |When you are ready to use your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant as your main system, the tables that were not migrated must be set up or defined as needed. The checklist page shows recommended steps to complete your migration to the cloud.|
|Azure Data Lake|This option is available if the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online tenant is connected to Dynamics GP. For more information, see [Migrate Dynamics GP to Azure Data Lake](migrate-dynamics-gp.md#lake).|

## Company initialization

When a company is created in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], no one can access it until it has been initialized. If you are familiar with [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)], then you are used to this step happening automatically during the upgrade process, for example. But it's not quite the same with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online. Starting with 2020 release wave 2, when a migration run completes, you are prompted to view a list of companies that were not initialized yet so that you can start the initialization. You can choose to mark a company as already initialized, such as if it was initialized in an earlier migration run. Technically, the initialization runs as a scheduled task in the job queue, and the status is automatically updated in the list of companies when a task completes.  

> [!NOTE]
> When you schedule an initialization in the **Hybrid Companies** list, then you cannot make any modifications to the company until the initialization task completes.

## See also

[Running the Cloud Migration Tool](migration-tool.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
[FAQ about Connecting to Business Central Online from On-Premises Solutions](faq-intelligent-cloud.md)  
