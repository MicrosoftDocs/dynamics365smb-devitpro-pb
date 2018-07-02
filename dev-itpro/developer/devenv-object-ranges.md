---
title: "Object Ranges"
description: "Description of the object ranges in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Object Ranges in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]
In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] running in the cloud, there are three different object ranges in terms of licensing. Developing for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] is done using Visual Studio Code with the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. All tenants in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are able to freely use objects in the following ranges:

- 50.000-99.999
- 1.000.000-60.000.000
- 70.000.000-74.999.999

In the following each individual range is explained.

## 50.000-99.999 
This range is for per tenant/customer customizations. A partner can develop an extension tailored to the individual tenant to fit the needs. The partner will develop this either by using a sandbox tenant or by obtaining a Docker image of the current release of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] that matches the version of the tenant. Once the development is done, the extension can be deployed to the individual tenant.

## 1.000.000-60.000.000
This is the RSP range which partners that have an ISV solution for on-premise have access to. The partner can choose to use this range for developing extensions that can be used either in [!INCLUDE[navnow_md](includes/navnow_md.md)] on-premise or in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] in the cloud. When used in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] these extensions are obtained as apps from [appsource.microsoft.com](http://appsource.microsoft.com).

## 70.000.000-74.999.999
Partners can obtain ranges for extension development that runs in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] in the cloud. This range is only available for extension development and only in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. These extensions are obtained as apps from [appsource.microsoft.com](http://appsource.microsoft.com).

For more information, please see the [Ready To Go](https://aka.ms/readytogo) program.

## See Also
[Ready To Go](https://aka.ms/readytogo)  

