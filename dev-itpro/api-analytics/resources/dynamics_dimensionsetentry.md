---
title: dimensionSetEntry resource type
description: Represents a dimensionSetEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# dimensionSetEntry resource type

Represents a dimension set entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dimensionSetEntry](../api/dynamics_dimensionsetentry_get.md)|dimensionSetEntry|Gets a dimensionSetEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the dimensionSetEntry. Non-editable.|
|dimensionSetID|integer|The primary key of the dimensionSetEntry.|
|valueCount|integer|Specifies the valueCount of the dimensionSetEntry.|
|dimension1ValueCode|string|Specifies the dimension1ValueCode of the dimensionSetEntry.|
|dimension1ValueName|string|Specifies the dimension1ValueName of the dimensionSetEntry.|
|dimension2ValueCode|string|Specifies the dimension2ValueCode of the dimensionSetEntry.|
|dimension2ValueName|string|Specifies the dimension2ValueName of the dimensionSetEntry.|
|dimension3ValueCode|string|Specifies the dimension3ValueCode of the dimensionSetEntry.|
|dimension3ValueName|string|Specifies the dimension3ValueName of the dimensionSetEntry.|
|dimension4ValueCode|string|Specifies the dimension4ValueCode of the dimensionSetEntry.|
|dimension4ValueName|string|Specifies the dimension4ValueName of the dimensionSetEntry.|
|dimension5ValueCode|string|Specifies the dimension5ValueCode of the dimensionSetEntry.|
|dimension5ValueName|string|Specifies the dimension5ValueName of the dimensionSetEntry.|
|dimension6ValueCode|string|Specifies the dimension6ValueCode of the dimensionSetEntry.|
|dimension6ValueName|string|Specifies the dimension6ValueName of the dimensionSetEntry.|
|dimension7ValueCode|string|Specifies the dimension7ValueCode of the dimensionSetEntry.|
|dimension7ValueName|string|Specifies the dimension7ValueName of the dimensionSetEntry.|
|dimension8ValueCode|string|Specifies the dimension8ValueCode of the dimensionSetEntry.|
|dimension8ValueName|string|Specifies the dimension8ValueName of the dimensionSetEntry.|

## JSON representation

Here's a JSON representation of the dimensionSetEntry resource.

```json
{
    "id": "",
    "dimensionSetID": 102,
    "valueCount": 1,
    "dimension1ValueCode": "10000",
    "dimension1ValueName": "Adatum Corporation",
    "dimension2ValueCode": "10000",
    "dimension2ValueName": "Adatum Corporation",
    "dimension3ValueCode": "10000",
    "dimension3ValueName": "Adatum Corporation",
    "dimension4ValueCode": "10000",
    "dimension4ValueName": "Adatum Corporation",
    "dimension5ValueCode": "10000",
    "dimension5ValueName": "Adatum Corporation",
    "dimension6ValueCode": "10000",
    "dimension6ValueName": "Adatum Corporation",
    "dimension7ValueCode": "10000",
    "dimension7ValueName": "Adatum Corporation",
    "dimension8ValueCode": "10000",
    "dimension8ValueName": "Adatum Corporation"
}
```

## Related information

[GET dimensionSetEntry](../api/dynamics_dimensionsetentry_get.md)
