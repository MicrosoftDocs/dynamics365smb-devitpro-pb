---
title: Administration of the Intelligent Edge for on-premises | Microsoft Docs
description: Get a cloud copy of your data so you are connected to the intelligent cloud also when you have an on-premises solution based on Business Central, Dynamics GP, Dynamics SL, or Dynamics NAV.
author: bmeier94

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge
ms.date: 11/25/2019
ms.author: bmeier

---

# Managing your intelligent cloud environment

You can connect your on-premises solution to a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant for the purpose of migrating your data to the cloud. Once you have set up this configuration, you have access to the **Cloud Migration Management** page in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, from there you can manage your  Cloud environment and data migration.  

## Cloud Migration Management

The **Cloud Migration Management** page provides information about your data migration runs as well as the ability to manage your migration services, for example.  

The page provides a view of the status of all migration runs. You can view the time the migration ran, the status of each migration, and when your next migration is scheduled to run, if you have set up a schedule. The **Migration Statistics** tiles show the number of tables migrated and the number of tables that did not migrate due to any warnings/errors that occurred during the migration process. Choose a tile to drill into additional details regarding the migration status of each table as well as any messaging to assist you in correcting any errors.  

There is also a tile that shows tables that are not migrated at all due to the data in the table. For example, tables with permissions are not migrated from on-premises solutions because permissions work differently are differently between online and on-premises.


The following table describes the actions that you can run from the page:  

|Action   |Description|
|---------|---------|
|Manage Schedule     |Opens a page where you can set the migration schedule without having to run the assisted setup wizard again.|
|Run Migration Now    |You can disable automatic data migration and trigger data migration manually. This could be used  when you received errors in the scheduled data migration, you corrected any errors, and want to push updated data to the cloud outside of a normally scheduled run.|
|Refresh Status      |If a migration run is in progress you can chooose to refresh status to update the page. If the run is complete the status will update using the refesh status action without having to close the window and reopen it.|
|Reset Cloud Data   |You may run into instances where you need to reset your cloud data. This option will clear all data in your cloud tenant and enable you to start over with data migration. This process should only be done if you want to start the migration process all over from the beginning. If you need to clear data in your cloud tenant and are have connectivity issues that persist for more than 7 days, you will need to contact customer support. They will create a ticket to have your tenant data cleared.|
|Reset Runtime Service Key    |If at any time you suspect that your Self Hosted Integration Runtime key is no longer secure, you can choose this option to regenerate a new key. A new key will be generated for you and automatically be updated in the Self Host Integration Runtime service.|
|Get Runtime Service Key    |Returns the existing runtime key.|
|Disable Cloud Migration    |Opens a guide that helps you through a checklist of instructions to disable the cloud migration configuration. Once the steps in this process are complete, data migration will be discontinued, and you can choose to use your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant as your primary solution.|
|Check for Update           |If there have been changes to the migration service, we will publish the new service. This action will check to see if a new service has been published. The check will display the version of the service you are currently running and then also display the latest service published. You will then have the option to update your solution. We recommend that you update the solution if a newer version has been published.|
|Select Companies to Migrate  |If you want to choose additional companies to migrate that you didn't select when you originally walked through the Cloud Migration wizard, you can choose this action, and you will see a list of the companies in your on-premises environment. You can see which companies are already selected, and you can choose more if you would like.|
|Define User Mappings       |THis option will be available when you login to a particular company that has been migrated. This action  should be done in one of the companies you have migrated. This action gives you a list of the users that were in your on-premises environment, and then gives you a list of your Office 365 users, so that you can map the two together. This process renames the **Name** field on the **User Card** to match the user name in your on-premises solution. This is not a required step, but if you use some of the processes within Business Central that work in conjunction with the user name, you may want to map users. An example of this is timesheets. Timesheets are visible based on the user name you are logged in as in Business Central.|
|Setup Checklist      |When you are ready to disable the Cloud Migration and use your Business Central online tenant as your main system, the tables that were not migrated must be set up or defined as needed. The checklist page shows recommended steps that you can choose to complete to finalize your migration to the cloud.| 

## See also

[Frequently Asked Questions about Connecting to the Intelligent Cloud](faq-intelligent-cloud.md)  
[Replicating on-premises data](data-replication-intelligent-cloud.md)  
[Connect to the Intelligent Cloud with [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](about-intelligent-edge.md)  
[Your Access to the Intelligent Cloud](/dynamics365/business-central/about-intelligent-cloud)
