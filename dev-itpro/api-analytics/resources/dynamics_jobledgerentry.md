---
title: jobLedgerEntry resource type
description: Represents a jobLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# jobLedgerEntry resource type

Represents a job ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobLedgerEntry](../api/dynamics_jobledgerentry_get.md)|jobLedgerEntry|Gets a jobLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|jobNo|string|Specifies the jobNo of the jobLedgerEntry.|
|jobTaskNo|string|Specifies the jobTaskNo of the jobLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the jobLedgerEntry.|
|entryType|string|Specifies the entryType of the jobLedgerEntry.|
|type|string|Specifies the type of the jobLedgerEntry.|
|no|string|Specifies the no of the jobLedgerEntry.|
|description|string|Specifies the description of the jobLedgerEntry.|
|locationCode|string|Specifies the locationCode of the jobLedgerEntry.|
|unitOfMeasureCode|string|Specifies the unitOfMeasureCode of the jobLedgerEntry.|
|quantity|decimal|Specifies the quantity of the jobLedgerEntry.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the jobLedgerEntry.|
|totalCostLCY|decimal|Specifies the totalCostLCY of the jobLedgerEntry.|
|unitPrice|decimal|Specifies the unitPrice of the jobLedgerEntry.|
|totalPriceLCY|decimal|Specifies the totalPriceLCY of the jobLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the jobLedgerEntry.|
|auxiliaryIndex1|integer|The primary key of the jobLedgerEntry.|

## JSON representation

Here's a JSON representation of the jobLedgerEntry resource.

```json
{
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "postingDate": "2026-01-15",
    "entryType": "Sale",
    "type": "Item",
    "no": "10000",
    "description": "ATHENS Desk",
    "locationCode": "BLUE",
    "unitOfMeasureCode": "PCS",
    "quantity": 10.00,
    "unitCostLCY": 25.5,
    "totalCostLCY": 25.5,
    "unitPrice": 49.99,
    "totalPriceLCY": 49.99,
    "dimensionSetID": 102,
    "auxiliaryIndex1": 1
}
```

## Related information

[GET jobLedgerEntry](../api/dynamics_jobledgerentry_get.md)
