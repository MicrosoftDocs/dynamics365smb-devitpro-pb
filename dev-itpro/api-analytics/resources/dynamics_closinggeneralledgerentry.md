---
title: closingGeneralLedgerEntry resource type
description: Represents a closingGeneralLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# closingGeneralLedgerEntry resource type

Represents a closing general ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET closingGeneralLedgerEntry](../api/dynamics_closinggeneralledgerentry_get.md)|closingGeneralLedgerEntry|Gets a closingGeneralLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|incomeBalance|string|Specifies the incomeBalance of the closingGeneralLedgerEntry.|
|glAccountNo|string|The primary key of the closingGeneralLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the closingGeneralLedgerEntry.|
|amount|decimal|Specifies the amount of the closingGeneralLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the closingGeneralLedgerEntry.|
|sourceCode|string|Specifies the sourceCode of the closingGeneralLedgerEntry.|
|entryNo|integer|The primary key of the closingGeneralLedgerEntry.|
|systemModifiedAt|datetime|The datetime the closingGeneralLedgerEntry was last modified.|
|description|string|Specifies the description of the closingGeneralLedgerEntry.|
|sourceType|string|Specifies the sourceType of the closingGeneralLedgerEntry.|
|sourceNo|string|Specifies the sourceNo of the closingGeneralLedgerEntry.|

## JSON representation

Here's a JSON representation of the closingGeneralLedgerEntry resource.

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

[GET closingGeneralLedgerEntry](../api/dynamics_closinggeneralledgerentry_get.md)
