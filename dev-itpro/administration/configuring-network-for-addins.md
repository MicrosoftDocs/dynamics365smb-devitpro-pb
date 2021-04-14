---
title: Preparing your network for the Excel Add-In
description: This article includes information that helps administrators configure advanced device and network settings for the Excel add-in for Business Central.
author: mikebcMSFT
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: edupont
ms.search.keywords: configure, port, firewall, proxy
ms.date: 04/01/2021
ms.author: mikebc
---

# Preparing Your Network for the Excel Add-In

As the administrator of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online or on-premises, you can deploy an add-in so that users can work with their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] data in the Excel desktop app. This article includes information that helps administrators configure advanced device and network settings for the Excel add-in for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] when your network requirements block the add-in.  

## Network endpoints required by the Excel add-in

The Excel add-in must have access to [!INCLUDE[prod_short](../includes/prod_short.md)] for it to function and synchronize business data. Network services, such as proxies or firewalls, must allow routing between each client device on which the add-in is installed and the following services that are published by Microsoft:

- `https://az689774.vo.msecnd.net`
- `https://dc.services.visualstudio.com`
- `https://exceladdinprovider.smb.dynamics.com`
- `https://api.businesscentral.dynamics.com`

> [!NOTE]
> Your API endpoint URL can be different from these default values. For example, if your environment is based on a vertical solution by Fabrikam, your API endpoint is `https://fabrikam.api.bc.dynamics.com`. These vertical solutions have API endpoints that are based on the format of *`ApplicationName`.api.bc.dynamics.com*. You can check if an environment uses such a URL in the [Business Central Administration Center](tenant-admin-center.md).

## See also

[Setting up the Excel Add-In for Editing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Data](configuring-excel-addin.md)  
[Administration of [!INCLUDE[prod_short](../includes/prod_short.md)] Online](tenant-administration.md)  
[Managing an Business Central Embed App in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md#self-service-iw-sign-up---evaluation)  
