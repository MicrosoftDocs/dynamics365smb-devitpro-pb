---
title: capacityLedgerEntry resource type
description: Represents a capacityLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# capacityLedgerEntry resource type

Represents a capacity ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET capacityLedgerEntry](../api/dynamics_capacityledgerentry_get.md)|capacityLedgerEntry|Gets a capacityLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the capacityLedgerEntry.|
|orderType|string|Specifies the orderType of the capacityLedgerEntry.|
|orderNo|string|Specifies the orderNo of the capacityLedgerEntry.|
|orderLineNo|integer|Specifies the orderLineNo of the capacityLedgerEntry.|
|type|string|Specifies the type of the capacityLedgerEntry.|
|no|string|Specifies the no of the capacityLedgerEntry.|
|description|string|Specifies the description of the capacityLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the capacityLedgerEntry.|
|itemNo|string|Specifies the itemNo of the capacityLedgerEntry.|
|setupTime|decimal|Specifies the setupTime of the capacityLedgerEntry.|
|runTime|decimal|Specifies the runTime of the capacityLedgerEntry.|
|stopTime|decimal|Specifies the stopTime of the capacityLedgerEntry.|
|quantity|decimal|Specifies the quantity of the capacityLedgerEntry.|
|outputQuantity|decimal|Specifies the outputQuantity of the capacityLedgerEntry.|
|scrapQuantity|decimal|Specifies the scrapQuantity of the capacityLedgerEntry.|
|routingNo|string|Specifies the routingNo of the capacityLedgerEntry.|
|routingReferenceNo|integer|Specifies the routingReferenceNo of the capacityLedgerEntry.|
|operationNo|string|Specifies the operationNo of the capacityLedgerEntry.|
|workCenterGroupCode|string|Specifies the workCenterGroupCode of the capacityLedgerEntry.|
|scrapCode|string|Specifies the scrapCode of the capacityLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the capacityLedgerEntry.|
|workCenterNo|string|Specifies the workCenterNo of the capacityLedgerEntry.|
|workShiftCode|string|Specifies the workShiftCode of the capacityLedgerEntry.|
|subcontracting|boolean|Specifies the subcontracting of the capacityLedgerEntry.|
|qtyPerCapUnitOfMeasure|decimal|Specifies the qtyPerCapUnitOfMeasure of the capacityLedgerEntry.|
|capUnitOfMeasureCode|string|Specifies the capUnitOfMeasureCode of the capacityLedgerEntry.|
|qtyPerUnitOfMeasure|decimal|Specifies the qtyPerUnitOfMeasure of the capacityLedgerEntry.|
|directCost|decimal|Specifies the directCost of the capacityLedgerEntry.|
|overheadCost|decimal|Specifies the overheadCost of the capacityLedgerEntry.|

## JSON representation

Here's a JSON representation of the capacityLedgerEntry resource.

```json
{
    "entryNo": 1001,
    "orderType": "",
    "orderNo": "10000",
    "orderLineNo": 10000,
    "type": "Item",
    "no": "10000",
    "description": "ATHENS Desk",
    "postingDate": "2026-01-15",
    "itemNo": "1896-S",
    "setupTime": 100.00,
    "runTime": 100.00,
    "stopTime": 100.00,
    "quantity": 10.00,
    "outputQuantity": 10.00,
    "scrapQuantity": 10.00,
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "operationNo": "10000",
    "workCenterGroupCode": "W100",
    "scrapCode": "10000",
    "dimensionSetID": 102,
    "workCenterNo": "W100",
    "workShiftCode": "10000",
    "subcontracting": false,
    "qtyPerCapUnitOfMeasure": 10.00,
    "capUnitOfMeasureCode": "PCS",
    "qtyPerUnitOfMeasure": 10.00,
    "directCost": 25.5,
    "overheadCost": 25.5
}
```

## Related information

[GET capacityLedgerEntry](../api/dynamics_capacityledgerentry_get.md)
