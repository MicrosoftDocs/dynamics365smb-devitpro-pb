---
title: itemValueEntry resource type
description: Represents a itemValueEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemValueEntry resource type

Represents a item value entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemValueEntry](../api/dynamics_itemvalueentry_get.md)|itemValueEntry|Gets a itemValueEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the itemValueEntry.|
|valuationDate|Date|Specifies the valuationDate of the itemValueEntry.|
|itemNo|string|Specifies the itemNo of the itemValueEntry.|
|costAmountActual|decimal|Specifies the costAmountActual of the itemValueEntry.|
|costAmountExpected|decimal|Specifies the costAmountExpected of the itemValueEntry.|
|costPostedToGL|decimal|Specifies the costPostedToGL of the itemValueEntry.|
|invoicedQuantity|decimal|Specifies the invoicedQuantity of the itemValueEntry.|
|expectedCostPostedToGL|decimal|Specifies the expectedCostPostedToGL of the itemValueEntry.|
|locationCode|string|Specifies the locationCode of the itemValueEntry.|
|itemLedgerEntryType|string|Specifies the itemLedgerEntryType of the itemValueEntry.|
|postingDate|Date|Specifies the postingDate of the itemValueEntry.|
|documentType|string|Specifies the documentType of the itemValueEntry.|
|type|string|Specifies the type of the itemValueEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the itemValueEntry.|

## JSON representation

Here's a JSON representation of the itemValueEntry resource.

```json
{
    "entryNo": "integer",
    "valuationDate": "Date",
    "itemNo": "string",
    "costAmountActual": "decimal",
    "costAmountExpected": "decimal",
    "costPostedToGL": "decimal",
    "invoicedQuantity": "decimal",
    "expectedCostPostedToGL": "decimal",
    "locationCode": "string",
    "itemLedgerEntryType": "string",
    "postingDate": "Date",
    "documentType": "string",
    "type": "string",
    "dimensionSetID": "integer"
}
```

## Related information

[GET itemValueEntry](../api/dynamics_itemvalueentry_get.md)
