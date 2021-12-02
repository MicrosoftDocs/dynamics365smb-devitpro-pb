---
title: "Single-Tenant Full Upgrade Quick Reference"
description: Get an overview of the steps required to upgrade from one version of Business Central on-premises to the next.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
# Business Central Single-Tenant Full Upgrade Quick Reference

This article provides an overview of the full upgrade process for Business Central in a single-tenant deployment. For more detailed steps, see [Upgrading the Data: Single-Tenant Mode](upgrading-the-data.md).

## Prerequisite tasks on old database
 
|Step|More info| Done |
|----|-----------|--|
|Upgrade application code.|[See...](transition-from-codeunit1.md)||
|Convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Export permissions and permission sets.<br />**Important:** Make sure your computer uses the same codepage as the data.|[See...](How-to--Import-Export-Permission-Sets-Permissions.md)||
|Export encryption keys from the old deployment.|[See...](how-to-export-and-import-encryption-keys.md)||
|Prepare for transitioning from codeunit 1.<br />**Note:** Dynamics NAV upgrade only|[See...](transition-from-codeunit1.md)|
|Install Business Central components.|[See...](../deployment/install-using-setup.md)||

## Prepare the old database for data upgrade

|Step|More info| Done |
|----|-----------|--|
|Backup the database.|[See...](/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server)||
|Uninstall all extensions.|[See...](../developer/devenv-unpublish-and-uninstall-extension-v2.md)|
|Upload a [!INCLUDE[prod_short_md](../developer/includes/prod_short.md)] partner license.|[See...](../cside/cside-upload-license-file.md)||
|Delete all objects except tables.<br /> **Important** Do not synchronize schema at this point.|[See...](upgrading-the-data.md#DeleteObjects)||
|Clear server instance and debugger breakpoint tables.|[See...](upgrading-the-data.md#ClearServer)||

## Run the data upgrade

|Step|More info| Done |
|----|-----------|--|
|Open [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an administrator||
|Connect to and convert the database.|[See...](../cside/cside-open-database.md)|
|Import upgraded application and upgrade toolkit objects (.fob files).<br />**Important:** Select to synchronize **later**.|[See...](../cside/cside-import-objects.md)||
|Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted  database.|[See...](../administration/connect-server-to-database.md)||
|Compile all objects.<br />**Important:** Choose to synchronize schema **later**.|[See...](../cside/cside-compiling-objects.md)||
|Increase the application version of the database,<br />**Note:** Dynamics NAV 2018 upgrade only|[See...](/powershell/module/microsoft.dynamics.nav.management/set-navapplication)|
|Synchronize the database.|[See...](../administration/synchronize-tenant-database-and-application-database.md)||
|Run the data upgrade.|[See...](/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade)||
|Update Javascipt control add-ins the data upgrade.|[See...](Converting-a-Database.md#JSaddins)||

## Publish, upgrade, and install extensions

|Step|More info| Done |
|----|-----------|--|
|Publish system and test symbols, generate application symbols.|[See...](upgrading-the-data.md#AddExtensions)|
|Publish, synchronize, and upgrade to new versions of Microsoft extensions from installation media.|''||
|Repair, synchronize, and install old extension versions that were not upgraded in previous step.|''||
|Run the data upgrade on the new extension versions.|''||
|Repair other custom extensions to work on new platform.|''||

## Post-upgrade tasks

|Step|More info| Done |
|----|-----------|--|
|Import permissions and permission sets.|[See...](How-to--Import-Export-Permission-Sets-Permissions.md)||
|Import encryption keys|[See...](how-to-export-and-import-encryption-keys.md)||
|Upload the customer license. |[See...](../cside/cside-upload-license-file.md)||