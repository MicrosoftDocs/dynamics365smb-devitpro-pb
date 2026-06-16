---
title: balanceSheetGeneralLedgerEntry resource type
description: Represents a balanceSheetGeneralLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# balanceSheetGeneralLedgerEntry resource type

Represents a balance sheet general ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET balanceSheetGeneralLedgerEntry](../api/dynamics_balancesheetgeneralledgerentry_get.md)|balanceSheetGeneralLedgerEntry|Gets a balanceSheetGeneralLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|incomeBalance|string|Specifies the incomeBalance of the balanceSheetGeneralLedgerEntry.|
|glAccountNo|string|The primary key of the balanceSheetGeneralLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the balanceSheetGeneralLedgerEntry.|
|amount|decimal|Specifies the amount of the balanceSheetGeneralLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the balanceSheetGeneralLedgerEntry.|
|sourceCode|string|Specifies the sourceCode of the balanceSheetGeneralLedgerEntry.|
|entryNo|integer|The primary key of the balanceSheetGeneralLedgerEntry.|
|systemModifiedAt|datetime|The datetime the balanceSheetGeneralLedgerEntry was last modified.|
|description|string|Specifies the description of the balanceSheetGeneralLedgerEntry.|
|sourceType|string|Specifies the sourceType of the balanceSheetGeneralLedgerEntry.|
|sourceNo|string|Specifies the sourceNo of the balanceSheetGeneralLedgerEntry.|

## JSON representation

Here's a JSON representation of the balanceSheetGeneralLedgerEntry resource.

```json
{
    "incomeBalance": "Income Statement",
    "glAccountNo": "10000",
    "postingDate": "2026-01-15",
    "amount": 1500.00,
    "dimensionSetID": 102,
    "sourceCode": "10000",
    "entryNo": 1001,
    "systemModifiedAt": "",
    "description": "ATHENS Desk",
    "sourceType": "Customer",
    "sourceNo": "10000"
}
```

## Related information

[GET balanceSheetGeneralLedgerEntry](../api/dynamics_balancesheetgeneralledgerentry_get.md)
