---
title: orderServiceLine resource type
description: Represents a orderServiceLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# orderServiceLine resource type

Represents a order service line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET orderServiceLine](../api/dynamics_orderserviceline_get.md)|orderServiceLine|Gets a orderServiceLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|documentNo|string|The primary key of the orderServiceLine.|
|itemNo|string|The primary key of the orderServiceLine.|
|locationCode|string|The primary key of the orderServiceLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the orderServiceLine.|
|neededByDate|Date|The primary key of the orderServiceLine.|
|dimensionSetID|integer|The primary key of the orderServiceLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the orderServiceLine.|
|unitOfMeasureCode|string|The primary key of the orderServiceLine.|

## JSON representation

Here's a JSON representation of the orderServiceLine resource.

```json
{
    "documentNo": "103001",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "outstandingQtyBase": 10.00,
    "neededByDate": "2026-01-15",
    "dimensionSetID": 102,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET orderServiceLine](../api/dynamics_orderserviceline_get.md)
