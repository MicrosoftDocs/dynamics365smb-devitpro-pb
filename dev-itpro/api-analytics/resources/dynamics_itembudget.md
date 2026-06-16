---
title: itemBudget resource type
description: Represents a itemBudget entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemBudget resource type

Represents a item budget in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemBudget](../api/dynamics_itembudget_get.md)|itemBudget|Gets a itemBudget object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|analysisArea|string|The primary key of the itemBudget.|
|budgetName|string|The primary key of the itemBudget.|
|budgetDescription|string|Specifies the budgetDescription of the itemBudget.|

## JSON representation

Here's a JSON representation of the itemBudget resource.

```json
{
    "analysisArea": "",
    "budgetName": "Adatum Corporation",
    "budgetDescription": "Standard posting"
}
```

## Related information

[GET itemBudget](../api/dynamics_itembudget_get.md)
