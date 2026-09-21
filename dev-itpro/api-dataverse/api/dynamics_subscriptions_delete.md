---
title: Delete a Business Central Dataverse API Subscription
description: Delete a webhook subscription from the Business Central Dataverse API when an integration no longer needs change notifications.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Delete a subscription

Delete a webhook subscription from the Business Central Dataverse API.

## HTTP request

Replace `{environmentName}` and `{subscriptionId}` with the environment name and subscription ID. Enclose the subscription ID in single quotation marks.

```http
DELETE https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/subscriptions('{subscriptionId}')
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |
| `If-Match` | The entity tag for the subscription. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `204 No Content` response code and no response body.

## Example

**Request**

```http
DELETE https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/subscriptions('aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb')
Authorization: Bearer {token}
If-Match: *
```

**Response**

```http
HTTP/1.1 204 No Content
```

## Related information

[Subscription resource type](../resources/dynamics_subscriptions.md)  
[Get Dataverse API subscriptions](dynamics_subscriptions_get.md)  
[Create a Dataverse API subscription](dynamics_subscriptions_create.md)  
[Update a Dataverse API subscription](dynamics_subscriptions_update.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
