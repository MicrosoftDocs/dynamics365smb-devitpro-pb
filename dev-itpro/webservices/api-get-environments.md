---
title: "Get a List of Business Central Environments"
description: "Describing how to get a list of Business Central environments when working with APIs."
author: jswymer
ms.custom: na
ms.date: 02/10/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: jswymer
---

# Get a List of Business Central Environments

[!INCLUDE[prod_short](../includes/prod_short.md)] can have multiple environments. When working with a Business Central API, the name of the environment being connected to must to go into the endpoint URI. You can retrieve a list of environments deployed on the tenant by calling the environments endpoint as described in this article.

## Request

The HTTP request to this API must include the Authorization HTTP header, and the value must be an access token. For more information about how to obtain an access token, see [Getting an access token](../administration//administration-center-api.md#getting-an-access-token).

```json
GET https://api.businesscentral.dynamics.com/environments/v1.1
```

## Response

Returns a wrapped array of environments.

```json
{
    "value": [
        {
            "aadTenantId": Guid, // ID of the Azure Active Directory tenant that owns the environment
            "applicationFamily": string, // Family of the environment (for example, "Business Central")
            "type": string, // Environment type (production or sandbox)
            "name": string, // Environment name, unique within an application family
            "countryCode": string, // Country or region where the environment is deployed
            "webServiceUrl": string, // Url to access the environment's service API
            "webClientLoginUrl": string // URL to login page of the environment
        }
    ]
}
```

## See Also

[Developing Connect Apps for Dynamics 365 Business Central](../developer/devenv-develop-connect-apps.md)  
[Microsoft Web Services Overview](web-services.md)  
[OpenAPI Specification](../api-reference/v2.0/dynamics-open-api.md)  
