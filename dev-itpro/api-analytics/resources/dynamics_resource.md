---
title: resource resource type
description: Represents a resource entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# resource resource type

Represents a resource in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET resource](../api/dynamics_resource_get.md)|resource|Gets a resource object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|resourceNo|string|The primary key of the resource.|
|resourceName|string|Specifies the resourceName of the resource.|
|baseUnitofMeasure|string|Specifies the baseUnitofMeasure of the resource.|
|unitCost|decimal|Specifies the unitCost of the resource.|
|unitPrice|decimal|Specifies the unitPrice of the resource.|

## JSON representation

Here's a JSON representation of the resource resource.

```json
{
    "resourceNo": "string",
    "resourceName": "string",
    "baseUnitofMeasure": "string",
    "unitCost": "decimal",
    "unitPrice": "decimal"
}
```

## Related information

[GET resource](../api/dynamics_resource_get.md)
