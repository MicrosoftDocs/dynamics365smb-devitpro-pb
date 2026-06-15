---
title: pbiCountryRegion resource type
description: Represents a pbiCountryRegion entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# pbiCountryRegion resource type

Represents a pbi country region in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pbiCountryRegion](../api/dynamics_pbicountryregion_get.md)|pbiCountryRegion|Gets a pbiCountryRegion object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The primary key of the pbiCountryRegion.|
|name|string|Specifies the name of the pbiCountryRegion.|

## JSON representation

Here's a JSON representation of the pbiCountryRegion resource.

```json
{
    "code": "string",
    "name": "string"
}
```

## Related information

[GET pbiCountryRegion](../api/dynamics_pbicountryregion_get.md)
