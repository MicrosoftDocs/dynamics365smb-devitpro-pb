---
title: salesCycleStage resource type
description: Represents a salesCycleStage entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesCycleStage resource type

Represents a sales cycle stage in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesCycleStage](../api/dynamics_salescyclestage_get.md)|salesCycleStage|Gets a salesCycleStage object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|salesCycleCode|string|The primary key of the salesCycleStage.|
|salesCycleStage|integer|The primary key of the salesCycleStage.|
|salesCycleStageDescription|string|Specifies the salesCycleStageDescription of the salesCycleStage.|

## JSON representation

Here's a JSON representation of the salesCycleStage resource.

```json
{
    "salesCycleCode": "string",
    "salesCycleStage": "integer",
    "salesCycleStageDescription": "string"
}
```

## Related information

[GET salesCycleStage](../api/dynamics_salescyclestage_get.md)
