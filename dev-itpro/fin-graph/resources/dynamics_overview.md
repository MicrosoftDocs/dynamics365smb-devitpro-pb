---
title: Dynamics 365 for Finance and Operations, Business edition Overview | Microsoft Docs
description: Overview of the capabilities of Dynamics 365 for Finance and Operations Microsoft API.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2018
ms.author: solsen
---

# Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]
You can use the [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] API to build apps that get authorized access to and integrate seamlessly with Microsoft [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] data. 

## Authorization
Use the Azure AD v2.0 endpoint to authenticate [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] APIs. All APIs require the `Authorization: Bearer {access-token}` request header. For more information about authorization, see [Get access tokens to call Microsoft Graph](https://developer.microsoft.com/en-us/graph/docs/concepts/auth_overview).

## Common [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] scenarios
The [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] API allows you to read and modify business data through apps that are connected and integrated through a single endpoint. Use the API to, for example, get access to customer and vendor information, update sales orders, or view overdue payments.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).


## See Also
[Developing Connect Apps for Dynamics 365 Business Central](../../developer/devenv-develop-connect-apps.md)  

