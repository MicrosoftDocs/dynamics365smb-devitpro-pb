---
title: incomeStmtGeneralLedgerEntry resource type
description: Represents a incomeStmtGeneralLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# incomeStmtGeneralLedgerEntry resource type

Represents a income stmt general ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET incomeStmtGeneralLedgerEntry](../api/dynamics_incomestmtgeneralledgerentry_get.md)|incomeStmtGeneralLedgerEntry|Gets a incomeStmtGeneralLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|incomeBalance|string|Specifies the incomeBalance of the incomeStmtGeneralLedgerEntry.|
|accountNo|string|The primary key of the incomeStmtGeneralLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the incomeStmtGeneralLedgerEntry.|
|amount|decimal|Specifies the amount of the incomeStmtGeneralLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the incomeStmtGeneralLedgerEntry.|
|sourceCode|string|Specifies the sourceCode of the incomeStmtGeneralLedgerEntry.|
|entryNo|integer|The primary key of the incomeStmtGeneralLedgerEntry.|
|systemModifiedAt|datetime|The datetime the incomeStmtGeneralLedgerEntry was last modified.|
|description|string|Specifies the description of the incomeStmtGeneralLedgerEntry.|
|sourceType|string|Specifies the sourceType of the incomeStmtGeneralLedgerEntry.|
|sourceNo|string|Specifies the sourceNo of the incomeStmtGeneralLedgerEntry.|

## JSON representation

Here's a JSON representation of the incomeStmtGeneralLedgerEntry resource.

```json
{
    "incomeBalance": "string",
    "accountNo": "string",
    "postingDate": "Date",
    "amount": "decimal",
    "dimensionSetID": "integer",
    "sourceCode": "string",
    "entryNo": "integer",
    "systemModifiedAt": "datetime",
    "description": "string",
    "sourceType": "string",
    "sourceNo": "string"
}
```

## Related information

[GET incomeStmtGeneralLedgerEntry](../api/dynamics_incomestmtgeneralledgerentry_get.md)
