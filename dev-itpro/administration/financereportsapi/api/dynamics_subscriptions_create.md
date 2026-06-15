---
title: Create subscriptions (Beta)
description: Creates a subscriptions object in Dynamics 365 Business Central (Beta).
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create subscriptions (Beta)

Creates a subscriptions in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/subscriptions({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **subscriptions**, the **subscriptions** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **subscriptions** object.

## Response

If successful, this method returns ```201 Created``` response code and a **subscriptions** object in the response body.


## Example

**Request**

Here is an example of the request.
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/subscriptions({id})
Content-type: application/json
{
    "subscriptionId" : "",
    "notificationUrl" : "",
    "resource" : "",
    "timestamp" : "",
    "userId" : "",
    "lastModifiedDateTime" : "",
    "clientState" : "",
    "expirationDateTime" : "",
    "systemCreatedAt" : "",
    "systemCreatedBy" : "",
    "systemModifiedAt" : "",
    "systemModifiedBy" : ""
}
```
**Response**

Here is an example of the response.
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "subscriptionId" : "",
    "notificationUrl" : "",
    "resource" : "",
    "timestamp" : "",
    "userId" : "",
    "lastModifiedDateTime" : "",
    "clientState" : "",
    "expirationDateTime" : "",
    "systemCreatedAt" : "",
    "systemCreatedBy" : "",
    "systemModifiedAt" : "",
    "systemModifiedBy" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[subscriptions](../resources/dynamics_subscriptions.md)  
[GET subscriptions](dynamics_subscriptions_get.md)  
[DELETE subscriptions](dynamics_subscriptions_delete.md)  
[PATCH subscriptions](dynamics_subscriptions_update.md)  
