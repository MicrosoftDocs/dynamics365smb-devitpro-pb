---
title: calendarEntry resource type
description: Represents a calendarEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# calendarEntry resource type

Represents a calendar entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET calendarEntry](../api/dynamics_calendarentry_get.md)|calendarEntry|Gets a calendarEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|capacityType|string|The primary key of the calendarEntry.|
|no|string|The primary key of the calendarEntry.|
|workCenterGroupCode|string|The primary key of the calendarEntry.|
|workShiftCode|string|The primary key of the calendarEntry.|
|date|Date|The primary key of the calendarEntry.|
|capacityEffective|decimal|Specifies the capacityEffective of the calendarEntry.|
|capacityTotal|decimal|Specifies the capacityTotal of the calendarEntry.|
|workCenterNo|string|The primary key of the calendarEntry.|

## JSON representation

Here's a JSON representation of the calendarEntry resource.

```json
{
    "capacityType": "",
    "no": "10000",
    "workCenterGroupCode": "W100",
    "workShiftCode": "10000",
    "date": "2026-01-15",
    "capacityEffective": 100.00,
    "capacityTotal": 100.00,
    "workCenterNo": "W100"
}
```

## Related information

[GET calendarEntry](../api/dynamics_calendarentry_get.md)
