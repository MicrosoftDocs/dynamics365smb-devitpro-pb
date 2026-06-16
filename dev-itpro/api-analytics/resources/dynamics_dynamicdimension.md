---
title: dynamicDimension resource type
description: Represents a dynamicDimension entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# dynamicDimension resource type

Represents a dynamic dimension in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dynamicDimension](../api/dynamics_dynamicdimension_get.md)|dynamicDimension|Gets a dynamicDimension object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|dimensionSetID|integer|The primary key of the dynamicDimension.|
|customDimensionValueCode|string|The primary key of the dynamicDimension.|
|modifiedAt|datetime|The primary key of the dynamicDimension.|
|customDimensionValueName|string|The primary key of the dynamicDimension.|
|globalDimensionNo|integer|The primary key of the dynamicDimension.|
|customDimensionName|string|The primary key of the dynamicDimension.|
|customDimensionCode|string|The primary key of the dynamicDimension.|
|modifiedAtDimensionValue|datetime|The primary key of the dynamicDimension.|
|noRows|integer|Specifies the noRows of the dynamicDimension.|

## JSON representation

Here's a JSON representation of the dynamicDimension resource.

```json
{
    "dimensionSetID": 102,
    "customDimensionValueCode": "SALES",
    "modifiedAt": "",
    "customDimensionValueName": "Sales",
    "globalDimensionNo": 1,
    "customDimensionName": "Department",
    "customDimensionCode": "DEPARTMENT",
    "modifiedAtDimensionValue": "",
    "noRows": 1
}
```

## Related information

[GET dynamicDimension](../api/dynamics_dynamicdimension_get.md)
