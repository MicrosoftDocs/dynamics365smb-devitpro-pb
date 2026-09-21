---
title: Dataverse Entity Change Resource for Business Central
description: Learn about the Dataverse entity change resource that notifies Business Central when a synchronized table changes in Microsoft Dataverse.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Dataverse entity change resource type

Represents a Dataverse entity change in [!INCLUDE [prod_short](../../includes/prod_short.md)].

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] in [Enable the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|---|---|---|
| [Get a Dataverse entity change](../api/dynamics_dataverseentitychange_get.md) | dataverseEntityChange | Gets a Dataverse entity change. |
| [Create a Dataverse entity change](../api/dynamics_dataverseentitychange_create.md) | dataverseEntityChange | Creates a Dataverse entity change. |

## Properties

| Property | Type | Description |
|---|---|---|
| id | GUID | The unique ID of the Dataverse entity change. Read-only. |
| entityName | string | The logical name of the Dataverse table that changed. |

## JSON representation

The following JSON object shows the **dataverseEntityChange** resource.

```json
{
  "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "entityName": "account"
}
```

## Related information

[Get a Dataverse entity change](../api/dynamics_dataverseentitychange_get.md)  
[Create a Dataverse entity change](../api/dynamics_dataverseentitychange_create.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
