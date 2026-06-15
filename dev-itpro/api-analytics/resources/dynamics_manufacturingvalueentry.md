---
title: manufacturingValueEntry resource type
description: Represents a manufacturingValueEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# manufacturingValueEntry resource type

Represents a manufacturing value entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET manufacturingValueEntry](../api/dynamics_manufacturingvalueentry_get.md)|manufacturingValueEntry|Gets a manufacturingValueEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the manufacturingValueEntry.|
|entryType|string|Specifies the entryType of the manufacturingValueEntry.|
|capacityLedgerEntryNo|integer|Specifies the capacityLedgerEntryNo of the manufacturingValueEntry.|
|valuationDate|Date|Specifies the valuationDate of the manufacturingValueEntry.|
|itemNo|string|Specifies the itemNo of the manufacturingValueEntry.|
|costAmountActual|decimal|Specifies the costAmountActual of the manufacturingValueEntry.|
|costAmountExpected|decimal|Specifies the costAmountExpected of the manufacturingValueEntry.|
|expectedCostPostedtoGL|decimal|Specifies the expectedCostPostedtoGL of the manufacturingValueEntry.|
|costPostedtoGL|decimal|Specifies the costPostedtoGL of the manufacturingValueEntry.|
|costPerUnit|decimal|Specifies the costPerUnit of the manufacturingValueEntry.|
|itemLedgerEntryQuantity|decimal|Specifies the itemLedgerEntryQuantity of the manufacturingValueEntry.|
|valuedQuantity|decimal|Specifies the valuedQuantity of the manufacturingValueEntry.|
|locationCode|string|Specifies the locationCode of the manufacturingValueEntry.|
|itemLedgerEntryType|string|Specifies the itemLedgerEntryType of the manufacturingValueEntry.|
|postingDate|Date|Specifies the postingDate of the manufacturingValueEntry.|
|type|string|Specifies the type of the manufacturingValueEntry.|
|no|string|Specifies the no of the manufacturingValueEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the manufacturingValueEntry.|
|orderType|string|Specifies the orderType of the manufacturingValueEntry.|
|orderNo|string|Specifies the orderNo of the manufacturingValueEntry.|
|expectedCost|boolean|Specifies the expectedCost of the manufacturingValueEntry.|

## JSON representation

Here's a JSON representation of the manufacturingValueEntry resource.

```json
{
    "entryNo": "integer",
    "entryType": "string",
    "capacityLedgerEntryNo": "integer",
    "valuationDate": "Date",
    "itemNo": "string",
    "costAmountActual": "decimal",
    "costAmountExpected": "decimal",
    "expectedCostPostedtoGL": "decimal",
    "costPostedtoGL": "decimal",
    "costPerUnit": "decimal",
    "itemLedgerEntryQuantity": "decimal",
    "valuedQuantity": "decimal",
    "locationCode": "string",
    "itemLedgerEntryType": "string",
    "postingDate": "Date",
    "type": "string",
    "no": "string",
    "dimensionSetID": "integer",
    "orderType": "string",
    "orderNo": "string",
    "expectedCost": "boolean"
}
```

## Related information

[GET manufacturingValueEntry](../api/dynamics_manufacturingvalueentry_get.md)
