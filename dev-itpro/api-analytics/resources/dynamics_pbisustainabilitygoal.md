---
title: pbiSustainabilityGoal resource type
description: Represents a pbiSustainabilityGoal entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiSustainabilityGoal resource type

Represents a pbi sustainability goal in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiSustainabilityGoal](../api/dynamics_pbisustainabilitygoal_get.md)|pbiSustainabilityGoal|Gets a pbiSustainabilityGoal object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|scoreCardNo|string|The primary key of the pbiSustainabilityGoal.|
|no|string|The primary key of the pbiSustainabilityGoal.|
|lineNo|integer|The primary key of the pbiSustainabilityGoal.|
|name|string|Specifies the name of the pbiSustainabilityGoal.|
|owner|string|Specifies the owner of the pbiSustainabilityGoal.|
|countryRegion|string|Specifies the countryRegion of the pbiSustainabilityGoal.|
|responsibilityCentre|string|Specifies the responsibilityCentre of the pbiSustainabilityGoal.|
|targetValueForCo2|decimal|Specifies the targetValueForCo2 of the pbiSustainabilityGoal.|
|targetValueForCh4|decimal|Specifies the targetValueForCh4 of the pbiSustainabilityGoal.|
|targetValueForN2O|decimal|Specifies the targetValueForN2O of the pbiSustainabilityGoal.|
|targetValueForWaterIntensity|decimal|Specifies the targetValueForWaterIntensity of the pbiSustainabilityGoal.|
|targetValueForWasteIntensity|decimal|Specifies the targetValueForWasteIntensity of the pbiSustainabilityGoal.|
|mainGoal|boolean|Specifies the mainGoal of the pbiSustainabilityGoal.|
|startDate|Date|Specifies the startDate of the pbiSustainabilityGoal.|
|endDate|Date|Specifies the endDate of the pbiSustainabilityGoal.|
|baselineStartDate|Date|Specifies the baselineStartDate of the pbiSustainabilityGoal.|
|baselineEndDate|Date|Specifies the baselineEndDate of the pbiSustainabilityGoal.|

## JSON representation

Here's a JSON representation of the pbiSustainabilityGoal resource.

```json
{
    "scoreCardNo": "10000",
    "no": "10000",
    "lineNo": 10000,
    "name": "Adatum Corporation",
    "owner": "",
    "countryRegion": "",
    "responsibilityCentre": "",
    "targetValueForCo2": 100.00,
    "targetValueForCh4": 100.00,
    "targetValueForN2O": 100.00,
    "targetValueForWaterIntensity": 100.00,
    "targetValueForWasteIntensity": 100.00,
    "mainGoal": false,
    "startDate": "2026-01-01",
    "endDate": "2026-06-30",
    "baselineStartDate": "2026-01-01",
    "baselineEndDate": "2026-06-30"
}
```

## Related information

[GET pbiSustainabilityGoal](../api/dynamics_pbisustainabilitygoal_get.md)
