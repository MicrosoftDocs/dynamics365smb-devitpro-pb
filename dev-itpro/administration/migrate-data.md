---
title: Migrate on-premises data to the cloud
description: Learn how to set up cloud data migration from on-premises to Business Central online. Azure Data Factory manages the data migration directly between databases.

author: bmeier94
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge,
ms.date: 10/01/2021
ms.author: edupont

---

# Migrate On-Premises Data to Business Central Online

Organizations that run their workloads on-premises but are looking to move to the cloud can easily migrate to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online. By moving to the cloud, users get the benefits of cloud scenarios such as Machine Learning, Power BI, Power Automate, and others to drive suggested actions.  

If you're not already familiar with [!INCLUDE [prod_short](../includes/prod_short.md)] online, take a look [here](/dynamics365/business-central/across-preview?toc=/dynamics365/business-central/dev-itpro/toc.json).

## Supported migration paths

[!INCLUDE [bc-cloud-products](../includes/bc-cloud-products.md)]

[!INCLUDE [bc-cloud-nav](../includes/bc-cloud-nav.md)]

## Data migration

Data migration is the process of securely migrating data from your on-premises SQL Server instance to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.  

> [!TIP]
> Before you start the migration process, please update statistics and reorganize indexes on all tables on the source database. This will ensure that the migration runs as fast as possible. For more information, see the documentation for [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).

To migrate data, in the target company in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, run the [Cloud Migration Setup](migration-tool.md) assisted setup wizard.  

> [!IMPORTANT]
> You must be signed in as an administrator of the Microsoft 365 tenant as well as [!INCLUDE [prod_short](../includes/prod_short.md)] online.

Once the wizard is complete and data migration is activated, an initial data migration will happen at the scheduled time. Alternatively, you can trigger the data migration process manually.  

