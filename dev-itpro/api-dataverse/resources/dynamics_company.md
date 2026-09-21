---
title: Company Resource for the Business Central Dataverse API
description: Learn about the company resource in the Business Central Dataverse API, including its properties and Dataverse entity change navigation.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Company resource type

Represents a company in [!INCLUDE [prod_short](../../includes/prod_short.md)].

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] in [Enable the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|---|---|---|
| [Get a company](../api/dynamics_company_get.md) | company | Gets a company. |

## Navigation

| Navigation | Return type | Description |
|---|---|---|
| [dataverseEntityChanges](dynamics_dataverseentitychange.md) | dataverseEntityChanges | Gets the Dataverse entity changes for the company. |

## Properties

| Property | Type | Description |
|---|---|---|
| id | GUID | The unique ID of the company. Read-only. |
| systemVersion | string | The Business Central version for the company. |
| timestamp | int64 | The timestamp for the company record. |
| name | string | The name of the company. |
| displayName | string | The display name of the company. |
| businessProfileId | string | The ID of the business profile associated with the company. |
| systemCreatedAt | datetime | The date and time when the company was created. |
| systemCreatedBy | GUID | The ID of the user who created the company. |
| systemModifiedAt | datetime | The date and time when the company was last modified. |
| systemModifiedBy | GUID | The ID of the user who last modified the company. |

## JSON representation

The following JSON object shows the company resource.

```json
{
  "id": "00aa00aa-bb11-cc22-dd33-44ee44ee44ee",
  "systemVersion": "29.0.12345.0",
  "timestamp": 638931456000000000,
  "name": "CRONUS USA, Inc.",
  "displayName": "CRONUS USA, Inc.",
  "businessProfileId": "",
  "systemCreatedAt": "2026-09-01T08:00:00Z",
  "systemCreatedBy": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "systemModifiedAt": "2026-09-09T12:30:00Z",
  "systemModifiedBy": "bbbbbbbb-1111-2222-3333-cccccccccccc"
}
```

## Related information

[Get a company](../api/dynamics_company_get.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
