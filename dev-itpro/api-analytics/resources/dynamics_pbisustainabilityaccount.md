---
title: pbiSustainabilityAccount resource type
description: Represents a pbiSustainabilityAccount entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiSustainabilityAccount resource type

Represents a pbi sustainability account in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiSustainabilityAccount](../api/dynamics_pbisustainabilityaccount_get.md)|pbiSustainabilityAccount|Gets a pbiSustainabilityAccount object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|sustainabilityAccountNo|string|The primary key of the pbiSustainabilityAccount.|
|sustainabilityAccountName|string|Specifies the sustainabilityAccountName of the pbiSustainabilityAccount.|
|sustainabilityAccountCategory|string|Specifies the sustainabilityAccountCategory of the pbiSustainabilityAccount.|
|sustainabilityAccountSubCategory|string|Specifies the sustainabilityAccountSubCategory of the pbiSustainabilityAccount.|

## JSON representation

Here's a JSON representation of the pbiSustainabilityAccount resource.

```json
{
    "sustainabilityAccountNo": "10000",
    "sustainabilityAccountName": "Adatum Corporation",
    "sustainabilityAccountCategory": "",
    "sustainabilityAccountSubCategory": ""
}
```

## Related information

[GET pbiSustainabilityAccount](../api/dynamics_pbisustainabilityaccount_get.md)
