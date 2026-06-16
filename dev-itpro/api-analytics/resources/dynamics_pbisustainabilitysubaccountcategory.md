---
title: pbiSustainabilitySubAccountCategory resource type
description: Represents a pbiSustainabilitySubAccountCategory entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiSustainabilitySubAccountCategory resource type

Represents a pbi sustainability sub account category in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiSustainabilitySubAccountCategory](../api/dynamics_pbisustainabilitysubaccountcategory_get.md)|pbiSustainabilitySubAccountCategory|Gets a pbiSustainabilitySubAccountCategory object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|categoryCode|string|The primary key of the pbiSustainabilitySubAccountCategory.|
|subcategoryCode|string|The primary key of the pbiSustainabilitySubAccountCategory.|
|subCategoryDescription|string|Specifies the subCategoryDescription of the pbiSustainabilitySubAccountCategory.|
|subCategoryRenewableEnergy|boolean|Specifies the subCategoryRenewableEnergy of the pbiSustainabilitySubAccountCategory.|

## JSON representation

Here's a JSON representation of the pbiSustainabilitySubAccountCategory resource.

```json
{
    "categoryCode": "10000",
    "subcategoryCode": "10000",
    "subCategoryDescription": "Standard posting",
    "subCategoryRenewableEnergy": false
}
```

## Related information

[GET pbiSustainabilitySubAccountCategory](../api/dynamics_pbisustainabilitysubaccountcategory_get.md)
