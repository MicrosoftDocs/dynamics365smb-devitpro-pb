---
title: "Technical Upgrade Quick Reference"
ms.custom: na
ms.date: 15/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics365-business-central"
author: jswymer
---
# Business Central Technical Upgrade Quick Reference 

This article provides an overview of the technical upgrade process for Business Central. For more detailed steps, see [Converting a Database](Converting-a-database.md).



## Prerequisites

|Step|More info| Done |
|----|-----------|--|
|Convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Prepare for transitioning from codeunit 1.|[See...](transition-from-codeunit1.md)|

## Prepare the old application database

|Step|More info| Done |
|----|-----------|--|
|Backup the database(s).|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)||
|(Single-tenant mode only) Uninstall all extensions.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp)||
|Ensure all objects are complied, unlocked, and tables are synchronized.|[See...](../cside/cside-compiling-objects.md)||
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license.|[See...](../cside/cside-upload-license-file.md)||
|(Multitenant mode only) Dismount the tenant|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant?view=dynamicsnav-ps-2018)||
|Stop the Dynamics NAV Server Instance|||
|Clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in SQL Server.|[See...](converting-a-database.md#clearsql)||

## Run the technical upgrade

|Step|More info| Done |
|----|-----------|--|
|Install [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)]. |[See...](../deployment/install-using-setup.md)|
|Open and convert the application database using [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].|[See...](../cside/cside-open-database.md)||
|Add custom control add-ins to the server instance.|[See...](converting-a-database.md#controladdins)||
|Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted application database.|[See...](../administration/connect-server-to-database.md)||
|Connect [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the server instance.|[See...](../cside/cside-change-server-instance.md)||
|Import codeunit 1 replacement.|[See...](codeunit1-replacement.md)||
|Compile all objects. **Important:** Choose to synchronize schema **later**)|[See...](../cside/cside-compiling-objects.md)||
|Fix compilation errors.|[See...](converting-a-database.md#fixerrors)||
|Repair published V2 extensions.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp)||
|(Multitenant mode only) Mount the tenant database. |[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/mount-navtenant)||
|Synchronize the tenant/database. |[See...](../administration/synchronize-tenant-database-and-application-database.md)||

<!--
## Upgrade V2 Extensions on Tenant

|Step|More info| Done |
|----|-----------|--|

|Publish the new Microsoft-provided V2 extensions that replace V1 extensions.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp)|
|Synchronize the new V2 extensions with the database.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp)|
|Run a data upgrade on each new V2 extension.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade)|

-->

## Post-upgrade tasks 
|Step|More info| Done |
|----|-----------|--|
|(Single-tenant mode only) Install the V2 extensions previously uninstalled.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp)|
|Transition custom code from old codeunit 1 to management codeunits.|[See...](transition-from-codeunit1.md)||
|Configure pages and reports included in the MenuSuite to be searchable in the Web client |[See...](upgrade-pages-report-for-search.md) ||
|Upload customer license. |[See...](../cside/cside-upload-license-file.md)||