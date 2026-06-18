---
title: manufacturingProdOrderComponent resource type
description: Represents a manufacturingProdOrderComponent entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# manufacturingProdOrderComponent resource type

Represents a manufacturing prod order component in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET manufacturingProdOrderComponent](../api/dynamics_manufacturingprodordercomponent_get.md)|manufacturingProdOrderComponent|Gets a manufacturingProdOrderComponent object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|prodOrderStatus|string|The primary key of the manufacturingProdOrderComponent.|
|prodOrderNo|string|The primary key of the manufacturingProdOrderComponent.|
|prodOrderLineNo|integer|The primary key of the manufacturingProdOrderComponent.|
|itemNo|string|Specifies the itemNo of the manufacturingProdOrderComponent.|
|locationCode|string|Specifies the locationCode of the manufacturingProdOrderComponent.|
|expectedQtyBase|decimal|Specifies the expectedQtyBase of the manufacturingProdOrderComponent.|
|remainingQtyBase|decimal|Specifies the remainingQtyBase of the manufacturingProdOrderComponent.|
|dueDate|Date|Specifies the dueDate of the manufacturingProdOrderComponent.|
|routingLinkCode|string|Specifies the routingLinkCode of the manufacturingProdOrderComponent.|
|dimensionSetID|integer|Specifies the dimensionSetID of the manufacturingProdOrderComponent.|
|costAmount|decimal|Specifies the costAmount of the manufacturingProdOrderComponent.|
|locationName|string|Specifies the locationName of the manufacturingProdOrderComponent.|
|auxiliaryIndex1|integer|The primary key of the manufacturingProdOrderComponent.|

## JSON representation

Here's a JSON representation of the manufacturingProdOrderComponent resource.

```json
{
    "prodOrderStatus": "Released",
    "prodOrderNo": "10000",
    "prodOrderLineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "expectedQtyBase": 10.00,
    "remainingQtyBase": 10.00,
    "dueDate": "2026-02-28",
    "routingLinkCode": "10000",
    "dimensionSetID": 102,
    "costAmount": 25.5,
    "locationName": "Blue Warehouse",
    "auxiliaryIndex1": 1
}
```

## Related information

[GET manufacturingProdOrderComponent](../api/dynamics_manufacturingprodordercomponent_get.md)
