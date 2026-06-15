---
title: itemLedgerEntry resource type
description: Represents a itemLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemLedgerEntry resource type

Represents a item ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemLedgerEntry](../api/dynamics_itemledgerentry_get.md)|itemLedgerEntry|Gets a itemLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the itemLedgerEntry.|
|entryType|string|Specifies the entryType of the itemLedgerEntry.|
|sourceType|string|Specifies the sourceType of the itemLedgerEntry.|
|sourceNo|string|Specifies the sourceNo of the itemLedgerEntry.|
|documentNo|string|Specifies the documentNo of the itemLedgerEntry.|
|documentType|string|Specifies the documentType of the itemLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the itemLedgerEntry.|
|itemNo|string|Specifies the itemNo of the itemLedgerEntry.|
|locationCode|string|Specifies the locationCode of the itemLedgerEntry.|
|serialNo|string|Specifies the serialNo of the itemLedgerEntry.|
|expirationDate|Date|Specifies the expirationDate of the itemLedgerEntry.|
|lotNo|string|Specifies the lotNo of the itemLedgerEntry.|
|quantity|decimal|Specifies the quantity of the itemLedgerEntry.|
|unitOfMeasureCode|string|Specifies the unitOfMeasureCode of the itemLedgerEntry.|
|remainingQuantity|decimal|Specifies the remainingQuantity of the itemLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the itemLedgerEntry.|
|open|boolean|Specifies the open of the itemLedgerEntry.|
|positive|boolean|Specifies the positive of the itemLedgerEntry.|
|invoicedQuantity|decimal|Specifies the invoicedQuantity of the itemLedgerEntry.|
|qtyPerUnitOfMeasure|decimal|Specifies the qtyPerUnitOfMeasure of the itemLedgerEntry.|
|costAmountActual|decimal|Specifies the costAmountActual of the itemLedgerEntry.|
|salesAmountActual|decimal|Specifies the salesAmountActual of the itemLedgerEntry.|

## JSON representation

Here's a JSON representation of the itemLedgerEntry resource.

```json
{
    "entryNo": "integer",
    "entryType": "string",
    "sourceType": "string",
    "sourceNo": "string",
    "documentNo": "string",
    "documentType": "string",
    "postingDate": "Date",
    "itemNo": "string",
    "locationCode": "string",
    "serialNo": "string",
    "expirationDate": "Date",
    "lotNo": "string",
    "quantity": "decimal",
    "unitOfMeasureCode": "string",
    "remainingQuantity": "decimal",
    "dimensionSetID": "integer",
    "open": "boolean",
    "positive": "boolean",
    "invoicedQuantity": "decimal",
    "qtyPerUnitOfMeasure": "decimal",
    "costAmountActual": "decimal",
    "salesAmountActual": "decimal"
}
```

## Related information

[GET itemLedgerEntry](../api/dynamics_itemledgerentry_get.md)
