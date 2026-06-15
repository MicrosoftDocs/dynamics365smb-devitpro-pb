---
title: generalLedgerBudgetEntry resource type
description: Represents a generalLedgerBudgetEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerBudgetEntry resource type

Represents a general ledger budget entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerBudgetEntry](../api/dynamics_generalledgerbudgetentry_get.md)|generalLedgerBudgetEntry|Gets a generalLedgerBudgetEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|budgetName|string|Specifies the budgetName of the generalLedgerBudgetEntry.|
|glAccountNo|string|Specifies the glAccountNo of the generalLedgerBudgetEntry.|
|budgetDate|Date|Specifies the budgetDate of the generalLedgerBudgetEntry.|
|budgetAmount|decimal|Specifies the budgetAmount of the generalLedgerBudgetEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the generalLedgerBudgetEntry.|
|entryNo|integer|The primary key of the generalLedgerBudgetEntry.|

## JSON representation

Here's a JSON representation of the generalLedgerBudgetEntry resource.

```json
{
    "budgetName": "string",
    "glAccountNo": "string",
    "budgetDate": "Date",
    "budgetAmount": "decimal",
    "dimensionSetID": "integer",
    "entryNo": "integer"
}
```

## Related information

[GET generalLedgerBudgetEntry](../api/dynamics_generalledgerbudgetentry_get.md)
