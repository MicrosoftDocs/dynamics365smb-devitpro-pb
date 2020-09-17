---
title: Migrate from on-premises deployments to Business Central online
description: Learn how to set up cloud data migration from on-premises to your Business Central tenant so you can migrate to the cloud version of Business Central.

author: bmeier94
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge,
ms.date: 09/17/2020
ms.author: edupont

---

# Migrating On-Premises Data to Business Central Online

Organizations that run their workloads on-premises but are looking to move to the cloud can easily migrate to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online. By moving to the cloud, users get the benefits of cloud scenarios such as Machine Learning, Power BI, Power Automate, and others to drive suggested actions.  

The cloud migration tool in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] supports migration from specific versions of specific software. For more information, see the following articles:

* [Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
* [Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
* [Upgrading from Dynamics NAV to Business Central Online(../upgrade/Upgrade-Considerations.md##upgrading-from--to--online)

## Data migration

Data migration is the process of securely migrating data from your on-premises SQL Server instance to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.  

In order for the data migration to take place, you must successfully complete the **Cloud Migration Setup** assisted setup wizard in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. Once the wizard is complete and data migration is activated, an initial data migration will happen at the scheduled time. Alternatively, you can trigger the data migration process manually.  

Data is migrated between the two systems on a per-table basis, and success and failures are tracked for each table. If a table fails to migrate, the error will be captured, and the migration moves on to the next table until completed. Tables will fail to migrate if they cannot be found, or if the schema does not match between the cloud and the on-premises tables.  

The initial data migration time can vary depending factors such as the amount of data to migrate, your SQL Server configuration, and your connection speeds. The initial migration will take the longest amount of time to complete because all data is migrating. After the initial migration, only changes in data will be migrated so they should run more quickly.  You do not need to run the migration process more than once if you don't want to, but if you are running the migration while users are still using the on-premises system you will need to run at least one more migration in order to ensure all data was moved to the cloud before you start transacting in the cloud tenant.  

## See also

[Running the Cloud Migration Tool](migration-tool.md)  
[Managing the Migration to the Cloud](migration-management.md)  
[FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](FAQ-Intelligent-Cloud.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Managing your intelligent cloud environment](manage-intelligent-edge.md)  
