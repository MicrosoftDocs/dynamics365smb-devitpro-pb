---
title: Migrate from on-premises deployments to Business Central online
description: Learn how to set up cloud data migration from on-premises to your Business Central tenant so you can migrate to the cloud using Business Central online.

author: bmeier94
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge,
ms.date: 01/27/2021
ms.author: edupont

---

# Migrating On-Premises Data to Business Central Online

Organizations that run their workloads on-premises but are looking to move to the cloud can easily migrate to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online. By moving to the cloud, users get the benefits of cloud scenarios such as Machine Learning, Power BI, Power Automate, and others to drive suggested actions.  

First, get started with [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant [here](/dynamics365/business-central/across-preview?toc=/dynamics365/business-central/dev-itpro/toc.json).

The cloud migration tool in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online supports migration from specific versions of specific software. For more information, see the following articles:

* [Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
* [Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
* [Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)

## Data migration

Data migration is the process of securely migrating data from your on-premises SQL Server instance to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant. The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.  

> [!TIP]
> Before you start the migration process, please update statistics and reorganize indexes on all tables on the source database. This will ensure that the migration runs as fast as possible. For more information, see the documentation for [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).

To migrate data, in the target company in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant, run the [Cloud Migration Setup](migration-tool.md) assisted setup wizard.  

> [!IMPORTANT]
> You must be signed in as an administrator of the [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant and the Microsoft 365 tenant.

Once the wizard is complete and data migration is activated, an initial data migration will happen at the scheduled time. Alternatively, you can trigger the data migration process manually.  

> [!TIP]
> [!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

Data is migrated table by table, and success and failures are tracked for each table. If a table fails to migrate, the error will be captured, and the migration moves on to the next table until completed. Tables will fail to migrate if they cannot be found, or if the schema does not match between the cloud and the on-premises tables.  

The initial data migration time can vary depending factors such as the amount of data to migrate, your SQL Server configuration, and your connection speeds. The initial migration will take the longest amount of time to complete because all data is migrating. After the initial migration, only changes in data will be migrated so they should run more quickly.  You do not need to run the migration process more than once if you don't want to, but if you are running the migration while users are still using the on-premises system you will need to run at least one more migration in order to ensure all data was moved to the cloud before you start transacting in the cloud tenant.  

## See also

[Running the Cloud Migration Tool](migration-tool.md)  
[Managing the Migration to the Cloud](migration-management.md)  
[FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](FAQ-Intelligent-Cloud.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[Managing your intelligent cloud environment](./migration-management.md)  
[Managing Capacity](tenant-admin-center-capacity.md)