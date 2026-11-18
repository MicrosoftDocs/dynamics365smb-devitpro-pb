---
title: Business Central Cloud Migration Prerequisites
description: Review the requirements for Business Central on-premises and online environments, migration apps, SQL databases, and integration runtime before migration.
author: jswymer 
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: concept-article
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---
# Cloud migration prerequisites for Business Central

This article outlines requirements on the Business Central on-premises and online environments for cloud migration. Review this information before you start the cloud migration. 

## Destination online environment requirements

- Customer has a [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant  

- At least one user has *SUPER* permissions in the target company in [!INCLUDE [prod_short](../includes/prod_short.md)] online.

  Unless you choose to retain existing user permissions, users who don't have **SUPER** permissions are automatically assigned to the **Intelligent Cloud** permission set, which limits them to read-only access to data. Users with **SUPER** permissions retain write access to the target company. Learn more in [Working with environments during cloud migration](migrate-business-central-on-premises.md#working-with-environments-during-cloud-migration).

  If you're the person setting up and running the cloud migration, you must have *SUPER* permissions in Business Central and admin role in Microsoft admin center. If you'll be running cloud migration as a delegated admin, a Business Central user with *SUPER* permissions has to grant you permission. The permission is granted when you try to run the **Cloud Migration Setup**. Learn more in [About delegated administrators](migration-setup.md#about-delegated-administrators).

- Install the Business Central migration apps 

  In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], open the environment that you intend to migrate your data to, and then choose the **Apps** action. Make sure that these apps have the latest updates installed:

  - Intelligent Cloud Base  
  - Business Central Intelligent Cloud  

  > [!IMPORTANT]
  > In [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, install, publish, or upgrade the **Intelligent Cloud Base** extension first, and then the product-specific extension or extensions.

  If you're migrating from an earlier supported version of [!INCLUDE [prod_short](../includes/prod_short.md)], you must also make sure that the following apps are updated:

  - Business Central Cloud Migration – Previous Release  
  - Business Central Cloud Migration – Previous Release [code for your country-specific version]  <!-- what does this mean-->

  After upgrading the on-premises source, make sure that the `applicationVersion` field in the `ndo$tenantdatabaseproperty` table is set to the upgraded version. If the field is blank, or if it's set to an older version than the migration tool supports, the migration can't run. Learn more in [Change the application version in the database](../upgrade/upgrade-unmodified-application-to-v25.md#task-14-change-application-version).

<!--
  If you're migrating from Dynamics GP, make sure that the following apps are installed and updated:

  * Dynamics GP Intelligent Cloud  
  * Dynamics GP History SmartLists  

  > [!IMPORTANT]
  > Migrating from Dynamics GP using the **Cloud Migration Setup** assisted setup guide is currently only supported for the following markets:  
  >
  > * United States
  > * Canada
  > * United Kingdom
  > * Australia

  If you want to migrate from another product, check the marketplace for an app to help.
-->

- Install customization extensions

  If the on-premises database includes data owned by an extension, and you want the data migrated, then install the extension on the online tenant. Also, make sure that each extension includes at least one permission set that gives access to its data.

## Source on-premises environment requirements

- Business Central version 25.0 or later

  If your solution uses an older version, upgrade to at least version 25.0 before you migrate to Business Central online. Learn more about supported migration paths in [Migrate on-premises data to Business Central online](migrate-data.md#supported-migration-paths).

  > [!IMPORTANT]
  > During upgrade, change the application version in the database to match the upgraded version. Learn more in [Change the application version in the database](../upgrade/upgrade-unmodified-application-to-v25.md#task-14-change-application-version).

  If this requirement isn't met, the cloud migration fails to run properly. Learn more in [Troubleshooting cloud migration](migration-troubleshooting.md#product-version).
- Database

  The database can be hosted on SQL Server or Azure SQL Database.  

  An SQL Server database must meet the following requirements:
  - Uses SQL Server 2016 SP1 or later
  - Compatibility level set to 130 or higher
  - TCP/IP is enabled. Learn more in [Enable or Disable a Server Network Protocol](/sql/database-engine/configure-windows/enable-or-disable-a-server-network-protocol) in the SQL Server documentation. 
  - Configured for SQL Server authentication.

    > [!IMPORTANT]
    > The login account used for SQL server authentication must have the **sysadmin** role on the server level and **db_owner** role on the database level.

    Learn more in [Configure SQL Server authentication on the database](configure-sql-server-authentication.md#configure-sql-server-authentication-on-the-database-in-sql-server).
<!--

  Although it's required, we recommend deploying the database on Azure SQL Database, especially if the customer wants to migrate large amounts of data.

  > [!IMPORTANT]
  > Azure SQL Managed Instance isn't supported.  

<!-- * Statistics updated and indexes reorganized on all tables on the source database  
  
    This prerequisite will ensure that the migration runs as fast as possible. Learn more in the documentation for [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).-->

## Integration runtime requirements

- Self-hosted integration runtime machine for a source database hosted on SQL Server, not Azure SQL Database

   The computer from which you'll run the cloud migration and self-hosted integration runtime should meet the requirements described at [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime?tabs=data-factory#prerequisites).

## Next steps

- [Optimizing cloud migration performance](migration-optimize-replication.md)  
