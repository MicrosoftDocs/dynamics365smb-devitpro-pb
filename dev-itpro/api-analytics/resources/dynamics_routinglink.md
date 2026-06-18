---
title: routingLink resource type
description: Represents a routingLink entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# routingLink resource type

Represents a routing link in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET routingLink](../api/dynamics_routinglink_get.md)|routingLink|Gets a routingLink object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The primary key of the routingLink.|
|description|string|Specifies the description of the routingLink.|

## JSON representation

Here's a JSON representation of the routingLink resource.

```json
{
    "code": "DEPARTMENT",
    "description": "ATHENS Desk"
}
```

## Related information

[GET routingLink](../api/dynamics_routinglink_get.md)
