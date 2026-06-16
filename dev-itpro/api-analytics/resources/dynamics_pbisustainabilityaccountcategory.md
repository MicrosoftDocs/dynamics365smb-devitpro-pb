---
title: pbiSustainabilityAccountCategory resource type
description: Represents a pbiSustainabilityAccountCategory entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiSustainabilityAccountCategory resource type

Represents a pbi sustainability account category in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiSustainabilityAccountCategory](../api/dynamics_pbisustainabilityaccountcategory_get.md)|pbiSustainabilityAccountCategory|Gets a pbiSustainabilityAccountCategory object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The primary key of the pbiSustainabilityAccountCategory.|
|description|string|Specifies the description of the pbiSustainabilityAccountCategory.|
|emissionScope|string|Specifies the emissionScope of the pbiSustainabilityAccountCategory.|

## JSON representation

Here's a JSON representation of the pbiSustainabilityAccountCategory resource.

```json
{
    "code": "DEPARTMENT",
    "description": "ATHENS Desk",
    "emissionScope": ""
}
```

## Related information

[GET pbiSustainabilityAccountCategory](../api/dynamics_pbisustainabilityaccountcategory_get.md)
