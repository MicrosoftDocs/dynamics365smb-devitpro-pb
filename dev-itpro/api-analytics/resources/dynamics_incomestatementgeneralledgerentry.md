---
title: incomeStatementGeneralLedgerEntry resource type
description: Represents a incomeStatementGeneralLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# incomeStatementGeneralLedgerEntry resource type

Represents a income statement general ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET incomeStatementGeneralLedgerEntry](../api/dynamics_incomestatementgeneralledgerentry_get.md)|incomeStatementGeneralLedgerEntry|Gets a incomeStatementGeneralLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|incomeBalance|string|Specifies the incomeBalance of the incomeStatementGeneralLedgerEntry.|
|accountNo|string|The primary key of the incomeStatementGeneralLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the incomeStatementGeneralLedgerEntry.|
|amount|decimal|Specifies the amount of the incomeStatementGeneralLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the incomeStatementGeneralLedgerEntry.|
|sourceCode|string|Specifies the sourceCode of the incomeStatementGeneralLedgerEntry.|
|entryNo|integer|The primary key of the incomeStatementGeneralLedgerEntry.|
|systemModifiedAt|datetime|The datetime the incomeStatementGeneralLedgerEntry was last modified.|
|description|string|Specifies the description of the incomeStatementGeneralLedgerEntry.|
|sourceType|string|Specifies the sourceType of the incomeStatementGeneralLedgerEntry.|
|sourceNo|string|Specifies the sourceNo of the incomeStatementGeneralLedgerEntry.|

## JSON representation

Here's a JSON representation of the incomeStatementGeneralLedgerEntry resource.

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

[GET incomeStatementGeneralLedgerEntry](../api/dynamics_incomestatementgeneralledgerentry_get.md)
