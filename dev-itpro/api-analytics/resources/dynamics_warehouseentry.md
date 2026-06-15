---
title: warehouseEntry resource type
description: Represents a warehouseEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "itemNo": "string",
    "locationCode": "string",
    "lotNo": "string",
    "serialNo": "string",
    "zoneCode": "string",
    "binCode": "string",
    "qtyBase": "decimal",
    "qtyPerUnitOfMeasure": "decimal",
    "unitOfMeasureCode": "string"
}
```

## Related information

[GET warehouseEntry](../api/dynamics_warehouseentry_get.md)
