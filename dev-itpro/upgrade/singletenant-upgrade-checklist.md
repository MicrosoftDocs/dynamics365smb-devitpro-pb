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

This article provides an overview of the full upgrade process for Business Central in a single-tenant deployment. For more detailed steps, see [Upgrading the Data: Single-Tenant Mode](upgrading-the-data.md).

## Prerequisite tasks 
 
|Step|More info| Done |
|----|-----------|--|
|In the old deployment, convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Export permissions and permission sets from the old deployment. **Important:** Make sure your computer uses the same codepage as the data.|[See...](How-to--Import-Export-Permission-Sets-Permissions.md)||
|Export encryption keys from the old deployment.|[See...](how-to-export-and-import-encryption-keys.md)||
|Prepare for transitioning from codeunit 1.|[See...](transition-from-codeunit1.md)|
|Install Business Central components.|[See...](../deployment/install-using-setup.md)||

## Prepare the old database for data upgrade

|Step|More info| Done |
|----|-----------|--|
|Backup the database.|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)||
|Uninstall all extensions.|[See...](../developer/devenv-unpublish-and-uninstall-extension-v2.md)|
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license.|[See...](../cside/cside-upload-licencs-file.md)||
|Delete all objects except tables from the old database|[See...](upgrading-the-data.md#DeleteObjects)||
|Clear Dynamics NAV Server instance and debugger breakpoint records from old database.|[See...](upgrading-the-data.md#ClearServer)||

## Run the data upgrade

|Step|More info| Done |
|----|-----------|--|
|Open and convert the database using [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].|[See...](../cside/cside-open-database.md)|
|Import upgraded application and upgrade toolkit objects (.fob files). **Important:** Select to synchroinize **later**.|[See...](../cside/cside-import-objects.md)||
|Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted  database.|[See...](../administration/connect-server-to-database.md)||
|Compile all objects. **Important:** Choose to synchronize schema **later**)|[See...](../cside/cside-compiling-objects.md)||
|Increase the application version of the database.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navapplication)|
|Synchronize the database.|[See...](../administration/synchronize-tenant-database-and-application-database.md)||
|Run the data upgrade.|[See...](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade)||

## Post-upgrade tasks
|Step|More info| Done |
|----|-----------|--|
|Transition custom code that used codeunit 1 to use the management codeunits.|[See...](transition-from-codeunit1.md)||
|Import permissions and permission sets.|[See...](How-to--Import-Export-Permission-Sets-Permissions.md)||
|Import encryption keys|[See...](how-to-export-and-import-encryption-keys.md)||
|Configure pages and reports included in the MenuSuite to be searchable in the Web client. |[See...](upgrade-pages-report-for-search.md) ||
|Add custom control add-ins to the server instance.|[See...](converting-a-database.md#controladdins)||
|Upload the customer license. |[See...](../cside/cside-upload-licencs-file.md)||

## Publish, upgrade, and install extensions

|Step|More info| Done |
|----|-----------|--|
|Publish system and test symbols, generate application symbols.|[See...](upgrading-the-data.md#AddExtensions)|
|Publish, synchronize, and upgrade to new versions of Microsoft extensions from installation media.|''||
|Repair, synchronize, and install old extension versions that were not upgraded in previous step.|''||
|Run the data upgrade on the new extension versions.|''||
|Repair custom extensions to work on new platform.|''||
|Unpublish unwanted extensions versions.|''||
