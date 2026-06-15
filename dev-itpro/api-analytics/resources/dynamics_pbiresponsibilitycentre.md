---
title: pbiResponsibilityCentre resource type
description: Represents a pbiResponsibilityCentre entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiResponsibilityCentre resource type

Represents a pbi responsibility centre in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiResponsibilityCentre](../api/dynamics_pbiresponsibilitycentre_get.md)|pbiResponsibilityCentre|Gets a pbiResponsibilityCentre object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The primary key of the pbiResponsibilityCentre.|
|name|string|Specifies the name of the pbiResponsibilityCentre.|
|waterCapactiybyMonth|decimal|Specifies the waterCapactiybyMonth of the pbiResponsibilityCentre.|

## JSON representation

Here's a JSON representation of the pbiResponsibilityCentre resource.

```json
{
    "code": "string",
    "name": "string",
    "waterCapactiybyMonth": "decimal"
}
```

## Related information

[GET pbiResponsibilityCentre](../api/dynamics_pbiresponsibilitycentre_get.md)
