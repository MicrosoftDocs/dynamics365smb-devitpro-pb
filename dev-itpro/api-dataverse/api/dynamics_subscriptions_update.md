---
title: Update a Business Central Dataverse API Subscription
description: Renew or update a webhook subscription for the Business Central Dataverse API and complete the required notification URL handshake.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Update a subscription

Renew or update a webhook subscription for the Business Central Dataverse API. Updating a subscription requires the notification URL handshake.

## HTTP request

Replace `{environmentName}` and `{subscriptionId}` with the environment name and subscription ID. Enclose the subscription ID in single quotation marks.

```http
PATCH https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/subscriptions('{subscriptionId}')
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |
| `Content-Type` | `application/json`. Required. |
| `If-Match` | The entity tag for the subscription. Required. |

## Request body

Supply the subscription values to update. Properties that aren't included retain their current values.

```json
{
  "notificationUrl": "https://contoso.com/api/dataverse-notifications",
  "resource": "/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges",
  "clientState": "C2dE3fH4iJ5kL6mN7oP8qR9sT0uV1w"
}
```

Business Central sends a validation request to `notificationUrl`. The subscriber must return the `validationToken` value as plain text in the response body with a `200 OK` status code.

## Response

If successful, this method returns a `200 OK` response code and the updated **subscription** object in the response body.

## Example

**Request**

```http
PATCH https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/subscriptions('aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb')
Authorization: Bearer {token}
Content-Type: application/json
If-Match: *

{
  "notificationUrl": "https://contoso.com/api/dataverse-notifications",
  "resource": "/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges",
  "clientState": "C2dE3fH4iJ5kL6mN7oP8qR9sT0uV1w"
}
```

**Response**

```json
{
  "subscriptionId": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "notificationUrl": "https://contoso.com/api/dataverse-notifications",
  "resource": "/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges",
  "timestamp": 638931492000000000,
  "userId": "11bb11bb-cc22-dd33-ee44-55ff55ff55ff",
  "lastModifiedDateTime": "2026-09-10T09:00:00Z",
  "clientState": "C2dE3fH4iJ5kL6mN7oP8qR9sT0uV1w",
  "expirationDateTime": "2026-09-13T09:00:00Z",
  "systemCreatedAt": "2026-09-10T08:00:00Z",
  "systemCreatedBy": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "systemModifiedAt": "2026-09-10T09:00:00Z",
  "systemModifiedBy": "bbbbbbbb-1111-2222-3333-cccccccccccc"
}
```

## Related information

[Subscription resource type](../resources/dynamics_subscriptions.md)  
[Get Dataverse API subscriptions](dynamics_subscriptions_get.md)  
[Create a Dataverse API subscription](dynamics_subscriptions_create.md)  
[Delete a Dataverse API subscription](dynamics_subscriptions_delete.md)  
[Working with webhooks](../../api-reference/v1.0/dynamics_subscriptions.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
