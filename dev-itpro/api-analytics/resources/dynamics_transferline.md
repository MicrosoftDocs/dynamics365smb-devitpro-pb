---
title: transferLine resource type
description: Represents a transferLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# transferLine resource type

Represents a transfer line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET transferLine](../api/dynamics_transferline_get.md)|transferLine|Gets a transferLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|documentNo|string|The primary key of the transferLine.|
|itemNo|string|The primary key of the transferLine.|
|inTransitLocationCode|string|The primary key of the transferLine.|
|transferToLocationCode|string|The primary key of the transferLine.|
|transferFromLocationCode|string|The primary key of the transferLine.|
|qtyInTransitBase|decimal|Specifies the qtyInTransitBase of the transferLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the transferLine.|
|receiptDate|Date|The primary key of the transferLine.|
|shipmentDate|Date|The primary key of the transferLine.|
|dimensionSetID|integer|The primary key of the transferLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the transferLine.|
|unitOfMeasureCode|string|The primary key of the transferLine.|

## JSON representation

Here's a JSON representation of the transferLine resource.

```json
{
    "documentNo": "string",
    "itemNo": "string",
    "inTransitLocationCode": "string",
    "transferToLocationCode": "string",
    "transferFromLocationCode": "string",
    "qtyInTransitBase": "decimal",
    "outstandingQtyBase": "decimal",
    "receiptDate": "Date",
    "shipmentDate": "Date",
    "dimensionSetID": "integer",
    "qtyPerUnitOfMeasure": "decimal",
    "unitOfMeasureCode": "string"
}
```

## Related information

[GET transferLine](../api/dynamics_transferline_get.md)
