---
title: "Upgrade paths to Business Central"
description: Provides an overview of the different upgrade paths for Business Central
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---

# Supported Upgrade Paths to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Releases

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] is available in several release versions. You can upgrade an existing Dynamics NAV or Business Central solution to any of these releases. Depending on your solution's current version, it might not be possible to upgrade directly to a particular release. You might have to upgrade indirectly through an intermediate release, before upgrading to the target release.  

<!--

Whether you can upgrade directly to a release will depend on the source version. For some targets, there's an indirect path through an intermediate version. The path that you must take to upgrade to the new Oracle Database 11g release depends on the release number of your current database. It might not be possible to directly upgrade from your current release of Oracle Database to the latest release. Depending on your current release, you might be required to upgrade through one or more intermediate releases to upgrade to the new Oracle Database 11g release.

-->

The following sections provide the supported upgrade paths to the different [!INCLUDE[prod_short](../developer/includes/prod_short.md)] releases.

> [!NOTE]
> Minor updates are regularly made available for the major releases. Make sure you upgrade to an update of the release version that is compatible with your source source version. Otherwise, you might encounter problems upgrading the application. For more information, see [Dynamics 365 Business Central Upgrade Compatibility Matrix](./upgrade-v14-v15-compatibility.md?branch=2020rw1-upgrade).

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] October 2018 (v13)

|  Source version  |  Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li></ul>|Direct|

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 (v14)

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Direct|


## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2019 Release Wave 2 (v15) 

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li></ul>|Direct |

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 Release Wave 1 (v16) 

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14)</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] (v15)</li></ul>|Direct|


## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 Release Wave 2 (v17) 

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14)</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] (v15)</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] (v16)</li></ul>|Direct|
  
## See Also

[Upgrading to Business Central Spring 2019](upgrading-to-business-central-on-premises.md)  
[Upgrading to Business Central 2019 release Wave 2](upgrade-overview-v15.md)  
[Upgrading to Business Central 2020 release Wave 1](upgrade-overview-v16.md)  
[Migrating On-Premises Data to Business Central Online](../administration/migrate-data.md)