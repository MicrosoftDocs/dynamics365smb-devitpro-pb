---
title: disputeStatus resource type
description: A dispute status object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# disputeStatus resource type

Represents a dispute status in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET disputeStatus](../api/dynamics_disputestatus_get.md)|disputeStatus|Gets a dispute status object.|
|[DELETE disputeStatus](../api/dynamics_disputestatus_delete.md)|none|Deletes a dispute status object.|
|[POST disputeStatus](../api/dynamics_disputestatus_create.md)|disputeStatus|Creates a dispute status object.|
|[PATCH disputeStatus](../api/dynamics_disputestatus_update.md)|disputeStatus|Updates a dispute status object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the dispute status. Non-editable.|
|code|string|The code of the dispute status.|
|displayName|string|Specifies the dispute status's name. This name will appear on all sales documents for the dispute status.|

## JSON representation

Here's a JSON representation of the disputeStatus resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string"
}
```

## Related information

[GET disputeStatus](../api/dynamics_disputestatus_get.md)  
[DELETE disputeStatus](../api/dynamics_disputestatus_delete.md)  
[POST disputeStatus](../api/dynamics_disputestatus_create.md)  
[PATCH disputeStatus](../api/dynamics_disputestatus_update.md)
