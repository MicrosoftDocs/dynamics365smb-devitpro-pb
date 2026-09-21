---
title: Subscription Resource for the Business Central Dataverse API
description: Learn about the subscription resource used to manage webhook notifications and callback details for the Business Central Dataverse API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Subscription resource type

Represents a webhook subscription for the Business Central Dataverse API.

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] in [Enable the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|---|---|---|
| [Get Dataverse API subscriptions](../api/dynamics_subscriptions_get.md) | subscriptions | Gets webhook subscriptions. |
| [Delete a Dataverse API subscription](../api/dynamics_subscriptions_delete.md) | none | Deletes a webhook subscription. |
| [Create a Dataverse API subscription](../api/dynamics_subscriptions_create.md) | subscriptions | Creates a webhook subscription. |
| [Update a Dataverse API subscription](../api/dynamics_subscriptions_update.md) | subscriptions | Updates a webhook subscription. |

## Properties

| Property | Type | Description |
|---|---|---|
| subscriptionId | string | The unique ID of the subscription. |
| notificationUrl | string | The URL where webhook notifications are sent. |
| resource | string | The relative or absolute URL of the API resource being monitored. |
| timestamp | int64 | The timestamp for the subscription record. |
| userId | GUID | The ID of the user who created the subscription. |
| lastModifiedDateTime | datetime | The date and time when the subscription was last modified. Read-only. |
| clientState | string | An optional opaque value returned with each notification. Use it to verify notifications or maintain state. |
| expirationDateTime | datetime | The date and time when the subscription expires. |
| systemCreatedAt | datetime | The date and time when the subscription was created. |
| systemCreatedBy | GUID | The ID of the user who created the subscription. |
| systemModifiedAt | datetime | The date and time when the subscription was last modified. |
| systemModifiedBy | GUID | The ID of the user who last modified the subscription. |

## JSON representation

The following JSON object shows the subscription resource.

```json
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

[Get Dataverse API subscriptions](../api/dynamics_subscriptions_get.md)  
[Delete a Dataverse API subscription](../api/dynamics_subscriptions_delete.md)  
[Create a Dataverse API subscription](../api/dynamics_subscriptions_create.md)  
[Update a Dataverse API subscription](../api/dynamics_subscriptions_update.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
