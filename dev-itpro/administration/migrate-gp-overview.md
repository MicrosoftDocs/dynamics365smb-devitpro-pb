---
title: Migrate on-premises GP data to Business Central online overview
description: This article provides an overview of how the migration works and the necessary tasks for completing the migration from Dynamics GP on-premises.
author: jswymer
ms.topic: conceptual
ms.reviewer: jswymer
ms. search.keywords: cloud, edge
ms.search.form: 2502, 4003
ms.date: 12/14/2023
ms.author: jswymer
ms.custom: bap-template
---

# Dynamics GP migration to Business Central online: End-to-end overview

This article provides an overview of how the migration works and the necessary tasks for completing the migration from Dynamics GP on-premises. By gaining an understanding of the data migration basics, you're able to plan and execute a smooth transition to the cloud. 

## Understanding cloud migration

Data migration is the process of securely migrating data from an on-premises SQL Server instance to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.  You manage cloud migration from [!INCLUDE [prod_short](../includes/prod_short.md)] online through a connection to the on-premises database and various components that establish a pipeline for replicating data. The on-premises solution remains the operative environment until you complete the cloud migration. <!--[!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]-->  

### Components involved

The following figure illustrates the main components involved in the data migration process.

![Shows components of cloud migration](../developer/media/cloud-migration-overview-gp.svg)

|Component|Description|
|-|-|
|On-premises database|This database is the on-premises SQL Server database that stores business data for the companies to migrate to the cloud. |
|Azure Data Factory|A key component of the data migration is [Azure Data Factory](/azure/data-factory/introduction). Azure Data Factory is a managed cloud service that's built for migrating large amounts raw data across data sources and controlling data integration projects. Azure Data Factory migrates the data between on-premises and online directly. In other words, it doesn't look at any permissions within the applications you're transferring data between&mdash;only SQL permissions.|
|Pipelines|Pipelines are the main elements of Azure Data Factory. Pipelines are groupings of activities that copy, move, and transform data, and also orchestrate its flow.|
|Integration Runtime|The Integration Runtime component is the compute infrastructure of Azure Data Factory. There are two Integration Runtime instances in the end-to-end process. The first instance securely copies data from on-premises to the cloud, where the pipelines are created. If the on-premises database is an SQL Server database, you use a self-hosted integration runtime. This runtime is installed locally on the on-premises network and registered in Azure Data Factory.|
|Online database|This database in the Azure SQL Database of the Business Central environment that you're migrating data to.|

### What data is migrated

In general, the cloud migration tool migrates the following data:

- System and company setup, such as payment terms, shipping method, and sites
- Master data for accounts, customers, vendors, and items
- Transactional data  
- Classes for customers, vendors, and items
- Vendor 1099
- Historical data

The company data that is migrated is configurable as part of the cloud migration setup. To learn more, see [Configure Dynamics GP company migration](migrate-dynamics-gp.md).

### How data is migrated 

Data is migrated table by table, and success and failures are tracked for each table. If a table fails to migrate, the error will be captured, and the migration moves on to the next table until completed. Tables will fail to migrate if they can't be found, or if the schema doesn't match between the cloud and the on-premises tables.  

Typically, you first run the migration on as a test on a sandbox environment. Then, when you're ready to go live, you run the migration on the production environment. The data migration time can vary depending on factors such as the amount of data to migrate, your SQL Server configuration, and your connection speeds.

> [!IMPORTANT]
> [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]

## End-to-end process

This section outlines the general process or phases you go through to migrate data from on-premises to online.

