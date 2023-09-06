---
title: Cloud migration prerequisites for Business Central
description: This article outlines requirements on the Business Central on-premises and online environments for cloud migration. Review this information before you start the cloud migration. 
author: jswymer 
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 01/16/2023
ms.custom: bap-template
---
# Cloud migration prerequisites for Business Central

This article outlines requirements on the Business Central on-premises and online environments for cloud migration. Review this information before you start the cloud migration. 

## Destination online environment

- Customer has a [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant  

- At least one user has *SUPER* permissions in the target company in [!INCLUDE [prod_short](../includes/prod_short.md)] online.

  Users assigned with *SUPER* permissions are the only users who can make changes in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online target company. Users who don't have *SUPER* permissions are automatically reassigned to the intelligent cloud user group, which limits them to read-only access to data. For more information, see [Working with environments during cloud migration](migrate-business-central-on-premises.md#working-with-environments-during-cloud-migration). 

  If you're the person setting up and running the cloud migration, you must have *SUPER* permissions in Business Central and admin role in Microsoft admin center. If you'll be running cloud migration as a delegated admin, a Business Central user with *SUPER* permissions has to grant you permission. The permission is granted when you try to run the **Cloud Migration Setup**. For more information, see [About delegated administrators](migration-setup.md#about-delegated-administrators).

- Install the Business Central migration apps 

  In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], open the environment that you intend to migrate your data to, and then choose the **Apps** action. Make sure that these apps have the latest updates installed:

  - Intelligent Cloud Base  
  - Business Central Intelligent Cloud  

  > [!IMPORTANT]
  > In [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, install, publish, or upgrade the **Intelligent Cloud Base** extension first, and then the product-specific extension or extensions.

  If you're migrating from an earlier supported version of [!INCLUDE [prod_short](../includes/prod_short.md)], you must also make sure that the following apps are updated:

  - Business Central Cloud Migration – Previous Release  
  - Business Central Cloud Migration – Previous Release [code for your country-specific version]  <!-- what does this mean-->

  Also, at the end of the upgrade, you must make sure that the `applicationVersion` field in the `ndo$tenantdatabaseproperty` table is set to the right version. If the field is blank, or if it's set to an older version than the migration tool supports, the migration can't run. For more information, see [Post-upgrade tasks](../upgrade/upgrade-unmodified-application-v14-v21.md#post-upgrade-tasks).  

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

  If the on-premises database includes data owned by an extension, and you want the data migrated, then install the extension on the online tenant. Also, make sure that each extension includes at least one permission set the gives at access.

## Source on-premises environment

- Business Central version is a supported migration path.

  If the solution is based on an older version of the on-premises product, upgrade to [supported version](migrate-data.md#supported-migration-paths). 

- Database

  The database can be hosted on SQL Server or Azure SQL Database.  

  An SQL Server database must meet the following requirements:
  - Uses SQL Server 2016 SP1 or later
  - Compatibility level set to 130 or higher
  - TCP/IP is enabled. For more information, see [Enable or Disable a Server Network Protocol](/sql/database-engine/configure-windows/enable-or-disable-a-server-network-protocol) in the SQL Server documentation. 
  - Configured for SQL Server authentication.

    > [!IMPORTANT]
    > The login account used for SQL server authentication must have the **sysadmin** role on the server level and **db_owner** role on the database level.

    For more information, see [Configure SQL Server authentication on the database](configure-sql-server-authentication.md#configure-sql-server-authentication-on-the-database-in-sql-server).
<!--

  Although it's required, we recommend deploying the database on Azure SQL Database, especially if the customer wants to migrate large amounts of data.

  > [!IMPORTANT]
  > Azure SQL Managed Instance isn't supported.  

<!-- * Statistics updated and indexes reorganized on all tables on the source database  
  
    This prerequisite will ensure that the migration runs as fast as possible. For more information, see the documentation for [sp_updatestats (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-updatestats-transact-sql) and [Resolve index fragmentation by reorganizing or rebuilding indexes](/sql/relational-databases/indexes/reorganize-and-rebuild-indexes).-->

## Other

- Self-hosted integration runtime machine (local on-premises database only; not Azure Database Server)

   The computer from which you'll run the cloud migration and self-hosted integration runtime should meet the requirements described at [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime?tabs=data-factory#prerequisites).

## Next steps

- [Optimizing cloud migration performance](migration-optimize-replication.md)  
