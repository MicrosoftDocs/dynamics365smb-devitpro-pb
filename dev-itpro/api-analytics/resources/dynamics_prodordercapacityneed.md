---
title: prodOrderCapacityNeed resource type
description: Represents a prodOrderCapacityNeed entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# prodOrderCapacityNeed resource type

Represents a prod order capacity need in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET prodOrderCapacityNeed](../api/dynamics_prodordercapacityneed_get.md)|prodOrderCapacityNeed|Gets a prodOrderCapacityNeed object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|status|string|The primary key of the prodOrderCapacityNeed.|
|prodOrderNo|string|The primary key of the prodOrderCapacityNeed.|
|routingNo|string|The primary key of the prodOrderCapacityNeed.|
|routingReferenceNo|integer|The primary key of the prodOrderCapacityNeed.|
|operationNo|string|The primary key of the prodOrderCapacityNeed.|
|allocatedTime|decimal|Specifies the allocatedTime of the prodOrderCapacityNeed.|
|requestedOnly|boolean|The primary key of the prodOrderCapacityNeed.|
|workCenterNo|string|Specifies the workCenterNo of the prodOrderCapacityNeed.|
|workCenterGroupCode|string|Specifies the workCenterGroupCode of the prodOrderCapacityNeed.|
|date|Date|Specifies the date of the prodOrderCapacityNeed.|
|no|string|Specifies the no of the prodOrderCapacityNeed.|
|type|string|Specifies the type of the prodOrderCapacityNeed.|
|neededTimeMs|decimal|Specifies the neededTimeMs of the prodOrderCapacityNeed.|
|neededTime|decimal|Specifies the neededTime of the prodOrderCapacityNeed.|
|lineNo|integer|The primary key of the prodOrderCapacityNeed.|

## JSON representation

Here's a JSON representation of the prodOrderCapacityNeed resource.

```json
{
    "status": "Released",
    "prodOrderNo": "10000",
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "operationNo": "10000",
    "allocatedTime": 100.00,
    "requestedOnly": false,
    "workCenterNo": "W100",
    "workCenterGroupCode": "W100",
    "date": "2026-01-15",
    "no": "10000",
    "type": "Item",
    "neededTimeMs": 100.00,
    "neededTime": 100.00,
    "lineNo": 10000
}
```

## Related information

[GET prodOrderCapacityNeed](../api/dynamics_prodordercapacityneed_get.md)
