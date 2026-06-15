---
title: manufacturingSetup resource type
description: Represents a manufacturingSetup entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# manufacturingSetup resource type

Represents a manufacturing setup in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET manufacturingSetup](../api/dynamics_manufacturingsetup_get.md)|manufacturingSetup|Gets a manufacturingSetup object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|showCapacityIn|string|Specifies the showCapacityIn of the manufacturingSetup.|
|auxiliaryIndex1|string|The primary key of the manufacturingSetup.|

## JSON representation

Here's a JSON representation of the manufacturingSetup resource.

```json
{
    "showCapacityIn": "string",
    "auxiliaryIndex1": "string"
}
```

## Related information

[GET manufacturingSetup](../api/dynamics_manufacturingsetup_get.md)
