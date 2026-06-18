---
title: pbiSustainabilityLedgerEntry resource type
description: Represents a pbiSustainabilityLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
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
    "sustainAccountNo": "10000",
    "entryNo": 1001,
    "postingDate": "2026-01-15",
    "documentType": "Invoice",
    "emissionco2": 100.00,
    "emissionch4": 100.00,
    "emissionN2O": 100.00,
    "emissionCo2e": 100.00,
    "carbonFee": 100.00,
    "waterIntensity": 100.00,
    "dischargedIntoWater": 100.00,
    "wasteIntensity": 100.00,
    "dimensionSetID": 102,
    "responsibilityCenter": "",
    "countryRegionCode": "US",
    "description": "ATHENS Desk",
    "waterType": "",
    "waterWasteIntensityType": ""
}
```

## Related information

[GET pbiSustainabilityLedgerEntry](../api/dynamics_pbisustainabilityledgerentry_get.md)
