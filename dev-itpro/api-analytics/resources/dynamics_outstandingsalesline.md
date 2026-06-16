---
title: outstandingSalesLine resource type
description: Represents a outstandingSalesLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# outstandingSalesLine resource type

Represents a outstanding sales line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET outstandingSalesLine](../api/dynamics_outstandingsalesline_get.md)|outstandingSalesLine|Gets a outstandingSalesLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|documentNo|string|The primary key of the outstandingSalesLine.|
|documentType|string|The primary key of the outstandingSalesLine.|
|sellToCustomerNo|string|The primary key of the outstandingSalesLine.|
|itemNo|string|The primary key of the outstandingSalesLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the outstandingSalesLine.|
|shipmentDate|Date|The primary key of the outstandingSalesLine.|
|locationCode|string|The primary key of the outstandingSalesLine.|
|dimensionSetID|integer|The primary key of the outstandingSalesLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the outstandingSalesLine.|
|unitOfMeasureCode|string|The primary key of the outstandingSalesLine.|

## JSON representation

Here's a JSON representation of the outstandingSalesLine resource.

```json
{
    "documentNo": "103001",
    "documentType": "Invoice",
    "sellToCustomerNo": "10000",
    "itemNo": "1896-S",
    "outstandingQtyBase": 10.00,
    "shipmentDate": "2026-01-20",
    "locationCode": "BLUE",
    "dimensionSetID": 102,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET outstandingSalesLine](../api/dynamics_outstandingsalesline_get.md)
