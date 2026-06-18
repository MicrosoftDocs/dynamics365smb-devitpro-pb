---
title: assemblyHeader resource type
description: Represents a assemblyHeader entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# assemblyHeader resource type

Represents a assembly header in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET assemblyHeader](../api/dynamics_assemblyheader_get.md)|assemblyHeader|Gets a assemblyHeader object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|documentNo|string|The primary key of the assemblyHeader.|
|itemNo|string|The primary key of the assemblyHeader.|
|quantity|decimal|Specifies the quantity of the assemblyHeader.|
|remainingQtyBase|decimal|Specifies the remainingQtyBase of the assemblyHeader.|
|dueDate|Date|The primary key of the assemblyHeader.|
|locationCode|string|The primary key of the assemblyHeader.|
|dimensionSetID|integer|The primary key of the assemblyHeader.|
|status|string|The primary key of the assemblyHeader.|
|qtyPerUnitOfMeasure|decimal|The primary key of the assemblyHeader.|
|unitOfMeasureCode|string|The primary key of the assemblyHeader.|

## JSON representation

Here's a JSON representation of the assemblyHeader resource.

```json
{
    "documentNo": "103001",
    "itemNo": "1896-S",
    "quantity": 10.00,
    "remainingQtyBase": 10.00,
    "dueDate": "2026-02-28",
    "locationCode": "BLUE",
    "dimensionSetID": 102,
    "status": "Released",
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET assemblyHeader](../api/dynamics_assemblyheader_get.md)
