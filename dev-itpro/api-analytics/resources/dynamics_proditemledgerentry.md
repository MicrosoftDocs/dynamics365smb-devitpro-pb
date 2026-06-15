---
title: prodItemLedgerEntry resource type
description: Represents a prodItemLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# prodItemLedgerEntry resource type

Represents a prod item ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET prodItemLedgerEntry](../api/dynamics_proditemledgerentry_get.md)|prodItemLedgerEntry|Gets a prodItemLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryType|string|The primary key of the prodItemLedgerEntry.|
|orderType|string|The primary key of the prodItemLedgerEntry.|
|orderNo|string|The primary key of the prodItemLedgerEntry.|
|orderLineNo|integer|The primary key of the prodItemLedgerEntry.|
|postingDate|Date|The primary key of the prodItemLedgerEntry.|
|itemNo|string|The primary key of the prodItemLedgerEntry.|
|locationCode|string|The primary key of the prodItemLedgerEntry.|
|serialNo|string|The primary key of the prodItemLedgerEntry.|
|lotNo|string|The primary key of the prodItemLedgerEntry.|
|quantity|decimal|Specifies the quantity of the prodItemLedgerEntry.|
|dimensionSetID|integer|The primary key of the prodItemLedgerEntry.|
|positive|boolean|The primary key of the prodItemLedgerEntry.|
|costAmountActual|decimal|Specifies the costAmountActual of the prodItemLedgerEntry.|
|locationName|string|The primary key of the prodItemLedgerEntry.|

## JSON representation

Here's a JSON representation of the prodItemLedgerEntry resource.

```json
{
    "entryType": "string",
    "orderType": "string",
    "orderNo": "string",
    "orderLineNo": "integer",
    "postingDate": "Date",
    "itemNo": "string",
    "locationCode": "string",
    "serialNo": "string",
    "lotNo": "string",
    "quantity": "decimal",
    "dimensionSetID": "integer",
    "positive": "boolean",
    "costAmountActual": "decimal",
    "locationName": "string"
}
```

## Related information

[GET prodItemLedgerEntry](../api/dynamics_proditemledgerentry_get.md)
