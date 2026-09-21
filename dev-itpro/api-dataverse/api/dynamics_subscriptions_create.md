---
title: Create a Business Central Dataverse API Subscription
description: Create a webhook subscription for the Business Central Dataverse API and complete the validation handshake for the notification URL.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Create a subscription

Create a webhook subscription for the Business Central Dataverse API.

## HTTP request

Replace `{environmentName}` with the environment name.

```http
POST https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/subscriptions
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |
| `Content-Type` | `application/json`. Required. |

## Request body

Specify the notification URL, the API resource to monitor, and an optional client state value.

```json
{
  "notificationUrl": "https://contoso.com/api/dataverse-notifications",
  "resource": "/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges",
  "clientState": "A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u"
}
```

Business Central sends a validation request to `notificationUrl`. The subscriber must return the `validationToken` value as plain text in the response body with a `200 OK` status code. Business Central creates the subscription only after a successful handshake.

## Response

If successful, this method returns a `201 Created` response code and a **subscription** object in the response body.

## Example

**Request**

```http
POST https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/subscriptions
Authorization: Bearer {token}
Content-Type: application/json

{
  "notificationUrl": "https://contoso.com/api/dataverse-notifications",
  "resource": "/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges",
  "clientState": "A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u"
}
```

**Response**

```http
HTTP/1.1 201 Created
Content-Type: application/json

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
```

## Related information

[Subscription resource type](../resources/dynamics_subscriptions.md)  
[Get Dataverse API subscriptions](dynamics_subscriptions_get.md)  
[Update a Dataverse API subscription](dynamics_subscriptions_update.md)  
[Delete a Dataverse API subscription](dynamics_subscriptions_delete.md)  
[Working with webhooks](../../api-reference/v1.0/dynamics_subscriptions.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
