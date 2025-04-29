---
title: Get externalbusinesseventdefinitions
description: Gets an externalbusinesseventdefinitions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.date: 04/28/2025
ms.author: solsen
---

# Get externalbusinesseventdefinitions

Retrieves the properties and relationships of an externalbusinesseventdefinitions object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/externalbusinesseventdefinitions({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **externalbusinesseventdefinitions** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/externalbusinesseventdefinitions({id})
```

**Response**

Here's an example of the response.

```json
{
    "appId": "00001111-aaaa-2222-bbbb-3333cccc4444",
    "name": "CustomerCreated",
    "eventVersion": "1.0",
    "payload": "{\"customerId\":\"CUST1042\",\"name\":\"Contoso Ltd.\",\"email\":\"info@contoso.com\",\"address\":\"123 Main Street\",\"city\":\"Seattle\",\"state\":\"WA\",\"country\":\"US\",\"timestamp\":\"2025-04-29T09:15:32Z\"}",
    "displayName": "Customer Created",
    "description": "Triggered when a new customer is created in the system",
    "category": "Sales",
    "appName": "Business Central Base Application",
    "appPublisher": "Microsoft",
    "appVersion": "24.0.0.0"
}
```
<!-- END>EDIT_IS_REQUIRED -->
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[externalbusinesseventdefinitions](../resources/dynamics_externalbusinesseventdefinitions.md)
