---
title: inventoryProdOrderComponentLine resource type
description: Represents a inventoryProdOrderComponentLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# inventoryProdOrderComponentLine resource type

Represents a inventory prod order component line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET inventoryProdOrderComponentLine](../api/dynamics_inventoryprodordercomponentline_get.md)|inventoryProdOrderComponentLine|Gets a inventoryProdOrderComponentLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|status|string|The primary key of the inventoryProdOrderComponentLine.|
|documentNo|string|The primary key of the inventoryProdOrderComponentLine.|
|itemNo|string|The primary key of the inventoryProdOrderComponentLine.|
|locationCode|string|The primary key of the inventoryProdOrderComponentLine.|
|remainingQtyBase|decimal|Specifies the remainingQtyBase of the inventoryProdOrderComponentLine.|
|dueDate|Date|The primary key of the inventoryProdOrderComponentLine.|
|dimensionSetID|integer|The primary key of the inventoryProdOrderComponentLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the inventoryProdOrderComponentLine.|
|unitOfMeasureCode|string|The primary key of the inventoryProdOrderComponentLine.|

## JSON representation

Here's a JSON representation of the inventoryProdOrderComponentLine resource.

```json
{
    "status": "Released",
    "documentNo": "103001",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "remainingQtyBase": 10.00,
    "dueDate": "2026-02-28",
    "dimensionSetID": 102,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET inventoryProdOrderComponentLine](../api/dynamics_inventoryprodordercomponentline_get.md)
