---
title: machineCenter resource type
description: Represents a machineCenter entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# machineCenter resource type

Represents a machine center in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET machineCenter](../api/dynamics_machinecenter_get.md)|machineCenter|Gets a machineCenter object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|no|string|The primary key of the machineCenter.|
|name|string|Specifies the name of the machineCenter.|
|workCenterNo|string|Specifies the workCenterNo of the machineCenter.|

## JSON representation

Here's a JSON representation of the machineCenter resource.

```json
{
    "no": "10000",
    "name": "Adatum Corporation",
    "workCenterNo": "W100"
}
```

## Related information

[GET machineCenter](../api/dynamics_machinecenter_get.md)
