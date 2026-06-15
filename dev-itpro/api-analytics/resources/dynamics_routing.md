---
title: routing resource type
description: Represents a routing entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# routing resource type

Represents a routing in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET routing](../api/dynamics_routing_get.md)|routing|Gets a routing object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|no|string|The primary key of the routing.|
|type|string|Specifies the type of the routing.|
|status|string|Specifies the status of the routing.|
|description|string|Specifies the description of the routing.|

## JSON representation

Here's a JSON representation of the routing resource.

```json
{
    "no": "string",
    "type": "string",
    "status": "string",
    "description": "string"
}
```

## Related information

[GET routing](../api/dynamics_routing_get.md)
