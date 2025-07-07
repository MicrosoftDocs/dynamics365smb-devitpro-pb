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

[!INCLUDE[prod_short](../includes/prod_short.md)] exposes many APIs, which makes it possible for other services to integrate with [!INCLUDE[prod_short](../includes/prod_short.md)]. This article provides guidance on how the endpoint URLs are constructed and provides examples from different types of APIs. 

## The structure of API endpoint URLs

URLs for built-in or custom API endpoints all follow the same base pattern. They start with the following base.

```text
Base URL
https://api.businesscentral.dynamics.com/v2.0
```

The **v2.0** part of the base URL stems from the time when [!INCLUDE[prod_short](../includes/prod_short.md)] started supporting multiple environments.

Next, the URL needs to include which environment you want to connect to. Here, you can choose to include the entra ID in the URL:

```text
Environment information

{Base URL}/{Entra ID}/{Environment name}

or

{Base URL}/{Environment name}
```

Then, you need to specify that the endpoint is for an API object (API page or API query):

```text
{Base URL}/{Environment information}/api
```

And then, you specify the API path:

```text
API path

For Microsoft Standard API, use this path:
{Base URL}/{Environment information}/api/v2.0

Other endpoints might include API publisher and API group:
{Base URL}/{Environment information}/api/{API publisher}/{API group}
```

Finally, some APIs offer a versioning on their endpoints:

```text
API version

{Base URL}/{Environment information}/api/{API publisher}/{API group}/{API version}
```

## Example: URLs for Business Central Standard API

To access any endpoint from the Microsoft Standard API 2.0, use this URL

`https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/v2.0/{endpoint}`

To learn more, go to [Business Central API (v2.0)](../api-reference/v2.0/index.md).


## Example: URLs for Business Central automation API

To access any endpoint from the [!INCLUDE[prod_short](../includes/prod_short.md)] automation API, use this URL

`https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/{endpoint}`

Note that the automation API requires a **Company name** parameter as part of the URL.

To learn more, go to [Automation API](../administration/itpro-introduction-to-automation-apis.md)

## Example: URLs for a custom API

Assume you have a custom API with the following API metadata

```AL
page 50101 "myAPIPage"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'myPublisher';
    APIGroup = 'myGroup';

// entityDefinitions defined here
}
```

To access the endpoint from that API, use the following URL:
`https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/{API publisher}/{API group}/{API version}/{entityDefinitions}`

To learn more, go to [Walk-through: Developing a Custom API](../developer/devenv-develop-custom-api.md)



## Related information

[API overview](api-overview.md)   
[Web services overview](web-services.md)   
[Integration overview](../developer/integration-overview.md)  