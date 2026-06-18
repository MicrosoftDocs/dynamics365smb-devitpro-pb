---
title: workCenterGroup resource type
description: Represents a workCenterGroup entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# workCenterGroup resource type

Represents a work center group in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET workCenterGroup](../api/dynamics_workcentergroup_get.md)|workCenterGroup|Gets a workCenterGroup object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The primary key of the workCenterGroup.|
|name|string|Specifies the name of the workCenterGroup.|

## JSON representation

Here's a JSON representation of the workCenterGroup resource.

```json
{
    "code": "DEPARTMENT",
    "name": "Adatum Corporation"
}
```

## Related information

[GET workCenterGroup](../api/dynamics_workcentergroup_get.md)
