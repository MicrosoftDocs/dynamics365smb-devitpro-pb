---
title: "Endpoints for the APIs for Microsoft Dynamics NAV and Microsoft Dynamics 365 for Finance and Operations, Business edition"
description: "Describing the steps you must go through to enable access to the APIs in on-prem and cloud product versions."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Endpoints for the APIs for Microsoft Dynamics NAV and Microsoft Dynamics 365 for Finance and Operations, Business edition 
[!INCLUDE[navnow](includes/navnow_md.md)] and [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] expose an API that makes it possible to integrate with other services. To enable integration with these APIs, for [!INCLUDE[navnow](includes/navnow_md.md)] you must go through a few steps to enable the access first. For more information about these steps, see [Enabling APIs for Microsoft Dynamics NAV](enabling-apis-for-dynamics-nav.md).

## Accessing the endpoint
Once you have the API access enabled, you can write code that integrates your web service or SaaS solution with [!INCLUDE[navnow](includes/navnow_md.md)]. Creating your integration through an API provides simple access to the supported functionality in a single endpoint, giving you a simplified experience for creating a single app with integrations across multiple Microsoft products. 

||Dynamics 365<br>Finance and Operations,<br>Business edition (online)|||Microsoft Dynamics<br> NAV 2018 (on-prem)|
|--|--|--|--|--|
|**Means of connection**|**Microsoft Graph (coming)**|**Common endpoint service**|**Direct tenant**|**Direct installation**|
|**Usage**|Production|Production|Rapid development and testing only|Production|
|**Endpoint**|`https://`<br>`graph.microsoft.com`<br>`/financials/beta/`| `https://`<br>`api.financials.dynamics.com`|`https://`<br>`<tenant url>:7048/MS/api/<API version>/`<br>  Example: `https://`<br>`contoso.com:7048/api/beta`|OData base URL in installation: <br> `https://`<br>`<base URL>:<port>/v1.0/api/<API version>/` <br> Example: `https://`<br>`nav.contoso.com:7048`<br>`/v1.0/api/beta/` <br> Must be exposed through a firewall.|
|**Availability**|Always enabled|Always enabled|Always enabled|Disabled by default.<br> Must be enabled by the administrator.|
|**Authentication**|Azure Active Directory<br> (AAD)|Azure Active Directory<br> (AAD)|Basic authentication.<br> Username and [web service<br> access key](developer/devenv-develop-connect-apps-for-fin.md) as password.|Basic authentication.<br> Username and [web service<br> access key](developer/devenv-develop-connect-apps-for-fin.md) as password.|
|**API/Data access**|Based on user's<br> [permissions](permissions-on-database-objects.md)|Based on user's<br> [permissions](permissions-on-database-objects.md)|Based on user's<br> [permissions](permissions-on-database-objects.md)|Based on user's<br> [permissions](permissions-on-database-objects.md)|
|**API update cycle**|Monthly|Monthly|Monthly|Hotfixes installed by partner|
|**Development instance**|Sign up for a [tenant](https://go.microsoft.com/fwlink/?linkid=847861)|Sign up for a [tenant](https://go.microsoft.com/fwlink/?linkid=847861)|Sign up for a [tenant](https://go.microsoft.com/fwlink/?linkid=847861)|Get [Docker](https://aka.ms/bcsandboxazure) instance|

## See Also
[API Documentation](dynamics-nav/api-reference/v1.0/index.md)[Configuring Microsoft Dynamics NAV Server](configuring-microsoft-dynamics-nav-server.md)  
[Microsoft Dynamics NAV Web Services Overview](microsoft-dynamics-nav-web-services-overview.md)  