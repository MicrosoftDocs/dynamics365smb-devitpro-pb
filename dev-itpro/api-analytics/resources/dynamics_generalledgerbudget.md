---
title: generalLedgerBudget resource type
description: Represents a generalLedgerBudget entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerBudget resource type

Represents a general ledger budget in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerBudget](../api/dynamics_generalledgerbudget_get.md)|generalLedgerBudget|Gets a generalLedgerBudget object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|budgetName|string|The primary key of the generalLedgerBudget.|
|budgetDescription|string|Specifies the budgetDescription of the generalLedgerBudget.|

## JSON representation

Here's a JSON representation of the generalLedgerBudget resource.

```json
{
    "budgetName": "string",
    "budgetDescription": "string"
}
```

## Related information

[GET generalLedgerBudget](../api/dynamics_generalledgerbudget_get.md)
