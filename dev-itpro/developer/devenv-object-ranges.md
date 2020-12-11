---
title: "Object Ranges"
description: "Description of the object ranges in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Object Ranges in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]

In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] running in the cloud, there are three different object ranges in terms of licensing. Developing for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] is done using Visual Studio Code with the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. All tenants in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are able to freely use objects in the following ranges:

- 50,000-99,999
- 1,000,000-69,999,999
- 70,000,000-74,999,999

In the following each individual range is explained.

## 0-49,999

This range is assigned to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] base app functionality and must not be used.

## 50,000-99,999 

This range is for customizations. A partner can develop an extension tailored to the individual tenant to fit the needs. The partner will develop this either by using a sandbox tenant or by running a build of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] on Docker that matches the version of the tenant. Once the development is done, the extension can be deployed to the individual tenant.

## 100,000-999,999

The objects in this range are mainly designed when the Microsoft team localizes [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] for a specific country or region. These objects cannot be used by partners.

## 1,000,000-69,999,999

This is the Registered Solution Program (RSP) range which partners that have an ISV solution for on-premise have access to. The partner can choose to use this range for developing extensions that can be used either in [!INCLUDE[navnow_md](includes/navnow_md.md)] on-premise or in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] in the cloud. When used in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] these extensions are obtained as apps from [appsource.microsoft.com](https://appsource.microsoft.com).

## 70,000,000-74,999,999

Partners can obtain ranges for extension development that runs in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] in the cloud. This range is only available for extension development and only in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. These extensions are obtained as apps from [appsource.microsoft.com](https://appsource.microsoft.com).

For more information, please see the [Ready To Go](https://aka.ms/readytogo) program.

Download the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] licensing guide [here](https://go.microsoft.com/fwlink/?LinkId=871590&clcid=0x409).

## See Also
[Ready To Go](https://aka.ms/readytogo)  
[Blog Post](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/10/17/which-object-ranges-can-we-use-with-microsoft-dynamics-365-business-central)

