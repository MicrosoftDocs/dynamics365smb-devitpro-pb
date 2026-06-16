---
title: assemblyLine resource type
description: Represents a assemblyLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# assemblyLine resource type

Represents a assembly line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET assemblyLine](../api/dynamics_assemblyline_get.md)|assemblyLine|Gets a assemblyLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|The primary key of the assemblyLine.|
|remainingQuantity|decimal|Specifies the remainingQuantity of the assemblyLine.|
|dueDate|Date|The primary key of the assemblyLine.|
|locationCode|string|The primary key of the assemblyLine.|
|documentNo|string|The primary key of the assemblyLine.|
|dimensionSetID|integer|The primary key of the assemblyLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the assemblyLine.|
|unitOfMeasureCode|string|The primary key of the assemblyLine.|

## JSON representation

Here's a JSON representation of the assemblyLine resource.

```json
{
    "itemNo": "1896-S",
    "remainingQuantity": 10.00,
    "dueDate": "2026-02-28",
    "locationCode": "BLUE",
    "documentNo": "103001",
    "dimensionSetID": 102,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET assemblyLine](../api/dynamics_assemblyline_get.md)
