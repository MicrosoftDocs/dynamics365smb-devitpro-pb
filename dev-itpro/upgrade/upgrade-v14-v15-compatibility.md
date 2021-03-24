---
title: Business Central compatibility matrix
description: Provides an overview of the Business Central versions and their compatibility
ms.custom: na
ms.date: 02/06/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---

# [!INCLUDE[prod long](../developer/includes/prod_long.md)] Upgrade Compatibility Matrix

You can upgrade [!INCLUDE[prod short](../developer/includes/prod_short.md)] Spring 2019 (version 14) directly to 2019 release wave 2 (version 15) or to 2020 release wave 1 (version 16). And, of course, you can upgrade 2019 release wave 2 directly to 2020 release wave 1 (version 16). For an overview of the supported paths, see [Supported Upgrade Paths](upgrade-paths.md).

However, minor updates are regularly made available for each major release, like 14.1 or 15.2. When upgrading, it's important to target an update version that's compatible with your current version.

## Before choosing the target version

Before you choose the target version for your upgrade, read the [Some Known Issues](known-issues.md) article. This article will describe issues in [!INCLUDE[prod short](../developer/includes/prod_short.md)] versions that affect upgrade.

## Version 14 compatibility

The following table lists the Business Central 14 versions and the minimum 15, 16, 17, and 18 version that's compatible for upgrade.

