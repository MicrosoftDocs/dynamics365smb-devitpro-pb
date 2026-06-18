---
title: opportunityEntry resource type
description: Represents a opportunityEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# opportunityEntry resource type

Represents a opportunity entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET opportunityEntry](../api/dynamics_opportunityentry_get.md)|opportunityEntry|Gets a opportunityEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|opportunityEntryEntryNo|integer|The primary key of the opportunityEntry.|
|opportunityEntryOpportunity|string|Specifies the opportunityEntryOpportunity of the opportunityEntry.|
|salespersonCode|string|Specifies the salespersonCode of the opportunityEntry.|
|opportunityEntryActive|boolean|Specifies the opportunityEntryActive of the opportunityEntry.|
|opportunityEntryActionTaken|string|Specifies the opportunityEntryActionTaken of the opportunityEntry.|
|opportunityEntryDateChange|Date|Specifies the opportunityEntryDateChange of the opportunityEntry.|
|opportunityEntryEstCloseDate|Date|Specifies the opportunityEntryEstCloseDate of the opportunityEntry.|
|opportunityEntryEstValue|decimal|Specifies the opportunityEntryEstValue of the opportunityEntry.|
|opportunityEntryCalcCurrentValue|decimal|Specifies the opportunityEntryCalcCurrentValue of the opportunityEntry.|
|opportunityEntryCompleted|decimal|Specifies the opportunityEntryCompleted of the opportunityEntry.|
|opportunityEntryChanceSuccess|decimal|Specifies the opportunityEntryChanceSuccess of the opportunityEntry.|
|opportunityEntryProbability|decimal|Specifies the opportunityEntryProbability of the opportunityEntry.|
|opportunityEntrySalesCycleCode|string|Specifies the opportunityEntrySalesCycleCode of the opportunityEntry.|
|opportunityEntrySalesCycleStage|integer|Specifies the opportunityEntrySalesCycleStage of the opportunityEntry.|
|opportunityEntrySalesCycleStageDescription|string|Specifies the opportunityEntrySalesCycleStageDescription of the opportunityEntry.|
|opportunityEntryCloseOpportunityCode|string|Specifies the opportunityEntryCloseOpportunityCode of the opportunityEntry.|
|opportunityContactNo|string|Specifies the opportunityContactNo of the opportunityEntry.|

## JSON representation

Here's a JSON representation of the opportunityEntry resource.

```json
{
    "opportunityEntryEntryNo": 1001,
    "opportunityEntryOpportunity": "",
    "salespersonCode": "JR",
    "opportunityEntryActive": true,
    "opportunityEntryActionTaken": "",
    "opportunityEntryDateChange": "2026-01-15",
    "opportunityEntryEstCloseDate": "2025-12-31",
    "opportunityEntryEstValue": 100.00,
    "opportunityEntryCalcCurrentValue": 100.00,
    "opportunityEntryCompleted": 100.00,
    "opportunityEntryChanceSuccess": 100.00,
    "opportunityEntryProbability": 100.00,
    "opportunityEntrySalesCycleCode": "10000",
    "opportunityEntrySalesCycleStage": 1,
    "opportunityEntrySalesCycleStageDescription": "1",
    "opportunityEntryCloseOpportunityCode": "10000",
    "opportunityContactNo": "10000"
}
```

## Related information

[GET opportunityEntry](../api/dynamics_opportunityentry_get.md)
