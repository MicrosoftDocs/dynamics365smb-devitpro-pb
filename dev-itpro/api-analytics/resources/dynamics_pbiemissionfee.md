---
title: pbiEmissionFee resource type
description: Represents a pbiEmissionFee entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# pbiEmissionFee resource type

Represents a pbi emission fee in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiEmissionFee](../api/dynamics_pbiemissionfee_get.md)|pbiEmissionFee|Gets a pbiEmissionFee object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|emissionType|string|The primary key of the pbiEmissionFee.|
|scopeType|string|The primary key of the pbiEmissionFee.|
|startingDate|Date|The primary key of the pbiEmissionFee.|
|endingDate|Date|The primary key of the pbiEmissionFee.|
|countryRegionCode|string|The primary key of the pbiEmissionFee.|
|responsibilityCentre|string|The primary key of the pbiEmissionFee.|
|carbonFee|decimal|Specifies the carbonFee of the pbiEmissionFee.|
|carbonEquivalentFactor|decimal|Specifies the carbonEquivalentFactor of the pbiEmissionFee.|

## JSON representation

Here's a JSON representation of the pbiEmissionFee resource.

```json
{
    "emissionType": "",
    "scopeType": "",
    "startingDate": "2026-01-01",
    "endingDate": "2026-06-30",
    "countryRegionCode": "US",
    "responsibilityCentre": "",
    "carbonFee": 100.00,
    "carbonEquivalentFactor": 1.00
}
```

## Related information

[GET pbiEmissionFee](../api/dynamics_pbiemissionfee_get.md)
