---
title: "Object Ranges"
description: "Description of the object ranges in Business Central."
author: SusanneWindfeldPedersen
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.date: 02/03/2021
---

# Object Ranges in [!INCLUDE[prod_short](includes/prod_short.md)]

When you develop an app for [!INCLUDE [prod_short](includes/prod_short.md)] online, you must request an object range in terms of licensing. Developing for [!INCLUDE[prod_short](includes/prod_short.md)] is done using Visual Studio Code with the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)].  

[!INCLUDE [object-ranges](includes/object-ranges.md)]

For more information, see [Requesting an object range](readiness/get-started.md#requesting-an-object-range).  

The following sections describe the different object ranges that you can find in the base application and extensions.

## 0-49,999

This range is assigned to [!INCLUDE[prod_short](includes/prod_short.md)] base app functionality and must not be used in extensions or customizations.

## 50,000-99,999

This range is for test purposes. Use this range as part of training and similar, such as if you are using a sandbox tenant or a build of [!INCLUDE[prod_short](includes/prod_short.md)] on Docker.

## 100,000-999,999

The objects in this range are mainly designed when the Microsoft team localizes [!INCLUDE[prod_short](includes/prod_short.md)] for a specific country or region. These objects cannot be used by partners.

## 1,000,000-69,999,999

This object range is intended for the Registered Solution Program (RSP). The partner can choose to use this range for developing extensions that can be used either in [!INCLUDE[navnow_md](includes/navnow_md.md)] on-premise or in [!INCLUDE[prod_short](includes/prod_short.md)] in the cloud.  

## 70,000,000-74,999,999

Partners can obtain IDs in this range for extensions for [!INCLUDE[prod_short](includes/prod_short.md)] online. These extensions are obtained as apps from [appsource.microsoft.com](https://appsource.microsoft.com).

For more information, see [Get Started with Building Apps](readiness/get-started.md).

Download the [!INCLUDE[prod_short](includes/prod_short.md)] licensing guide [here](https://go.microsoft.com/fwlink/?LinkId=871590&clcid=0x409).

## See Also

[Get Started with Building Apps](readiness/get-started.md)  
[Getting Started with AL](devenv-get-started.md)  
[Blog Post](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/10/17/which-object-ranges-can-we-use-with-microsoft-dynamics-365-business-central)