1. Migration assessment

   Before migrating your on-premises deployment to the cloud, it's essential to evaluate its readiness. To help you, we offer the migration assessment tool delivers valuable insight into your overall readiness to migrate. It provides migration options based on your needs, and detects potential migration issues based on your Dynamics GP system structure. To get started with the assessment tool, go to [https://bcmigrationassessments.com/](https://bcmigrationassessments.com/)

   Learn more about the tool in the video [Are You Ready for Business Central](https://www.youtube.com/watch?v=r2gNgQrCgoo&list=PLcakwueIHoT9yVFOV6_BXMVeodPq3lt3o&index=15).

1. Preparation

   The preparation phase helps ensure the migration runs as fast and problem-free. Preparation typically includes these tasks:

   1. Plan:

      Develop a migration plan that includes a detailed timeline, resource requirements, and migration approach. A well-crafted plan can help minimize downtime and prevent users from losing work. You should plan to run cloud migration between environment updates.

      To get started, go to [Plan](cloud-migration-plan-prepare-gp.md).
  
   1. Verify prerequisites:

      Prepare your on-premises environment for migration, which includes ensuring that it meets the prerequisites for migration, such as using GP 2015 or later. This step is crucial in ensuring that your environment is ready for the migration process.

      To get started, go to [Prerequisites](cloud-migration-prerequisites-gp.md).
   1. Verify that data is in the best state possible to complete the migration:

      This step involves reviewing your data to ensure that it's clean, accurate, and in the best possible state for migration.

1. Cloud migration setup

   The phase doesn't migrate any data, but it gets the environment ready for migration by establishing the connection and pipeline between the on-premises database and online tenant database. You also specify which companies to migrate. This phase starts when you run the **Set up Cloud Migration** assisted setup guide in [!INCLUDE [prod_short](../includes/prod_short.md)] online. 

   To get started, go to [Set up cloud migration](migration-setup-overview.md).

1. Configure Dynamics GP company migration

   The step is part of the setup phase in whihc you select the companies and data that you want to migrate. 

   To get started, go to [Configure Dynamics GP company migration](migrate-gp-configure-companies.md).

1. Data replication

   This step migrates data from on-premises to online. It starts when you run the **Run data replication** assisted setup guide in [!INCLUDE [prod_short](../includes/prod_short.md)] online. At the end of the process, you have a copy of the on-premises data in the relevant [!INCLUDE [prod_short](../includes/prod_short.md)] online environment. 

   At this point in the process, you can verify whether the migration went well or not, fix any problems, and rerun the replication multiple times if you want to. Once the data has been replicated to the sandbox environment, you can use the troubleshooting tools in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].

   To get started, go to [Replicate data](migration-data-replication.md).

1. Data upgrade

   After data replication is complete, the cloud migration might have the status *Upgrade Pending* on the **Cloud Migration Management** page. This step starts when you choose the **Run Data Upgrade Now** action in the **Cloud Migration Management** page in [!INCLUDE [prod_short](../includes/prod_short.md)] online for the specific environment.

   To get started, go to [Upgrade data](migration-data-upgrade.md).

   [!INCLUDE [cloud-migration-telemetry](../includes/bc-cloud-migrate-replicate-all-before-upgrade.md)]

1. Completion and follow-up

   Completion and follow-up are crucial steps in the cloud migration process, as they involve setting up and optimizing your new Business Central online environment. Here are some essential tasks to consider:

   1. Optimize your Business Central online environment:

      Configure the system to meet your business needs. This task may include setting up security, customizing forms and reports, and integrating with other systems. By taking the time to optimize your new environment, you can ensure that it meets your specific requirements and works seamlessly with your existing systems.
   1. Set up user access:

      Grant access to your new Business Central online system for all relevant users. This task includes creating new user accounts, setting up permissions, and defining roles and responsibilities.
   1. Go live:

      Once you're satisfied that your new environment is set up correctly, it's time to switch over to the new Business Central online system. This task involves decommissioning the on-premises deployment and ensuring that all users are using the new system.

   To get started, go to [Complete cloud migration](migration-finish.md).

By completing these tasks, you can ensure a successful migration to the cloud-based Business Central solution.

## Working with environments during cloud migration

You manage the cloud migration from [!INCLUDE [prod_short](../includes/prod_short.md)] online. But once you start the migration phase, the on-premises solution remains the operative environment until you complete the migration. [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]  

Any existing data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online will be overwritten with data from your on-premises solution, or source, once the data replication is run.  

If you don't want data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online to be overwritten, don't configure the connection.

### Limited data entry during migration period

Once the cloud migration is set up and underway, the data that you can enter in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant is limited to data that isn't included in data migration from on-premises. Otherwise, any data that was written to the tenant database would be continuously overwritten during the migration process.  

To make setting up this read-only tenant more efficient, we created the <!--*Intelligent Cloud* user group and the-->*Intelligent Cloud* permission set. Once the cloud migration environment is configured, existing users in the online tenant that don't have SUPER permissions are automatically assigned to the *Intelligent Cloud* <!--user group--> permission set. Only users with SUPER permissions will be allowed to make modifications to the system at this point. If you add any online users later, make sure you assign them *Intelligent Cloud* permission set. They're not assigned automatically.

> [!NOTE]  
> Before you configure a connection from on-premises to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, make sure that at least one user in each company is assigned SUPER permissions.  

Users that are reassigned to the *Intelligent Cloud* <!--user group--> permission set have access to read ALL data by default. If you need to further restrict what data a user should be able to read, the SUPER user can create new user groups and permissions sets and assign users accordingly. It's highly recommended to create any new permissions sets from a copy of the *Intelligent Cloud* permission set and then take away permissions you don't want users to have.  

> [!WARNING]
> If you grant insert, modify or delete permissions to any resource in the application that was set to read-only, it could have a negative impact on the data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. If this occurs, you may have to clear all your data and rerun a full migration to correct this.

## See also

[FAQ about Migrating to the Cloud from On-Premises Solutions](faq-migrate-data.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate Dynamics GP Data to the Cloud](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[Managing Capacity](tenant-admin-center-capacity.md)  
