---
title: bin resource type
description: Represents a bin entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# bin resource type

Represents a bin in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET bin](../api/dynamics_bin_get.md)|bin|Gets a bin object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|binCode|string|The primary key of the bin.|
|description|string|Specifies the description of the bin.|
|locationCode|string|The primary key of the bin.|
|binType|string|Specifies the binType of the bin.|
|zoneCode|string|Specifies the zoneCode of the bin.|

## JSON representation

Here's a JSON representation of the bin resource.

```json
{
    "binCode": "B-01-0001",
    "description": "ATHENS Desk",
    "locationCode": "BLUE",
    "binType": "",
    "zoneCode": "PICK"
}
```

## Related information

[GET bin](../api/dynamics_bin_get.md)
