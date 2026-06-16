---
title: prodOrderRoutingLine resource type
description: Represents a prodOrderRoutingLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# prodOrderRoutingLine resource type

Represents a prod order routing line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET prodOrderRoutingLine](../api/dynamics_prodorderroutingline_get.md)|prodOrderRoutingLine|Gets a prodOrderRoutingLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|routingStatus|string|The primary key of the prodOrderRoutingLine.|
|status|string|The primary key of the prodOrderRoutingLine.|
|prodOrderNo|string|The primary key of the prodOrderRoutingLine.|
|type|string|The primary key of the prodOrderRoutingLine.|
|no|string|The primary key of the prodOrderRoutingLine.|
|description|string|The primary key of the prodOrderRoutingLine.|
|locationCode|string|The primary key of the prodOrderRoutingLine.|
|expectedCapacityNeed|decimal|Specifies the expectedCapacityNeed of the prodOrderRoutingLine.|
|expectedOperationCostAmt|decimal|Specifies the expectedOperationCostAmt of the prodOrderRoutingLine.|
|expectedCapacityOvhdCost|decimal|Specifies the expectedCapacityOvhdCost of the prodOrderRoutingLine.|
|endingDate|Date|The primary key of the prodOrderRoutingLine.|
|routingNo|string|The primary key of the prodOrderRoutingLine.|
|routingReferenceNo|integer|The primary key of the prodOrderRoutingLine.|
|operationNo|string|The primary key of the prodOrderRoutingLine.|
|workCenterNo|string|The primary key of the prodOrderRoutingLine.|
|workCenterGroupCode|string|The primary key of the prodOrderRoutingLine.|
|routingLinkCode|string|The primary key of the prodOrderRoutingLine.|
|setupTime|decimal|The primary key of the prodOrderRoutingLine.|
|runTime|decimal|The primary key of the prodOrderRoutingLine.|
|waitTime|decimal|The primary key of the prodOrderRoutingLine.|
|moveTime|decimal|The primary key of the prodOrderRoutingLine.|
|startingDateTime|datetime|The primary key of the prodOrderRoutingLine.|
|endingDateTime|datetime|The primary key of the prodOrderRoutingLine.|
|locationName|string|The primary key of the prodOrderRoutingLine.|

## JSON representation

Here's a JSON representation of the prodOrderRoutingLine resource.

```json
{
    "routingStatus": "Released",
    "status": "Released",
    "prodOrderNo": "10000",
    "type": "Item",
    "no": "10000",
    "description": "ATHENS Desk",
    "locationCode": "BLUE",
    "expectedCapacityNeed": 100.00,
    "expectedOperationCostAmt": 25.5,
    "expectedCapacityOvhdCost": 25.5,
    "endingDate": "2026-06-30",
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "operationNo": "10000",
    "workCenterNo": "W100",
    "workCenterGroupCode": "W100",
    "routingLinkCode": "10000",
    "setupTime": 100.00,
    "runTime": 100.00,
    "waitTime": 100.00,
    "moveTime": 100.00,
    "startingDateTime": "",
    "endingDateTime": "",
    "locationName": "Blue Warehouse"
}
```

## Related information

[GET prodOrderRoutingLine](../api/dynamics_prodorderroutingline_get.md)
