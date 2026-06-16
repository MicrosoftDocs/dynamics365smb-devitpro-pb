---
title: warehouseActivityLine resource type
description: Represents a warehouseActivityLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# warehouseActivityLine resource type

Represents a warehouse activity line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET warehouseActivityLine](../api/dynamics_warehouseactivityline_get.md)|warehouseActivityLine|Gets a warehouseActivityLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|actionType|string|The primary key of the warehouseActivityLine.|
|assembleToOrder|boolean|The primary key of the warehouseActivityLine.|
|atoComponent|boolean|The primary key of the warehouseActivityLine.|
|binCode|string|The primary key of the warehouseActivityLine.|
|itemNo|string|The primary key of the warehouseActivityLine.|
|locationCode|string|The primary key of the warehouseActivityLine.|
|qtyBase|decimal|Specifies the qtyBase of the warehouseActivityLine.|
|lotNo|string|The primary key of the warehouseActivityLine.|
|serialNo|string|The primary key of the warehouseActivityLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the warehouseActivityLine.|
|unitOfMeasureCode|string|The primary key of the warehouseActivityLine.|

## JSON representation

Here's a JSON representation of the warehouseActivityLine resource.

```json
{
    "actionType": "",
    "assembleToOrder": false,
    "atoComponent": false,
    "binCode": "B-01-0001",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "qtyBase": 10.00,
    "lotNo": "10000",
    "serialNo": "10000",
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET warehouseActivityLine](../api/dynamics_warehouseactivityline_get.md)
