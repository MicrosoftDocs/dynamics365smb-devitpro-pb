---
title: planningComponentLine resource type
description: Represents a planningComponentLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# planningComponentLine resource type

Represents a planning component line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET planningComponentLine](../api/dynamics_planningcomponentline_get.md)|planningComponentLine|Gets a planningComponentLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|The primary key of the planningComponentLine.|
|dueDate|Date|The primary key of the planningComponentLine.|
|locationCode|string|The primary key of the planningComponentLine.|
|expectedQuantityBase|decimal|Specifies the expectedQuantityBase of the planningComponentLine.|
|dimensionSetID|integer|The primary key of the planningComponentLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the planningComponentLine.|
|unitOfMeasureCode|string|The primary key of the planningComponentLine.|

## JSON representation

Here's a JSON representation of the planningComponentLine resource.

```json
{
    "itemNo": "string",
    "dueDate": "Date",
    "locationCode": "string",
    "expectedQuantityBase": "decimal",
    "dimensionSetID": "integer",
    "qtyPerUnitOfMeasure": "decimal",
    "unitOfMeasureCode": "string"
}
```

## Related information

[GET planningComponentLine](../api/dynamics_planningcomponentline_get.md)
