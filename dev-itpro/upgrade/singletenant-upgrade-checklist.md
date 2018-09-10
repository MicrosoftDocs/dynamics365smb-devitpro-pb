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

This article provides an overview of the full upgrade process for Business Central in a multitenant deployment. For more detailed steps, see [Converting a Database](Converting-a-database.md).

## Pre-upgrade tasks 
 
|Step|More info| Done |
|----|-----------|--|
|In the old environment, convert custom V1 extensions to V2 extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Export permissions and permission sets from the old environment. **Important:** Make sure your computer uses the same codepage as the data.|||
|Export encryption keys from the old environment.|||
|Prepare for transitioning from codeunit 1.|[See...](transition-from-codeunit1.md)|
|Install Business Central components.|||

## Prepare the database for data upgrade

|Step|More info| Done |
|----|-----------|--|
|Backup the database.|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)||
|Uninstall all extensions.|[See...](transition-from-codeunit1.md)|
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license.|[See...](../cside/cside-upload-licence-file.md)||
|Delete all objects except tables from the old database|||
|Clear Dynamics NAV Server instance and debugger breakpoint records from old database|||

## Run the data upgrade

|Step|More info| Done |
|----|-----------|--|
|Open and convert the database using [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] .|[See...](../cside/cside-open-database.md)|
|Import upgraded application and upgrade toolkit objects (.fob files). **IMPORTANT** Select to synchroinize **later**.|||
|Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted  database.|[See...](../administration/connect-server-to-database.md)||
|Connect [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the server instance.|[See...](../cside/cside-change-server-instance.md)||
|Compile all objects. **Important:** Choose to synchronize schema **later**)|[See...](../cside/cside-compiling-objects.md)||
|Synchronize the database.|||
|Run the data upgrade.|||

## Post-upgrade tasks
|Transition custom code that used codeunit 1 to use the management codeunits.|[See...](transition-from-codeunit1.md)||
|Import encryption keys|||
|Import permissions and permission sets|||
|Configure pages and reports included in the MenuSuite to be searchable in the Web client. |[See...](upgrade-pages-report-for-search.md) ||
|Add custom control add-ins to the server instance.|[See...](converting-a-database.md#controladdins)||
|Upload the customer license. |[See...](../cside/cside-upload-licence-file.md)||

## Publish and install/upgrade extensions
|Publish system and test symbols, generate application symbols.|[See...](transition-from-codeunit1.md)|
|Publish new versions of Microsoft extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Publish new versions of Microsoft extensions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Synchronize new extension versions.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Run the data upgrade on the new extension versions.|||
|Repair custome extensions to work on new platform.|[See...](../developer/devenv-upgrade-v1-to-v2-overview.md)||
|Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license.|[See...](../cside/cside-upload-licence-file.md)||
