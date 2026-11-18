---
title: Dynamics SL Migration Prerequisites for Business Central
description: Check Dynamics SL source database, SQL Server, Business Central permissions, migration apps, and integration runtime requirements before cloud migration.
author: lcontreras 
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: article
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Cloud migration prerequisites for Dynamics SL

This article outlines requirements on the [!INCLUDE [dyn_sl_prod](../includes/dyn_sl_prod.md)] on-premises and online environments for cloud migration. Review this information before you start the cloud migration.

## Destination online environment

- The customer has a [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant.

- At least one user has the **SUPER** permission set in the target company in [!INCLUDE [prod_short](../includes/prod_short.md)] online.

  Dynamics SL migration retains existing Business Central user permissions. Users aren't automatically reassigned to the **Intelligent Cloud** permission set. Review access and restrict data entry in the target companies until migration is complete. Learn more in [Working with environments during cloud migration](migrate-sl-overview.md#working-with-environments-during-cloud-migration).

  If you set up and run cloud migration, you must have the **SUPER** permission set. If you're running cloud migration as a delegated administrator, a licensed Business Central user with **SUPER** must grant consent. Learn more in [About delegated administrators](migration-setup-sl.md#about-delegated-administrators).

- Install the Business Central migration apps

  In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], open the environment that you intend to migrate your data to, and then choose the **Apps** action. Make sure that these apps have the latest updates installed:

  - Intelligent Cloud Base  
  - Dynamics SL Migration
  - Dynamics SL Migration - US (for US clients only)
  - Dynamics SL Historical Data

  > [!IMPORTANT]
  > Migrating from [!INCLUDE [dyn_sl_prod](../includes/dyn_sl_prod.md)] using the **Cloud Migration Setup** assisted setup guide is currently only supported for the following markets:
  >
  > - United States
  > - Canada
  > - United Kingdom
  > - Australia

## Source on-premises environment

- [!INCLUDE [dyn_sl_prod](../includes/dyn_sl_prod.md)] 2015 or later

  If the solution is based on an older version of the on-premises product, upgrade to the latest supported version.

- Database

  The database can be hosted on SQL Server. The SQL Server database must meet the following requirements:
  - Uses SQL Server 2016 SP1 or later.
  - Compatibility level set to 130 or higher.
  - TCP/IP is enabled. Learn more in [Enable or disable a server network protocol](/sql/database-engine/configure-windows/enable-or-disable-a-server-network-protocol) in the SQL Server documentation.
  - Configured for SQL Server authentication.

    > [!IMPORTANT]
    > The login account used for SQL Server authentication must have the **sysadmin** role at the server level and the **db_owner** role at the database level.

<a name="is-a-data-upgrade-needed"></a>
### Choose a SQL Server edition

A cloud migration can be performed either on a live system or from a backup. 
 
- For a migration from a live system, use a SQL Server edition licensed for production workloads. If you're running your [!INCLUDE [dyn_sl_prod](../includes/dyn_sl_prod.md)] production environment on SQL Server 2014 or earlier, upgrade SQL Server before starting your cloud migration project.

- For a migration from a backup, restore the SL databases to a SQL Server instance that meets the migration prerequisites. Choose an edition licensed for the intended workload. SQL Server Developer edition is licensed for development and testing, not production. Don't assume that using an instance only as a migration source makes it eligible for Developer edition. Learn more in [Editions and supported features of SQL Server 2022](/sql/sql-server/editions-and-components-of-sql-server-2022).

### Prepare the SL databases

Before setting up cloud migration, load the Business Central migration procedures and enable change tracking on the SL application database.

1. Make sure that you have restorable backups of both the SL system database and the SL application database.
1. Download the [SL database preparation scripts](https://github.com/microsoft/BCTech/tree/master/samples/DynamicsSLMigrationTools/Analysis%20and%20Repair%20Tool/SL%20to%20BC%20Migration%20Database%20Preparation%20SQL%20Scripts) and run `1-Create BC Migration Procedures.sql` against the SL application database.
1. Run `2-Enable Change Tracking on SL Database.sql` against the same application database.

The script readme also describes how SL 2018 can prepare the database through **Database Maintenance**. Learn more in [SL database preparation instructions](https://github.com/microsoft/BCTech/blob/master/samples/DynamicsSLMigrationTools/Analysis%20and%20Repair%20Tool/SL%20to%20BC%20Migration%20Database%20Preparation%20SQL%20Scripts/Read%20Me%20SL%20to%20BC%20Migration%20Database%20Preparation%20SQL%20Scripts.txt).

<a name="other"></a>
## Integration runtime requirements

- Self-hosted integration runtime machine

   The computer that hosts the runtime must meet the requirements in [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime?tabs=data-factory#prerequisites).

## Next steps

- [Migrate Dynamics SL data to the cloud](migrate-dynamics-sl.md)
