---
title: outstandingPurchaseLine resource type
description: Represents a outstandingPurchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# outstandingPurchaseLine resource type

Represents a outstanding purchase line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET outstandingPurchaseLine](../api/dynamics_outstandingpurchaseline_get.md)|outstandingPurchaseLine|Gets a outstandingPurchaseLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|The primary key of the outstandingPurchaseLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the outstandingPurchaseLine.|
|expectedReceiptDate|Date|The primary key of the outstandingPurchaseLine.|
|locationCode|string|The primary key of the outstandingPurchaseLine.|
|buyFromVendorNo|string|The primary key of the outstandingPurchaseLine.|
|documentNo|string|The primary key of the outstandingPurchaseLine.|
|documentType|string|The primary key of the outstandingPurchaseLine.|
|dimensionSetID|integer|The primary key of the outstandingPurchaseLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the outstandingPurchaseLine.|
|unitOfMeasureCode|string|The primary key of the outstandingPurchaseLine.|

## JSON representation

Here's a JSON representation of the outstandingPurchaseLine resource.

```json
{
    "itemNo": "1896-S",
    "outstandingQtyBase": 10.00,
    "expectedReceiptDate": "2026-01-18",
    "locationCode": "BLUE",
    "buyFromVendorNo": "10000",
    "documentNo": "103001",
    "documentType": "Invoice",
    "dimensionSetID": 102,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET outstandingPurchaseLine](../api/dynamics_outstandingpurchaseline_get.md)
