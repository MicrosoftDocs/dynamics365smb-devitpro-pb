---
title: generalLedgerBudgets resource type
description: A general ledger budgets object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# generalLedgerBudgets resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general ledger budgets in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerBudgets](../api/dynamics_generalledgerbudgets_get.md)|generalLedgerBudgets|Gets a general ledger budgets object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general ledger budgets. Non-editable.|
|displayName|string|Specifies the general ledger budgets's name. This name will appear on all sales documents for the general ledger budgets.|
|description|string|Specifies the description of the general ledger budgets.|
|blocked|boolean|Specifies that entries cannot be posted to the general ledger budgets. **True** indicates account is blocked and posting is not allowed.|
|budgetDimension1Code|string||
|budgetDimension2Code|string||
|budgetDimension3Code|string||
|budgetDimension4Code|string||
|lastModifiedDateTime|datetime|The last datetime the general ledger budgets was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the generalLedgerBudgets resource.


```json
{
    "id": "GUID",
    "displayName": "string",
    "description": "string",
    "blocked": "boolean",
    "budgetDimension1Code": "string",
    "budgetDimension2Code": "string",
    "budgetDimension3Code": "string",
    "budgetDimension4Code": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET generalLedgerBudgets](../api/dynamics_generalledgerbudgets_get.md)
