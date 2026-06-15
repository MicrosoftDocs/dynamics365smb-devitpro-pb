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
    "routingStatus": "string",
    "status": "string",
    "prodOrderNo": "string",
    "type": "string",
    "no": "string",
    "description": "string",
    "locationCode": "string",
    "expectedCapacityNeed": "decimal",
    "expectedOperationCostAmt": "decimal",
    "expectedCapacityOvhdCost": "decimal",
    "endingDate": "Date",
    "routingNo": "string",
    "routingReferenceNo": "integer",
    "operationNo": "string",
    "workCenterNo": "string",
    "workCenterGroupCode": "string",
    "routingLinkCode": "string",
    "setupTime": "decimal",
    "runTime": "decimal",
    "waitTime": "decimal",
    "moveTime": "decimal",
    "startingDateTime": "datetime",
    "endingDateTime": "datetime",
    "locationName": "string"
}
```

## Related information

[GET prodOrderRoutingLine](../api/dynamics_prodorderroutingline_get.md)
