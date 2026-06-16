---
title: location resource type
description: Represents a location entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# location resource type

Represents a location in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET location](../api/dynamics_location_get.md)|location|Gets a location object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|locationCode|string|The primary key of the location.|
|locationName|string|Specifies the locationName of the location.|
|adjustmentBinCode|string|Specifies the adjustmentBinCode of the location.|

## JSON representation

Here's a JSON representation of the location resource.

```json
{
    "locationCode": "BLUE",
    "locationName": "Blue Warehouse",
    "adjustmentBinCode": "B-01-0001"
}
```

## Related information

[GET location](../api/dynamics_location_get.md)
