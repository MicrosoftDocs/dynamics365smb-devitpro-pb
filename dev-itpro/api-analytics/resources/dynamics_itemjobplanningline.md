---
title: itemJobPlanningLine resource type
description: Represents a itemJobPlanningLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemJobPlanningLine resource type

Represents a item job planning line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemJobPlanningLine](../api/dynamics_itemjobplanningline_get.md)|itemJobPlanningLine|Gets a itemJobPlanningLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|The primary key of the itemJobPlanningLine.|
|remainingQtyBase|decimal|Specifies the remainingQtyBase of the itemJobPlanningLine.|
|planningDate|Date|The primary key of the itemJobPlanningLine.|
|locationCode|string|The primary key of the itemJobPlanningLine.|
|documentNo|string|The primary key of the itemJobPlanningLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the itemJobPlanningLine.|
|unitOfMeasureCode|string|The primary key of the itemJobPlanningLine.|

## JSON representation

Here's a JSON representation of the itemJobPlanningLine resource.

```json
{
    "itemNo": "1896-S",
    "remainingQtyBase": 10.00,
    "planningDate": "2026-01-15",
    "locationCode": "BLUE",
    "documentNo": "103001",
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET itemJobPlanningLine](../api/dynamics_itemjobplanningline_get.md)
