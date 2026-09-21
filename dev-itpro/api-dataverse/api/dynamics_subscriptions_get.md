---
title: Retrieve Business Central Dataverse API Subscriptions
description: Retrieve webhook subscriptions for the Business Central Dataverse API, including their notification URLs, resources, and expiration times.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Get subscriptions

Retrieve webhook subscriptions for the Business Central Dataverse API.

## HTTP request

Replace `{environmentName}` with the environment name.

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/subscriptions
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a collection of **subscription** objects in the response body.

## Example

**Request**

```http
GET https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/subscriptions
Authorization: Bearer {token}
```

**Response**

```json
{
  "value": [
    {
      "subscriptionId": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
      "notificationUrl": "https://contoso.com/api/dataverse-notifications",
      "resource": "/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges",
      "timestamp": 638931456000000000,
      "userId": "11bb11bb-cc22-dd33-ee44-55ff55ff55ff",
      "lastModifiedDateTime": "2026-09-10T08:00:00Z",
      "clientState": "A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u",
      "expirationDateTime": "2026-09-13T08:00:00Z",
      "systemCreatedAt": "2026-09-10T08:00:00Z",
      "systemCreatedBy": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
      "systemModifiedAt": "2026-09-10T08:00:00Z",
      "systemModifiedBy": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb"
    }
  ]
}
```

## Related information

[Subscription resource type](../resources/dynamics_subscriptions.md)  
[Create a Dataverse API subscription](dynamics_subscriptions_create.md)  
[Update a Dataverse API subscription](dynamics_subscriptions_update.md)  
[Delete a Dataverse API subscription](dynamics_subscriptions_delete.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
