---
title: "Multitenant Technical Upgrade Quick Reference"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
# Business Central Multitenant Full Upgrade Quick Reference

This article provides an overview of the full upgrade process for Business Central in a multitenant deployment. For more detailed steps, see [Upgrading the Data: Multitenant Mode](upgrading-the-data-multitenant.md).

## Prerequisite tasks 
 
|Step|More info| Done |
|----|-----------|--|
|In the old deployment, convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Export permissions and permission sets from the old deployment. **Important:** Make sure computer uses the same codepage as the data.|[See...](How-to--Import-Export-Permission-Sets-Permissions.md)||
|Export encryption keys from the old deployment.|[See...](how-to-export-and-import-encryption-keys.md)||
|Prepare for transitioning from codeunit 1.|[See...](transition-from-codeunit1.md)|
|Install Business Central components.|[See...](../deployment/install-using-setup.md)||

## Upgrade the application and prepare it for data upgrade

|Step|More info| Done |
|----|-----------|--|
|Upgrade the application code.|[See...](upgrading-the-application-code.md)|
|Mount the upgraded application on the [!INCLUDE[server](../developer/includes/server.md)] instance.|[See...](/powershell/module/microsoft.dynamics.nav.management/mount-navapplication)||
|Import upgrade toolkit (.fob)|[See...](../cside/cside-import-objects.md)||
|Publish system and test symbols from the installation media, and generate application symbols.|[See...](upgrading-the-application-code.md#AddExtensions)|
|Publish the new Microsoft extension versions from the installation media.|[See...](upgrading-the-application-code.md#PublishNew)||
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license.|[See...](../cside/cside-upload-license-file.md)||

## Prepare the tenant database for data upgrade

|Step|More info| Done |
|----|-----------|--|
|Backup the tenant database.|[See...](https://go.microsoft.com/fwlink/?LinkID=296465)||
|Uninstall all V1 extensions.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp)||
|Dismount the tenant from the old server instance.|[See...](/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant)||

## Run the data upgrade on the tenant

|Step|More info| Done |
|----|-----------|--|
|Mount the tenant on the [!INCLUDE[server](../developer/includes/server.md)] instance. **Important:** Use the `-AllowAppDatabaseWrite` parameter.|[See...](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant)|
|Synchronize the tenant.|[See...](../administration/synchronize-tenant-database-and-application-database.md)||
|Synchronize all extensions.|[See..](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp)||
|Run the data upgrade. **Important:** If there are V2 extensions, you must use  the `-FunctionExecutionMode Serial` parameter.|[See...](/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade)||
|Install the new V2 extensions that were not installed in the old tenant.|[See...](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp)|


## Post-upgrade tasks 
|Step|More info| Done |
|----|-----------|--|
|Import permissions and permission sets.|[See...](How-to--Import-Export-Permission-Sets-Permissions.md)||
|Import encryption keys|[See...](how-to-export-and-import-encryption-keys.md)||
|Upload the customer license. |[See...](../cside/cside-upload-license-file.md)||