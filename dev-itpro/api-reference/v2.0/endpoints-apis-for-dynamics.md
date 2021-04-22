---
title: "Endpoints for the APIs for Microsoft Dynamics NAV and Microsoft Dynamics 365 Business Central"
description: "Describing the steps you must go through to enable access to the APIs in on-prem and cloud product versions."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
---

# Endpoints for the APIs for Dynamics 365 Business Central On-Premises and Online

[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] on-premises and online expose an API that makes it possible to integrate with other services. To enable integration with these APIs, you must go through a few steps to enable the access first. For more information about these steps, see [Enabling APIs for Dynamics 365 Business Central](enabling-apis-for-dynamics-nav.md).

## Accessing the endpoints

Once you have the API access enabled, you can write code that integrates your web service or SaaS solution with [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. Creating your integration through an API provides simple access to the supported functionality in a single endpoint, giving you a simplified experience for creating a single app with integrations across multiple Microsoft products.

> [!IMPORTANT]  
> With the introduction of multiple endpoints, the name of the environment being connected to, needs to go into the URI. To retrieve a list of environments deployed on the tenant, call:
`GET https://api.businesscentral.dynamics.com/environments/v2.0/`.

### [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]

|**Means of connection**|**Microsoft Graph**|**Common endpoint service**|**Direct tenant**|
|--|--|--|--|
|**Usage**|Production|Production|Rapid development and testing only|
|**Endpoint**|`https://`<br>`graph.microsoft.com`<br>`/beta/financials/`| *With multiple environments (v2.0):*<br> `https://`<br>`api.businesscentral.dynamics.com/`<br> `v2.0/<environment name>/api/v2.0`  <br>Environment can be a named sandbox or production environment.<br><br> *Without environment (v1.0):* <br>  `https://`<br>`api.businesscentral.dynamics.com/`<br> `v1.0/api/v1.0` <br><br>Sandbox:<br> `https://`<br>`api.businesscentral.dynamics.com/`<br> `v2.0/sandbox/api/v2.0`  | *With multiple environments (v2.0):*  <br>`https://`<br>`api.businesscentral.dynamics.com/`<br>`v2.0/<user domain name>/<environment name>/api/v2.0`<br>Environment can be a named sandbox or production environment. <br><br>*Without multiple environments (v1.0):*<br>`https://`<br>`api.businesscentral.dynamics.com/`<br>`v1.0/<user domain name>/api/v1.0`<br>  Example: `https://`<br>`api.businesscentral.dynamics.com/`<br> `v1.0/cronus.com/api/v1.0` <br><br> Sandbox:<br> `https://`<br>`api.businesscentral.dynamics.com/`<br> `v2.0/cronus.com/sandbox/api/v2.0`|
|**Availability**|Always enabled|Always enabled|Always enabled|
|**Authentication**|Azure Active Directory<br> (AAD)|Azure Active Directory<br> (AAD)|Basic authentication.<br> Username and [web service<br> access key](/dynamics365/business-central/dev-itpro/developer/devenv-develop-connect-apps) as password.|
|**API/Data access**|Based on user's<br> [permissions](../../permissions-on-database-objects.md)|Based on user's<br> [permissions](../../permissions-on-database-objects.md)|
|**API update cycle**|Monthly|Monthly|Monthly|
|**Development instance**|Sign up for a [tenant](https://go.microsoft.com/fwlink/?linkid=847861)|Sign up for a [tenant](https://go.microsoft.com/fwlink/?linkid=847861)|Sign up for a [tenant](https://go.microsoft.com/fwlink/?linkid=847861)|

### [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] On-Prem

|**Means of connection**|**Direct installation**|
|--|--|
|**Usage**|Production|
|**Endpoint**|OData base URL in installation: <br> `https://`<br>`<base URL>:<port>/<serverInstance>/api/<API version>/` <br> Example: `https://`<br>`nav.contoso.com:7048/`<br>`bc/api/v2.0` <br> Must be exposed through a firewall.<br><br>Extension APIs:<br>`https://<base URL>:<port>/<serverinstance>/api/<API publisher>/<API group>/<API version>`|
|**Availability**|Disabled by default.<br> Must be enabled by the administrator.|
|**Authentication**|Basic authentication.<br> Username and [web service<br> access key](/dynamics365/business-central/dev-itpro/developer/devenv-develop-connect-apps) as password. Your solution must be configured to use **NavUserPassword** or **AccessControlService** authentication in order to configure Dynamics NAV user accounts to include an access key.|
|**API/Data access**|Based on user's<br> [permissions](../../permissions-on-database-objects.md)|Based on user's<br> [permissions](../../permissions-on-database-objects.md)|
|**API update cycle**|Hotfixes installed by partner|
|**Development instance**|Get [Docker](https://aka.ms/navdeveloperpreview) instance|

## See Also

[Developing Connect Apps for Dynamics 365 Business Central](/dynamics365/business-central/dev-itpro/developer/devenv-develop-connect-apps)  
[Configuring Microsoft Dynamics NAV Server 2018](../../configuring-microsoft-dynamics-nav-server.md)  
[Microsoft Dynamics NAV Web Services Overview](../../microsoft-dynamics-nav-web-services-overview.md)  
[OpenAPI Specification](dynamics-open-api.md)  
