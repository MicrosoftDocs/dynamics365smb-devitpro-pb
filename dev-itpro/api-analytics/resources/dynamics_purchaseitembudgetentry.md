---
title: purchaseItemBudgetEntry resource type
description: Represents a purchaseItemBudgetEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# purchaseItemBudgetEntry resource type

Represents a purchase item budget entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseItemBudgetEntry](../api/dynamics_purchaseitembudgetentry_get.md)|purchaseItemBudgetEntry|Gets a purchaseItemBudgetEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the purchaseItemBudgetEntry.|
|budgetName|string|Specifies the budgetName of the purchaseItemBudgetEntry.|
|entryDate|Date|Specifies the entryDate of the purchaseItemBudgetEntry.|
|itemNo|string|Specifies the itemNo of the purchaseItemBudgetEntry.|
|locationCode|string|Specifies the locationCode of the purchaseItemBudgetEntry.|
|sourceType|string|Specifies the sourceType of the purchaseItemBudgetEntry.|
|sourceNo|string|Specifies the sourceNo of the purchaseItemBudgetEntry.|
|quantity|decimal|Specifies the quantity of the purchaseItemBudgetEntry.|
|costAmount|decimal|Specifies the costAmount of the purchaseItemBudgetEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the purchaseItemBudgetEntry.|

## JSON representation

Here's a JSON representation of the purchaseItemBudgetEntry resource.

```json
{
    "entryNo": 1001,
    "budgetName": "Adatum Corporation",
    "entryDate": "2026-01-15",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "sourceType": "Customer",
    "sourceNo": "10000",
    "quantity": 10.00,
    "costAmount": 25.5,
    "dimensionSetID": 102
}
```

## Related information

[GET purchaseItemBudgetEntry](../api/dynamics_purchaseitembudgetentry_get.md)
