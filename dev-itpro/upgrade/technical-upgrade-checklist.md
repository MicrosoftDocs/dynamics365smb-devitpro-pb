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

## Prepare the old application database

|Step|More info| Done |
|----|-----------|--|
|Convert V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Backup the database(s).|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)|
|(Single tenant only) Uninstall all extensions.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp)||
|Ensure all objects are complied, unlocked, and tables are synchronized.|[See...](converting-a-database.md#compilesync)||
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] license.|[See...](../cside/cside-upload-licence-file.md)||
|(Multitenant mode only) Dismount the tenant|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant?view=dynamicsnav-ps-2018)||
|Clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in SQL Server.|[See...](converting-a-database.md#clearsql)||


## Run the technical upgrade

|Step|More info| Done |
|----|-----------|--|
|Install [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] (Server, SQL Database Components, [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] minimum).|[See...](../deployment/install-using-setup.md)|
|Open and convert the application database using [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].|[See...](converting-a-database.md#convertdb)||
|Add custom control add-ins to the server instance.|[See...](converting-a-database.md#controladdins)||
|Connect converted database to a [!INCLUDE[server](../developer/includes/server.md)] instance|[See...](../administration/connect-server-to-database.md)||
|Connect [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the application database and compile all objects. **Important:** Choose to synchronize schema later)|[See...](../cside/cside-compiling-objects.md)||
|Import codeunit 1 replacement|[See...](codeunit1-replacement.md)|
|Fix errors.|[See...](converting-a-database.md#fixerrors)||
|Repair V2 extensions.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp)||
|(Single tenant mode only) Install the V2 extensions previously uninstalled.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp)|
|(Multitenant mode only) Mount the tenant database. |[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/mount-navtenant)||
|Synchronize the tenant/database. |[See...](../administration/synchronize-tenant-database-and-application-database.md)||
|Upload customer license. |[See...](../cside/cside-upload-licence-file.md)||
