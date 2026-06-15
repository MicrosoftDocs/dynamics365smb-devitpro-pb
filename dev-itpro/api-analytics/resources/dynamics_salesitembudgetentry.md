---
title: salesItemBudgetEntry resource type
description: Represents a salesItemBudgetEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesItemBudgetEntry resource type

Represents a sales item budget entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesItemBudgetEntry](../api/dynamics_salesitembudgetentry_get.md)|salesItemBudgetEntry|Gets a salesItemBudgetEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the salesItemBudgetEntry.|
|budgetName|string|Specifies the budgetName of the salesItemBudgetEntry.|
|entryDate|Date|Specifies the entryDate of the salesItemBudgetEntry.|
|itemNo|string|Specifies the itemNo of the salesItemBudgetEntry.|
|locationCode|string|Specifies the locationCode of the salesItemBudgetEntry.|
|sourceType|string|Specifies the sourceType of the salesItemBudgetEntry.|
|sourceNo|string|Specifies the sourceNo of the salesItemBudgetEntry.|
|quantity|decimal|Specifies the quantity of the salesItemBudgetEntry.|
|salesAmount|decimal|Specifies the salesAmount of the salesItemBudgetEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesItemBudgetEntry.|

## JSON representation

Here's a JSON representation of the salesItemBudgetEntry resource.

```json
{
    "entryNo": "integer",
    "budgetName": "string",
    "entryDate": "Date",
    "itemNo": "string",
    "locationCode": "string",
    "sourceType": "string",
    "sourceNo": "string",
    "quantity": "decimal",
    "salesAmount": "decimal",
    "dimensionSetID": "integer"
}
```

## Related information

[GET salesItemBudgetEntry](../api/dynamics_salesitembudgetentry_get.md)
