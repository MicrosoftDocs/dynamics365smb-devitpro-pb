---
title: workingDay resource type
description: Represents a workingDay entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# workingDay resource type

Represents a working day in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET workingDay](../api/dynamics_workingday_get.md)|workingDay|Gets a workingDay object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|dayNumber|integer|The primary key of the workingDay.|
|id|GUID|The unique ID of the workingDay. Non-editable.|

## JSON representation

Here's a JSON representation of the workingDay resource.

```json
{
    "dayNumber": 1,
    "id": ""
}
```

## Related information

[GET workingDay](../api/dynamics_workingday_get.md)
