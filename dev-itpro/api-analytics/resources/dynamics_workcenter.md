---
title: workCenter resource type
description: Represents a workCenter entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# workCenter resource type

Represents a work center in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET workCenter](../api/dynamics_workcenter_get.md)|workCenter|Gets a workCenter object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|no|string|The primary key of the workCenter.|
|name|string|Specifies the name of the workCenter.|
|workCenterGroupCode|string|Specifies the workCenterGroupCode of the workCenter.|
|subcontractorNo|string|Specifies the subcontractorNo of the workCenter.|
|unitOfMeasureCode|string|Specifies the unitOfMeasureCode of the workCenter.|
|workCenterGroupName|string|Specifies the workCenterGroupName of the workCenter.|

## JSON representation

Here's a JSON representation of the workCenter resource.

```json
{
    "no": "10000",
    "name": "Adatum Corporation",
    "workCenterGroupCode": "W100",
    "subcontractorNo": "10000",
    "unitOfMeasureCode": "PCS",
    "workCenterGroupName": "Adatum Corporation"
}
```

## Related information

[GET workCenter](../api/dynamics_workcenter_get.md)