|Version 14|Version 15|Version 16|Version 17|Version 18|
|----------|----------|----------|----------|----------|
|[14.0 (GA and cumulative update 01)](https://support.microsoft.com/help/4501146)|15.0|16.0|17.0|18.0|
|[14.3 (cumulative update 02)](https://support.microsoft.com/help/4514872)|15.0|16.0|17.0|18.0|
|[14.4 (cumulative update 03)](https://support.microsoft.com/help/4515445)|15.0|16.0|17.0|18.0|
|[14.5 (cumulative update 04)](https://support.microsoft.com/help/4518535)|15.0|16.0|17.0|18.0|
|[14.6 (cumulative update 05)](https://support.microsoft.com/help/4522949)|15.1|16.0|17.0|18.0|
|[14.7 (cumulative update 06)](https://support.microsoft.com/help/4528705)|15.2|16.0|17.0|18.0|
|[14.8 (cumulative update 07)](https://support.microsoft.com/help/4533396)|15.3|16.0|17.0|18.0|
|[14.9 (cumulative update 08)](https://support.microsoft.com/help/4536555)|15.3|16.0|17.0|18.0|
|[14.10 (cumulative update 09)](https://support.microsoft.com/help/4539529)|15.4|16.0|17.0|18.0|
|[14.11 (cumulative update 10)](https://support.microsoft.com/help/4538887)|15.5|16.0|17.0|18.0|
|[14.12 (cumulative update 11)](https://support.microsoft.com/help/4549677)|[15.6](https://support.microsoft.com/help/4549685)|[16.1](https://support.microsoft.com/help/4549686)|17.0|18.0|
|[14.13 (cumulative update 12)](https://support.microsoft.com/help/4549684)|[15.7](https://support.microsoft.com/help/4564071)|[16.2](https://support.microsoft.com/help/4564072)|17.0|18.0|
|[14.14 (cumulative update 13)](https://support.microsoft.com/help/4564070)|[15.8](https://support.microsoft.com/help/4563406)|[16.3](https://support.microsoft.com/help/4563407)|17.0|18.0|
|[14.15 (cumulative update 14)](https://support.microsoft.com/help/4563405)|[15.9](https://support.microsoft.com/help/4563414)|[16.4](https://support.microsoft.com/help/4563415)|17.0|18.0|
|[14.16 (cumulative update 15)](https://support.microsoft.com/help/4563410)|[15.10](https://support.microsoft.com/help/4576663)|[16.5](https://support.microsoft.com/help/4576664)|17.0|18.0|
|[14.17 (cumulative update 16)](https://support.microsoft.com/help/4576662)|[15.11](https://support.microsoft.com/help/4583500) |[16.6](https://support.microsoft.com/help/4583501) |17.0|18.0|
|[14.18 (cumulative update 17)](https://support.microsoft.com/help/4583496)|[15.12](https://support.microsoft.com/help/4583512)|[16.7](https://support.microsoft.com/help/4583513)|[17.1](https://support.microsoft.com/help/4583515)|18.0|
|[14.19 (cumulative update 18)](https://support.microsoft.com/help/4583511)|[15.13](https://support.microsoft.com/help/4583552)|[16.8](https://support.microsoft.com/help/4583553)|[17.2](https://support.microsoft.com/help/4583554)|18.0|
|[14.20 (cumulative update 19)](https://support.microsoft.com/help/4583550)|[15.14](https://support.microsoft.com/help/4595150)|[16.9](https://support.microsoft.com/help/4595151)|[17.3](https://support.microsoft.com/help/4595152)|18.0|
|[14.21 (cumulative update 20)](https://support.microsoft.com/help/4595149)|[15.15](https://support.microsoft.com/help/5000694)|[16.10](https://support.microsoft.com/help/5000695)|[17.4](https://support.microsoft.com/help/5000696)|18.0|
|[14.22 (cumulative update 21)](https://support.microsoft.com/help/5000693)|[15.16](https://support.microsoft.com/help/5001233)|[16.11](https://support.microsoft.com/help/5001234)|[17.5](https://support.microsoft.com/help/5001235)|18.0|
|[14.23 (cumulative update 22)](https://support.microsoft.com/help/5001232)|15.17|16.12|17.6||18.0|
|14.24 (cumulative update 23)<sup>[\[1\]](#1)</sup>|15.18|16.13|17.7|18.1|

For example, you can upgrade version 14.0 to any 15 or 16 version. You can only upgrade version 14.11 to version 15.5 (or later) or version 16.0 (or later). 

To see the available updates for Business Central 2019 Release Wave 2, see [Released Updates for Microsoft Dynamics 365 Business Central 2019 Release Wave 2 on-premises](https://support.microsoft.com/help/4528706).

<a name="1"><sup>1</sup></a>The compatible upgrade versions for this version aren't available yet. If you are currently operating on this version, you'll have to wait until the next round of updates before you upgrade.

## Version 15 compatibility

The following table lists the Business Central 15 versions and the minimum 16, 17, and 18 version that's compatible for upgrade.

|Version 15|Version 16|Version 17|Version 18|
|----------|----------|----------|----------|
|15.0 to 15.4|16.0|17.0|18.0|
|[15.5](https://support.microsoft.com/help/4549678)|[16.1](https://support.microsoft.com/help/4549686)|17.0|18.0|
|[15.6](https://support.microsoft.com/help/4549685)|[16.2](https://support.microsoft.com/help/4564072)|17.0|18.0|
|[15.7](https://support.microsoft.com/help/4564071)|[16.3](https://support.microsoft.com/help/4563407)|17.0|18.0|
|[15.8](https://support.microsoft.com/help/4563406)|[16.4](https://support.microsoft.com/help/4563415)|17.0|18.0|
|[15.9](https://support.microsoft.com/help/4563414)|[16.5](https://support.microsoft.com/help/4576664) |17.0|18.0|
|[15.10](https://support.microsoft.com/help/4576663)|[16.6](https://support.microsoft.com/help/4583501)|17.0|18.0|
|[15.11](https://support.microsoft.com/help/4583500)|[16.7](https://support.microsoft.com/help/4583513)|[17.1](https://support.microsoft.com/help/4583515)|18.0|
|[15.12](https://support.microsoft.com/help/4583512)|[16.8](https://support.microsoft.com/help/4583553)|[17.2](https://support.microsoft.com/help/4583554)|18.0|
|[15.13](https://support.microsoft.com/help/4583552)|[16.9](https://support.microsoft.com/help/4595151)|[17.3](https://support.microsoft.com/help/4595152)|18.0|
|[15.14](https://support.microsoft.com/help/4595150)|[16.10](https://support.microsoft.com/help/5000695)|[17.4](https://support.microsoft.com/help/5000696)|18.0|
|[15.15](https://support.microsoft.com/help/5000694)|[16.11](https://support.microsoft.com/help/5001234)|[17.5](https://support.microsoft.com/help/5001235)|18.0|
|[15.16](https://support.microsoft.com/help/5001233)<sup>[\[1\]](#1)</sup>|16.12|17.6|18.1|

To see the available updates for Business Central 2020 Release Wave 1, see [Released Updates for Microsoft Dynamics 365 Business Central 2020 Release Wave 1 on-premises](https://support.microsoft.com/help/4549687).

## Version 16 compatibility

The following table lists the Business Central 16 versions and the minimum 17 and 18 version that's compatible for upgrade.

|Version 16|Version 17|Version 18|
|----------|----------|----------|
|16.0 to 16.5|17.0|18.0|
|[16.6](https://support.microsoft.com/help/4583501)|[17.1](https://support.microsoft.com/help/4583515)|18.0|
|[16.7](https://support.microsoft.com/help/4583513)|[17.2](https://support.microsoft.com/help/4583554)|18.0|
|[16.8](https://support.microsoft.com/help/4583553)|[17.3](https://support.microsoft.com/help/4595152)|18.0|
|[16.9](https://support.microsoft.com/help/4595151)|[17.4](https://support.microsoft.com/help/5000696)|18.0|
|[16.10](https://support.microsoft.com/help/5000695)|[17.5](https://support.microsoft.com/help/5001235)|18.0|
|[16.11](https://support.microsoft.com/help/5001234)<sup>[\[1\]](#1)</sup>|17.6|
|16.11<sup>[\[1\]](#1)</sup>|17.6|18.1|

To see the available updates for Business Central 2020 Release Wave 2, see [Released Updates for Microsoft Dynamics 365 Business Central 2020 Release Wave 2 on-premises](https://support.microsoft.com/help/4549687).

## Version 17 compatibility

The following table lists the Business Central 17 versions and the minimum 18 version that's compatible for upgrade.

|Version 17|Version 18|
|----------|----------|
|17.0 to 17.5|18.0|
|17.6<sup>[\[1\]](#1)</sup>|18.1|

<!-- To see the available updates for Business Central 2021 Release Wave 1, see [Released Updates for Microsoft Dynamics 365 Business Central 2021 Release Wave 1 on-premises](https://support.microsoft.com/help/4549687).-->

## See Also

[Upgrading to Business Central](upgrading-to-business-central.md)  
