---
title: closeOpportunityCode resource type
description: Represents a closeOpportunityCode entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# closeOpportunityCode resource type

Represents a close opportunity code in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET closeOpportunityCode](../api/dynamics_closeopportunitycode_get.md)|closeOpportunityCode|Gets a closeOpportunityCode object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|closeOpportunityCode|string|The primary key of the closeOpportunityCode.|
|closeOpportunityType|string|Specifies the closeOpportunityType of the closeOpportunityCode.|
|closeOpportunityDescription|string|Specifies the closeOpportunityDescription of the closeOpportunityCode.|

## JSON representation

Here's a JSON representation of the closeOpportunityCode resource.

```json
{
    "closeOpportunityCode": "10000",
    "closeOpportunityType": "",
    "closeOpportunityDescription": "Standard posting"
}
```

## Related information

[GET closeOpportunityCode](../api/dynamics_closeopportunitycode_get.md)
