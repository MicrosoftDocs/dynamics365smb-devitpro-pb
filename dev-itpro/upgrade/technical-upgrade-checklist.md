---
title: "Technical Upgrade Quick Reference"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
# Business Central Technical Upgrade Quick Reference 

This article provides an overview of the technical upgrade process for Business Central. For more detailed steps, see [Technical Upgrade](Converting-a-database.md).



## Prerequisites

|Step|More info| Done |
|----|-----------|--|
|Convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Transitioning from codeunit 1.|[See...](transition-from-codeunit1.md)|

## Prepare the old application database

|Step|More info| Done |
|----|-----------|--|
|Backup the database(s).|[See...](/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server)||
|(Single-tenant mode only) Uninstall all extensions. (Multitenant mode) Unintsall all V1 extensions.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp)||
|(Optional) Unpublish unwanted extension versions .|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp)||
|Ensure all objects are compiled, unlocked, and tables are synchronized.|[See...](../cside/cside-compiling-objects.md)||
|Upload a [!INCLUDE[prod_short_md](../developer/includes/prod_short.md)] partner license.|[See...](../cside/cside-upload-license-file.md)||
|(Multitenant mode only) Dismount the tenant|[See...](/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant?view=dynamicsnav-ps-2018)||
|Stop the Dynamics NAV or old Business Central Server Instance|||
|Clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in SQL Server.|[See...](converting-a-database.md#clearsql)||
|Close all connections to the database.|||

## Run the technical upgrade

|Step|More info| Done |
|----|-----------|--|
|Install [!INCLUDE[prod_short_md](../developer/includes/prod_short.md)]. |[See...](../deployment/install-using-setup.md)|
|Open the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] as an administrator.|||
|Connect to and convert the application database.|[See...](../cside/cside-open-database.md)||
|Add custom control add-ins to the server instance.|[See...](converting-a-database.md#controladdins)||
|Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted application database.|[See...](../administration/connect-server-to-database.md)||
|Connect [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the server instance.|[See...](../cside/cside-change-server-instance.md)||
|Import codeunit 1 replacement.|[See...](codeunit1-replacement.md)||
|Compile all objects. **Important:** Choose to synchronize schema **later**.|[See...](../cside/cside-compiling-objects.md)||
|Fix compilation errors.|[See...](resolve-compile-errors-when-converting-dynamics-nav-2018-database.md)||
|Repair published V2 extensions.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp)||
|(Multitenant mode only) Mount the tenant database. |[See...](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant)||
|Synchronize the tenant/database. |[See...](../administration/synchronize-tenant-database-and-application-database.md)||

<!--
## Upgrade V2 Extensions on Tenant

|Step|More info| Done |
|----|-----------|--|

|Publish the new Microsoft-provided V2 extensions that replace V1 extensions.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp)|
|Synchronize the new V2 extensions with the database.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp)|
|Run a data upgrade on each new V2 extension.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade)|

-->

## Post-upgrade tasks 
|Step|More info| Done |
|----|-----------|--|
|Upgrade Javascript-based control add-ins to new versions available on [!INCLUDE[server](../developer/includes/server.md)]. |[See...](converting-a-database.md#extensions)|
|(Single-tenant mode only) Install the V2 extensions that were previously uninstalled.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp)|
|If the old database used first-party V1 extensions, publish and install the V2 extensions that replace them.<br /><br />**Important** As part of this step, make sure to publish the system and test symbols and generate application symbols.|[See...](converting-a-database.md#extensions)||
|Transition custom code from old codeunit 1 to management codeunits. (Dynamics NAV 2018 and earlier)|[See...](transition-from-codeunit1.md)||
|Configure pages and reports included in the MenuSuite to be searchable in the Web client  (Dynamics NAV 2018 and earlier)|[See...](upgrade-pages-report-for-search.md) ||
|Build object search index. |||
|Upload the customer license. |[See...](../cside/cside-upload-license-file.md)||