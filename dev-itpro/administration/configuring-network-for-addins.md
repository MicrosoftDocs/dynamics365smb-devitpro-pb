---
title: Preparing your network for the Excel Add-In
author: mikebcMSFT
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: configure, port, firewall, proxy
ms.date: 10/01/2020
ms.author: mikebc
---

# Preparing Your Network for the Excel Add-In

This article includes information that helps administrators configure advanced device and network settings for the [!INCLUDE[prodshort](../includes/prodshort.md)] Excel Add-In.

## Network endpoints required by the Excel Add-In

The Excel Add-In must have access to the [!INCLUDE[prodshort](../includes/prodshort.md)] service for it to function and synchronize business data. Network services, such as proxies or firewalls, must allow routing between each client device on which the add-in is installed and the following services maintained by Microsoft:

- https://az689774.vo.msecnd.net
- https://dc.services.visualstudio.com
- https://exceladdinprovider.smb.dynamics.com
- https://api.businesscentral.dynamics.com

> [!NOTE]
> Your API endpoint URL may be different. Environments having an installed Embed App may use an API URL with the format <ApplicationName>.api.bc.dynamics.com, such as https://fabrikam.api.bc.dynamics.com. You can check if an environment uses an Embed App URL in the [Business Central Administration Center](tenant-admin-center.md).

## See also

[Setting up the Excel Add-In for Editing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Data](configuring-excel-addin.md)  
[Administration of [!INCLUDE[prodshort](../includes/prodshort.md)] Online](tenant-administration.md)  
[Managing an Business Central Embed App in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md#self-service-iw-sign-up---evaluation)  
