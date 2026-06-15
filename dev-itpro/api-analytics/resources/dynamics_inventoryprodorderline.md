---
title: inventoryProdOrderLine resource type
description: Represents a inventoryProdOrderLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# inventoryProdOrderLine resource type

Represents a inventory prod order line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET inventoryProdOrderLine](../api/dynamics_inventoryprodorderline_get.md)|inventoryProdOrderLine|Gets a inventoryProdOrderLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|status|string|The primary key of the inventoryProdOrderLine.|
|documentNo|string|The primary key of the inventoryProdOrderLine.|
|itemNo|string|The primary key of the inventoryProdOrderLine.|
|locationCode|string|The primary key of the inventoryProdOrderLine.|
|remainingQtyBase|decimal|Specifies the remainingQtyBase of the inventoryProdOrderLine.|
|dueDate|Date|The primary key of the inventoryProdOrderLine.|
|startingDate|Date|The primary key of the inventoryProdOrderLine.|
|dimensionSetID|integer|The primary key of the inventoryProdOrderLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the inventoryProdOrderLine.|
|unitOfMeasureCode|string|The primary key of the inventoryProdOrderLine.|

## JSON representation

Here's a JSON representation of the inventoryProdOrderLine resource.

```json
{
    "status": "string",
    "documentNo": "string",
    "itemNo": "string",
    "locationCode": "string",
    "remainingQtyBase": "decimal",
    "dueDate": "Date",
    "startingDate": "Date",
    "dimensionSetID": "integer",
    "qtyPerUnitOfMeasure": "decimal",
    "unitOfMeasureCode": "string"
}
```

## Related information

[GET inventoryProdOrderLine](../api/dynamics_inventoryprodorderline_get.md)
