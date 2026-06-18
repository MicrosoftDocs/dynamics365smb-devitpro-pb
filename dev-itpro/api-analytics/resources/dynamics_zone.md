---
title: zone resource type
description: Represents a zone entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# zone resource type

Represents a zone in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET zone](../api/dynamics_zone_get.md)|zone|Gets a zone object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|zoneCode|string|The primary key of the zone.|
|zoneDescription|string|Specifies the zoneDescription of the zone.|
|locationCode|string|The primary key of the zone.|
|binTypeCode|string|Specifies the binTypeCode of the zone.|

## JSON representation

Here's a JSON representation of the zone resource.

```json
{
    "zoneCode": "PICK",
    "zoneDescription": "Pick Zone",
    "locationCode": "BLUE",
    "binTypeCode": "10000"
}
```

## Related information

[GET zone](../api/dynamics_zone_get.md)
