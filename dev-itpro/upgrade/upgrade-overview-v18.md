---
title: "Upgrade to Business Central 2020 Wave 2"
description: Provides an overview of Business Central 2021 release wave 1 upgrade
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
# Upgrading to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] 2021 Release Wave 1

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (version 18) is the fourth major release that is fully AL-based. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2019 release wave 2 (version 15) marked the release in which C/AL was replaced by AL. The classic development environment, known as C/SIDE, was deprecated. From an application perspective, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is now extension-based only. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] base application is delivered as an AL extension. Also, application functionality that isn't related to the business logic has been moved into separate modules. These modules are combined into an extension known as the System Application. This change will influence how you do the upgrade compared to earlier releases.

## Upgrade path

Depending on your current version, a direct upgrade to version 18 isn't always possible. You may have to first upgrade to an intermediate version. The following table describes the upgrade paths for supported versions:

|  Source version  |  Path  |Comment|
|------------|--------------|---|
|<ul><li> [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)] (version 8)</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)] (version 9)</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)] (version 10)</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] (version 11)</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] October 2018 (version 13)</li></ul>|<ol><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 (version 14)</li><li>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (version 18)</li></ol>|This path requires you convert your application from C/AL to AL.|
|<ul><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 (version 14)</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2019 Release Wave 2 (version 15)</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 1 (version 16)</li><li> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 (version 17)</li></ul>|Direct to version 18|

Your current version doesn't have to be the latest update for the version. However, for intermediate versions, use to the latest available update.


## <a name="upgradepath"></a>Upgrade overview

When upgrading your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 (version 14) solution to version 18, the goal is to move towards a full uptake of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] base and system applications, as they are, and migrating code customizations to add-on extensions. There are different upgrade levels that you follow to get to this state, as illustrated in the following figure. We recommend that you refactor to the system application as a minimum.

![Upgrade path on Business Central application](../developer/media/bc18-upgrade-paths-v1.png "Upgrade paths")

### Technical Upgrade

Although it's recommend to refactor to the system application as a minimum, you can do a technical upgrade only. A technical upgrade changes the database so that it works on the latest Business Central platform. The conversion updates the system tables of the old database to the new schema (data structure). It provides you with the latest platform features and performance enhancements.

When upgrading from version 14, part of the technical upgrade process includes converting your customized base application from C/AL to AL.

## New and changed features

There are several new and changed platform and application features available in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1. These changes affect users, administrators, and developers. For an overview of these features, see [Overview of Dynamics 365 Business Central 2021 release wave 1](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/).

To take advantage of these features, you'll have to do an application code upgrade, not just a technical (platform) upgrade. 

## Deprecated features

Before you upgrade, review the following articles to get an overview of features deprecated in this release:

- [Deprecated Tables](/dynamics365/business-central/dev-itpro/upgrade/deprecated-tables)

- [Deprecated Features in W1](/dynamics365/business-central/dev-itpro/upgrade/deprecated-features-w1)

  From this article, use the links in the table of content to view deprecated features specific to local versions

## Migrating from on-premises to online

For information about migrating an on-premises solution to online, see [Migrate to Business Central Online from Business Central On-premises](/dynamics365/business-central/dev-itpro/administration/migrate-business-central-on-premises).


## See Also  
 
[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[[!INCLUDE[prod_long](../developer/includes/prod_long.md)] Upgrade Compatibility Matrix](upgrade-v14-v15-compatibility.md)  
