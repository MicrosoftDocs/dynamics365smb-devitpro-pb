---
title: API endpoint structure
description: Discover the base URL pattern and environment details required to access Business Central API endpoints.
author: kennieNP
ms.reviewer: solsen
ms.topic: overview
ms.author: kepontop
ms.date: 07/07/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:07/07/2025
---

# API endpoint structure

[!INCLUDE[prod_short](../includes/prod_short.md)] exposes many APIs that make it possible for other services to integrate with [!INCLUDE[prod_short](../includes/prod_short.md)]. This article explains how the endpoint URLs for these APIs are constructed and provides examples from different types of APIs. 

## The structure of API endpoint URLs

URLs for built-in or custom API endpoints all follow the same base pattern. They start with the following base.

```text
Base URL
https://api.businesscentral.dynamics.com/v2.0
```

The `v2.0` part of the base URL stems from the time when [!INCLUDE[prod_short](../includes/prod_short.md)] started supporting multiple environments.

Next, the URL needs to include, which [!INCLUDE[prod_short](../includes/prod_short.md)] environment to connect to. Here, you can choose to include the Microsoft Entra ID of the tenant you want to connect to in the URL:

```text
Environment information

{Base URL}/{Entra ID}/{Environment name}

or

{Base URL}/{Environment name}
```

Then, you need to specify that the endpoint is for an API object (API page or API query). Notice that this part of the URL is different for other technologies, such as OData web services. This article doesn't cover these cases, as APIs are the recommended way of integrating [!INCLUDE[prod_short](../includes/prod_short.md)] with other systems.

```text
{Base URL}/{Environment information}/api
```

And then, you specify the API path. After that, you need to specify the API route (also called API category). For partner-created APIs, the API route is constructed using the `APIPublisher`, `APIGroup`, and `APIVersion` that you specify in your API object in AL. Learn more at [aka.ms/BCCustomAPI](https://aka.ms/bccustomapi).

Every [!INCLUDE[prod_short](../includes/prod_short.md)] environment comes with a standard set of commonly used APIs; for these, the API route is simply an `APIVersion` (namely `v2.0`), with no group or publisher. 

```text
API route For Microsoft Standard API, use this path: 

{Base URL}/{Environment information}/api/v2.0}

Other endpoints include API publisher, API group, and API version:

{Base URL}/{Environment information}/api/{API publisher}/{API group}/{API version} 
``` 

The resulting URL will point at the root of the APIs for the specific combination of parameters you used; in other words, this URL will point at the OData Service Document. You will have to append the specific endpoint to the URL to be able to access your data.

```text 
Endpoint {Base URL}/{Environment information}/api/{API route}/{endpoint} 
```

## Example: URLs for Business Central Standard API

To access any endpoint from the Microsoft Standard API 2.0, use this URL

`https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/v2.0/{endpoint}`

Learn more in [Business Central API (v2.0)](../api-reference/v2.0/index.md).


## Example: URLs for Business Central automation API

To access any endpoint from the [!INCLUDE[prod_short](../includes/prod_short.md)] automation API, use this URL

`https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/{endpoint}`

Note that the automation API requires a **Company name** parameter as part of the URL.

Learn more in [Automation API](../administration/itpro-introduction-to-automation-apis.md)

## Example: URLs for a custom API

Assume you have a custom API with the following API metadata

```AL
page 50101 "myAPIPage"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'myPublisher';
    APIGroup = 'myGroup';

// endpoint defined here
}
```

To access the endpoint from that API, use the following URL:
`https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/{API publisher}/{API group}/{API version}/{endpoint}`

Learn more in [Developing a custom API](../developer/devenv-develop-custom-api.md)

To call most of the [!INCLUDE[prod_short](../includes/prod_short.md)] endpoints, you will need to specify which Company you want to connect to. You can specify the company as part of the URL or as a query parameter. 

```text
Company 
You can specify the company as a query parameter 

{Base URL}/{Environment information}/api/{API route}/{endpoint}?company=<companyGuid> 

Alternatively, you can specify it as part of the endpoint 

{Base URL}/{Environment information}/api/{API route}/company(<companyGuid>)/{endpoint} 

```

## Related information

[API overview](api-overview.md)   
[Web services overview](web-services.md)   
[Integration overview](../developer/integration-overview.md)  