---
title: manufacturingProductionOrder resource type
description: Represents a manufacturingProductionOrder entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# manufacturingProductionOrder resource type

Represents a manufacturing production order in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET manufacturingProductionOrder](../api/dynamics_manufacturingproductionorder_get.md)|manufacturingProductionOrder|Gets a manufacturingProductionOrder object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|status|string|The primary key of the manufacturingProductionOrder.|
|no|string|The primary key of the manufacturingProductionOrder.|
|sourceType|string|Specifies the sourceType of the manufacturingProductionOrder.|
|sourceNo|string|Specifies the sourceNo of the manufacturingProductionOrder.|
|routingNo|string|Specifies the routingNo of the manufacturingProductionOrder.|
|startingDate|Date|Specifies the startingDate of the manufacturingProductionOrder.|
|endingDate|Date|Specifies the endingDate of the manufacturingProductionOrder.|
|dueDate|Date|Specifies the dueDate of the manufacturingProductionOrder.|
|quantity|decimal|Specifies the quantity of the manufacturingProductionOrder.|
|description|string|Specifies the description of the manufacturingProductionOrder.|

## JSON representation

Here's a JSON representation of the manufacturingProductionOrder resource.

```json
{
    "status": "string",
    "no": "string",
    "sourceType": "string",
    "sourceNo": "string",
    "routingNo": "string",
    "startingDate": "Date",
    "endingDate": "Date",
    "dueDate": "Date",
    "quantity": "decimal",
    "description": "string"
}
```

## Related information

[GET manufacturingProductionOrder](../api/dynamics_manufacturingproductionorder_get.md)
