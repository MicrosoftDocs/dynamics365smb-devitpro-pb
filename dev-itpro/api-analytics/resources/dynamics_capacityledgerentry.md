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
    "entryNo": "integer",
    "orderType": "string",
    "orderNo": "string",
    "orderLineNo": "integer",
    "type": "string",
    "no": "string",
    "description": "string",
    "postingDate": "Date",
    "itemNo": "string",
    "setupTime": "decimal",
    "runTime": "decimal",
    "stopTime": "decimal",
    "quantity": "decimal",
    "outputQuantity": "decimal",
    "scrapQuantity": "decimal",
    "routingNo": "string",
    "routingReferenceNo": "integer",
    "operationNo": "string",
    "workCenterGroupCode": "string",
    "scrapCode": "string",
    "dimensionSetID": "integer",
    "workCenterNo": "string",
    "workShiftCode": "string",
    "subcontracting": "boolean",
    "qtyPerCapUnitOfMeasure": "decimal",
    "capUnitOfMeasureCode": "string",
    "qtyPerUnitOfMeasure": "decimal",
    "directCost": "decimal",
    "overheadCost": "decimal"
}
```

## Related information

[GET capacityLedgerEntry](../api/dynamics_capacityledgerentry_get.md)
