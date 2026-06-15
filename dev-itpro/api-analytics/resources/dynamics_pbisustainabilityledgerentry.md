---
title: pbiSustainabilityLedgerEntry resource type
description: Represents a pbiSustainabilityLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiSustainabilityLedgerEntry resource type

Represents a pbi sustainability ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiSustainabilityLedgerEntry](../api/dynamics_pbisustainabilityledgerentry_get.md)|pbiSustainabilityLedgerEntry|Gets a pbiSustainabilityLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|sustainAccountNo|string|Specifies the sustainAccountNo of the pbiSustainabilityLedgerEntry.|
|entryNo|integer|The primary key of the pbiSustainabilityLedgerEntry.|
|postingDate|Date|Specifies the postingDate of the pbiSustainabilityLedgerEntry.|
|documentType|string|Specifies the documentType of the pbiSustainabilityLedgerEntry.|
|emissionco2|decimal|Specifies the emissionco2 of the pbiSustainabilityLedgerEntry.|
|emissionch4|decimal|Specifies the emissionch4 of the pbiSustainabilityLedgerEntry.|
|emissionN2O|decimal|Specifies the emissionN2O of the pbiSustainabilityLedgerEntry.|
|emissionCo2e|decimal|Specifies the emissionCo2e of the pbiSustainabilityLedgerEntry.|
|carbonFee|decimal|Specifies the carbonFee of the pbiSustainabilityLedgerEntry.|
|waterIntensity|decimal|Specifies the waterIntensity of the pbiSustainabilityLedgerEntry.|
|dischargedIntoWater|decimal|Specifies the dischargedIntoWater of the pbiSustainabilityLedgerEntry.|
|wasteIntensity|decimal|Specifies the wasteIntensity of the pbiSustainabilityLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the pbiSustainabilityLedgerEntry.|
|responsibilityCenter|string|Specifies the responsibilityCenter of the pbiSustainabilityLedgerEntry.|
|countryRegionCode|string|Specifies the countryRegionCode of the pbiSustainabilityLedgerEntry.|
|description|string|Specifies the description of the pbiSustainabilityLedgerEntry.|
|waterType|string|Specifies the waterType of the pbiSustainabilityLedgerEntry.|
|waterWasteIntensityType|string|Specifies the waterWasteIntensityType of the pbiSustainabilityLedgerEntry.|

## JSON representation

Here's a JSON representation of the pbiSustainabilityLedgerEntry resource.

```json
{
    "sustainAccountNo": "string",
    "entryNo": "integer",
    "postingDate": "Date",
    "documentType": "string",
    "emissionco2": "decimal",
    "emissionch4": "decimal",
    "emissionN2O": "decimal",
    "emissionCo2e": "decimal",
    "carbonFee": "decimal",
    "waterIntensity": "decimal",
    "dischargedIntoWater": "decimal",
    "wasteIntensity": "decimal",
    "dimensionSetID": "integer",
    "responsibilityCenter": "string",
    "countryRegionCode": "string",
    "description": "string",
    "waterType": "string",
    "waterWasteIntensityType": "string"
}
```

## Related information

[GET pbiSustainabilityLedgerEntry](../api/dynamics_pbisustainabilityledgerentry_get.md)
