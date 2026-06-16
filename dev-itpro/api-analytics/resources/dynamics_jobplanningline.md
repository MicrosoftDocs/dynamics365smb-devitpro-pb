---
title: jobPlanningLine resource type
description: Represents a jobPlanningLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# jobPlanningLine resource type

Represents a job planning line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobPlanningLine](../api/dynamics_jobplanningline_get.md)|jobPlanningLine|Gets a jobPlanningLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|jobNo|string|The primary key of the jobPlanningLine.|
|jobTaskNo|string|The primary key of the jobPlanningLine.|
|lineNo|integer|The primary key of the jobPlanningLine.|
|jobType|string|Specifies the jobType of the jobPlanningLine.|
|lineType|string|Specifies the lineType of the jobPlanningLine.|
|no|string|Specifies the no of the jobPlanningLine.|
|description|string|Specifies the description of the jobPlanningLine.|
|quantity|decimal|Specifies the quantity of the jobPlanningLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the jobPlanningLine.|
|totalCostLCY|decimal|Specifies the totalCostLCY of the jobPlanningLine.|
|unitPriceLCY|decimal|Specifies the unitPriceLCY of the jobPlanningLine.|
|lineAmountLCY|decimal|Specifies the lineAmountLCY of the jobPlanningLine.|
|totalPriceLCY|decimal|Specifies the totalPriceLCY of the jobPlanningLine.|
|planningDate|Date|Specifies the planningDate of the jobPlanningLine.|

## JSON representation

Here's a JSON representation of the jobPlanningLine resource.

```json
{
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "lineNo": 10000,
    "jobType": "",
    "lineType": "",
    "no": "10000",
    "description": "ATHENS Desk",
    "quantity": 10.00,
    "unitCostLCY": 25.5,
    "totalCostLCY": 25.5,
    "unitPriceLCY": 49.99,
    "lineAmountLCY": 1500.00,
    "totalPriceLCY": 49.99,
    "planningDate": "2026-01-15"
}
```

## Related information

[GET jobPlanningLine](../api/dynamics_jobplanningline_get.md)
