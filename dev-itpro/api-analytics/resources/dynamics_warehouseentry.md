---
title: warehouseEntry resource type
description: Represents a warehouseEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# warehouseEntry resource type

Represents a warehouse entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET warehouseEntry](../api/dynamics_warehouseentry_get.md)|warehouseEntry|Gets a warehouseEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|The primary key of the warehouseEntry.|
|locationCode|string|The primary key of the warehouseEntry.|
|lotNo|string|The primary key of the warehouseEntry.|
|serialNo|string|The primary key of the warehouseEntry.|
|zoneCode|string|The primary key of the warehouseEntry.|
|binCode|string|The primary key of the warehouseEntry.|
|qtyBase|decimal|Specifies the qtyBase of the warehouseEntry.|
|qtyPerUnitOfMeasure|decimal|The primary key of the warehouseEntry.|
|unitOfMeasureCode|string|The primary key of the warehouseEntry.|

## JSON representation

Here's a JSON representation of the warehouseEntry resource.

```json
{
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "lotNo": "10000",
    "serialNo": "10000",
    "zoneCode": "PICK",
    "binCode": "B-01-0001",
    "qtyBase": 10.00,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET warehouseEntry](../api/dynamics_warehouseentry_get.md)
