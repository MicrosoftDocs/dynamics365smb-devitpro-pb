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
# Business Central Multitenant Full Upgrade Quick Reference 

This article provides an overview of the full upgrade process for Business Central in a multitenant deployment. For more detailed steps, see [Upgrading the Data: Multitenant Mode](upgrading-the-data-multitenant.md).

## Pre-upgrade tasks 
 
|Step|More info| Done |
|----|-----------|--|
|In the old deployment, convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Export permissions and permission sets from the old deployment. **Important:** Make sure computer uses the same codepage as the data.|||
|Export encryption keys from the old deployment.|||
|Get the app packages for V2 extension versions currently published on the old deployment.|||
|Prepare for transitioning from codeunit 1.|[See...](transition-from-codeunit1.md)|
|Install Business Central components.|||

## Upgrade the application and prepare for data upgrade

|Step|More info| Done |
|----|-----------|--|
|Upgrade the application code.|[See...](upgrading-the-application-code.md)|
|Mount the upgraded application on the [!INCLUDE[server](../developer/includes/server.md)] instance.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/mount-navapplication)||
|Import upgrade toolkit (.fob)|||
|Publish system and test symbols from the installation media, and generate application symbols.|[See...](transition-from-codeunit1.md)|
|Publish new versions of V2 extensions and any old versions that were published in the old environment.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license.|[See...](../cside/cside-upload-licence-file.md)||

## Prepare the tenant database

|Step|More info| Done |
|----|-----------|--|
|Backup the tenant database.|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)||
|Uninstall all V1 extensions.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp)||
|Dismount the tenant from the old server instance.|[See...](../cside/cside-compiling-objects.md)||

## Run the data upgrade on the tenant

|Step|More info| Done |
|----|-----------|--|
|Mount the tenant on the [!INCLUDE[server](../developer/includes/server.md)] instance. **Important:** Use the `-AllowAppDatabaseWrite` parameter.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)|
|Synchronize the tenant.|||
|Synchronize all V2 extensions.|||
|Run the data upgrade. **Important:** Use the `-FunctionExecutionMode Serial` parameter.  |||
|Install the new V2 extensions that were not installed in the old tenant.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp)|


## Post-upgrade tasks 
|Step|More info| Done |
|----|-----------|--|
|Transition custom code that used codeunit 1 to use the management codeunits.|[See...](transition-from-codeunit1.md)||
|Import encryption keys|||
|Import permissions and permission sets|||
|Configure pages and reports included in the MenuSuite to be searchable in the Web client. |[See...](upgrade-pages-report-for-search.md) ||
|Upload the customer license. |[See...](../cside/cside-upload-licence-file.md)||