---
title: generalLedgerAccount resource type
description: Represents a generalLedgerAccount entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerAccount resource type

Represents a general ledger account in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerAccount](../api/dynamics_generalledgeraccount_get.md)|generalLedgerAccount|Gets a generalLedgerAccount object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|accountNo|string|The primary key of the generalLedgerAccount.|
|accountName|string|Specifies the accountName of the generalLedgerAccount.|
|accountType|string|Specifies the accountType of the generalLedgerAccount.|
|incomeBalance|string|Specifies the incomeBalance of the generalLedgerAccount.|
|accountSubcategoryEntryNo|integer|Specifies the accountSubcategoryEntryNo of the generalLedgerAccount.|
|indentation|integer|Specifies the indentation of the generalLedgerAccount.|
|totaling|string|Specifies the totaling of the generalLedgerAccount.|

## JSON representation

Here's a JSON representation of the generalLedgerAccount resource.

```json
{
    "accountNo": "string",
    "accountName": "string",
    "accountType": "string",
    "incomeBalance": "string",
    "accountSubcategoryEntryNo": "integer",
    "indentation": "integer",
    "totaling": "string"
}
```

## Related information

[GET generalLedgerAccount](../api/dynamics_generalledgeraccount_get.md)
