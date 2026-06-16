---
title: manufacturingProdOrderLines resource type
description: Represents a manufacturingProdOrderLines entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# manufacturingProdOrderLines resource type

Represents a manufacturing prod order lines in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET manufacturingProdOrderLines](../api/dynamics_manufacturingprodorderlines_get.md)|manufacturingProdOrderLines|Gets a manufacturingProdOrderLines object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|prodOrderStatus|string|The primary key of the manufacturingProdOrderLines.|
|prodOrderNo|string|The primary key of the manufacturingProdOrderLines.|
|prodOrderLineNo|integer|The primary key of the manufacturingProdOrderLines.|
|itemNo|string|The primary key of the manufacturingProdOrderLines.|
|locationCode|string|The primary key of the manufacturingProdOrderLines.|
|quantityBase|decimal|Specifies the quantityBase of the manufacturingProdOrderLines.|
|remainingQtyBase|decimal|Specifies the remainingQtyBase of the manufacturingProdOrderLines.|
|dueDate|Date|The primary key of the manufacturingProdOrderLines.|
|routingNo|string|The primary key of the manufacturingProdOrderLines.|
|routingReferenceNo|integer|The primary key of the manufacturingProdOrderLines.|
|routingType|string|The primary key of the manufacturingProdOrderLines.|
|dimensionSetID|integer|The primary key of the manufacturingProdOrderLines.|
|finishedQtyBase|decimal|The primary key of the manufacturingProdOrderLines.|
|scrapPrc|decimal|The primary key of the manufacturingProdOrderLines.|
|overheadRate|decimal|The primary key of the manufacturingProdOrderLines.|
|planningLevelCode|integer|The primary key of the manufacturingProdOrderLines.|
|indirectCostPercent|decimal|The primary key of the manufacturingProdOrderLines.|
|locationName|string|The primary key of the manufacturingProdOrderLines.|

## JSON representation

Here's a JSON representation of the manufacturingProdOrderLines resource.

```json
{
    "prodOrderStatus": "Released",
    "prodOrderNo": "10000",
    "prodOrderLineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "remainingQtyBase": 10.00,
    "dueDate": "2026-02-28",
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "routingType": "",
    "dimensionSetID": 102,
    "finishedQtyBase": 10.00,
    "scrapPrc": 5.00,
    "overheadRate": 1.00,
    "planningLevelCode": 1,
    "indirectCostPercent": 25.5,
    "locationName": "Blue Warehouse"
}
```

## Related information

[GET manufacturingProdOrderLines](../api/dynamics_manufacturingprodorderlines_get.md)