> [!TIP]
> [!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

Data is migrated table by table, and success and failures are tracked for each table. If a table fails to migrate, the error will be captured, and the migration moves on to the next table until completed. Tables will fail to migrate if they cannot be found, or if the schema does not match between the cloud and the on-premises tables.  

The initial data migration time can vary depending factors such as the amount of data to migrate, your SQL Server configuration, and your connection speeds. The initial migration will take the longest amount of time to complete because all data is migrating. After the initial migration, only changes in data will be migrated, so each iteration runs more quickly. You do not need to run the migration process more than once if you don't want to. However, if you are running the migration while users are still using the on-premises syste, you must run at least one more migration in order to ensure all data was moved to the cloud before you start transacting in [!INCLUDE [prod_short](../includes/prod_short.md)] online.  

## Best practices

This section provides best practices and recommendations for migrating to the cloud.  

> [!IMPORTANT]
> You must be signed in as an administrator of [!INCLUDE [prod_short](../includes/prod_short.md)] online and the Microsoft 365 tenant.

* Make sure that at least one user has *SUPER* permissions in your [!INCLUDE [prod_short](../includes/prod_short.md)] online.  

    This is the only user who can make changes in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. All users that do not have *SUPER* permissions will be automatically reassigned to the intelligent cloud user group. This will limit them to read-only access to data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. For more information, se the [User groups and permission sets](#user-groups-and-permission-sets) section.  
* Test the connection in a sandbox environment before you make changes to a production environment.  

    For more information, see [Managing Environments](tenant-admin-center-environments.md).
* Any existing data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] onlinewill be overwritten with data from your on-premises solution, or source, once the data migration process is run.  

    If you do not want data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online to be overwritten, do not configure the connection. The only exception is when you migrate from [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises current version because you can run the migration tool multiple times in that very specific scenario.

* If your data source is [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, several stored procedures will be added to the SQL Server instance that you define. These stored procedures are required to migrate data from your SQL Server database to the Azure SQL server associated with your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant.
* Consider reducing the amount of data that you migrate.  
    [!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

    You can specify which companies to include in the migration in the assisted setup wizard, and you can view the migration status of each company in the [Cloud Migration Management](migration-management.md) page.  

    If you want to add more companies after the first selection of companies, you can add additional companies in the **Cloud Migration Management** page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. For more information, see [Adding a tenant to an existing runtime service, or updating companies](#adding-a-tenant-to-an-existing-runtime-service-or-updating-companies). But use the [Capacity](tenant-admin-center-capacity.md) section of the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to keep track of how much data you migrate.  

    In certain cases, the customer wants to migrate very large amounts of data. In those cases, you must first run the assisted setup once to create a pipeline, and then contact Support to increase the limitations on [!INCLUDE [prod_short](../includes/prod_short.md)] online. For more information, see [Escalating support issues to Microsoft](manage-technical-support.md#escalating-support-issues-to-microsoft). We are continually working on improving and optimizing the migration tool for larger database sizes, and since [2020 release wave 2](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/support-unlimited-number-production-sandbox-environments), customers can buy additional environments, for example.

* Configuring the cloud environment will have no impact on any users or data in your on-premises solution.

To begin configuring the connection, navigate to the assisted setup page and launch the **Set up Cloud Migration** assisted setup guide.  

> [!TIP]
> If you are using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, the same setup guide is also available in your on-premises solution. You will automatically be redirected to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online to continue the configuration process.

## Adding a tenant to an existing runtime service, or updating companies

There are some scenarios where it will be necessary for you to run the cloud migration setup wizard more than once.  

One example is if you want to change the companies you replicate data for. If the companies in your on-premises solution have changed, either added or deleted, or you want to change the companies to migrate, run the assisted setup wizard again. Alternatively, choose the additional companies in the **Cloud Migration Management** page.  

Another example is that if you are a hosting partner and want to add tenants to your existing runtime service.  

In both examples, you will be making updates to an existing runtime service. When you get to the point of the wizard where you can specify an existing runtime services name, open the Microsoft Integration Runtime Service Manager and enter the runtime name in the field in the wizard; you will not be allowed to copy/paste. The runtime service will identify that you are making updates to an existing service and will not create a new one.  

Complete the steps in the wizard to update the runtime service. If the change was related to adding tenants to an existing service, a new data pipeline will be created for that tenant. Changing your migration schedule or regenerating an Azure Data Factory (ADF) key may be done using the **Cloud Migration Management** page in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. For more information, see [Managing the Migration to the Cloud](migration-management.md).  

## User groups and permission sets

When running as connected with an on-premises solution, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online will be read-only with few exceptions. Because the on-premises solution is your primary application for running your business, including activities such as data entry, tax reporting, and sending invoices, these tasks must be completed in the on-premises solution. We limit the amount of data that you can enter in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online to data that is not migrated. Otherwise any data that was written to the tenant database would be continuously overwritten during the migration process.  

To make setting up this read-only tenant more efficient, we created the *Intelligent Cloud* user group and the *Intelligent Cloud* permission set. Once the cloud migration environment is configured, all users without SUPER permissions will be automatically assigned to the *Intelligent Cloud* user group. Only users with SUPER permissions will be allowed to make modifications to the system at this point.  

> [!NOTE]  
> Before you configure a connection from on-premises to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, make sure that at least one user in each company is assigned SUPER permissions.  

Users that are reassigned to the *Intelligent Cloud* user group will have access to read ALL data by default. If you need to further restrict what data a user should be able to read, the SUPER user may create new user groups and permissions sets and assign users accordingly. It is highly recommended to create any new permissions sets from a copy of the *Intelligent Cloud* permission set and then take away permissions you do not want users to have.  

> [!WARNING]
> If you grant insert, modify or delete permissions to any resource in the application that was set to read-only, it could have a negative impact on the data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. If this occurs, you may have to clear all your data and rerun a full migration to correct this.  

### Extensions

It is highly recommended that you test the impact of any extension in a sandbox environment before having it installed in your production environment in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online to help avoid any data failures or untended consequences.  

## See also

[Running the Cloud Migration Tool](migration-tool.md)  
[Managing the Migration to the Cloud](migration-management.md)  
[FAQ about Migrating to the Cloud from On-Premises Solutions](faq-migrate-data.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[Managing your online environment](./migration-management.md)  
[Managing Capacity](tenant-admin-center-capacity.md)  
