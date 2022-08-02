---
title: Supported upgrade paths to Business Central on-premises
description: Provides an overview of the different upgrade paths for Business Central on-premises across versions.
author: jswymer
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.topic: conceptual
ms.author: jswymer
ms.date: 12/01/2021
---

# Supported Upgrade Paths to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Releases

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises is available in several release versions. You can upgrade an existing Dynamics NAV or Business Central solution to any of these releases. Depending on your solution's current version, it might not be possible to upgrade directly to a particular release. You might have to upgrade indirectly through an intermediate release, before upgrading to the target release.  

<!--

Whether you can upgrade directly to a release will depend on the source version. For some targets, there's an indirect path through an intermediate version. The path that you must take to upgrade to the new Oracle Database 11g release depends on the release number of your current database. It might not be possible to directly upgrade from your current release of Oracle Database to the latest release. Depending on your current release, you might be required to upgrade through one or more intermediate releases to upgrade to the new Oracle Database 11g release.

-->

The following sections provide the supported upgrade paths to the different [!INCLUDE[prod_short](../developer/includes/prod_short.md)] releases.

> [!NOTE]
> Minor updates are regularly made available for each release wave. Not all minor updates between two releases are compatible. Make sure you upgrade to a release update that's compatible with your current version. Otherwise, you might encounter problems upgrading the application. For more information, see [Dynamics 365 Business Central Upgrade Compatibility Matrix](./upgrade-v14-v15-compatibility.md?branch=2020rw1-upgrade).

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 Release Wave 1 (v20)

|  Source version  |  Path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)]</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v15</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v16</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v17</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v18</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v19</li></ul>|Direct|

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 Release Wave 2 (v19)

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v15</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v16</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v17</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v18</li></ul>|Direct|

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 Release Wave 1 (v18)

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v15</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v16</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v17</li></ul>|Direct|

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 Release Wave 2 (v17)

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v15</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v16</li></ul>|Direct|

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 Release Wave 1 (v16)

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v15</li></ul>|Direct|

[!INCLUDE [upgrade-16](../includes/upgrade-16.md)]

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2019 Release Wave 2 (v15)

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Indirect. Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14 first.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] v14</li></ul>|Direct |

[!INCLUDE [upgrade-15](../includes/upgrade-15.md)]

## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 (v14)

[!INCLUDE [upgrade-14](../includes/upgrade-14.md)]

|  Source version  |   Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] v13</li></ul>|Direct|

<!--## Upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] October 2018 (v13)

|  Source version  |  Upgrade path  |
|------------|--------------|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li></ul>|Direct|
-->
## See Also

[Upgrading to Business Central Spring 2019](upgrading-to-business-central-on-premises.md)  
[Upgrading to Business Central 2019 Release Wave 2](upgrade-overview-v15.md)  
[Upgrading to Business Central 2020 Release Wave 1](upgrade-overview-v16.md)  
[Migrate to Business Central Online from Business Central On-premises](../administration/migrate-business-central-on-premises.md)  
[Migrating On-Premises Data to Business Central Online](../administration/migrate-data.md)  

## Help us understand

We want to learn more about how people use Microsoft's [custom Help toolkit](https://github.com/microsoft/dynamics365smb-custom-help). Take the survey (in English) and help us understand: [https://forms.office.com/r/A4cUJgjkD1](https://forms.office.com/r/A4cUJgjkD1).  
