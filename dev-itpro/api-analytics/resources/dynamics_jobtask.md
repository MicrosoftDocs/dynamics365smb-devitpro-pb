---
title: jobTask resource type
description: Represents a jobTask entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# jobTask resource type

Represents a job task in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobTask](../api/dynamics_jobtask_get.md)|jobTask|Gets a jobTask object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|jobNo|string|The primary key of the jobTask.|
|jobTaskNo|string|The primary key of the jobTask.|
|description|string|Specifies the description of the jobTask.|
|totaling|string|Specifies the totaling of the jobTask.|
|jobTaskType|string|Specifies the jobTaskType of the jobTask.|
|indentation|integer|Specifies the indentation of the jobTask.|
|startingDate|Date|Specifies the startingDate of the jobTask.|
|endingDate|Date|Specifies the endingDate of the jobTask.|

## JSON representation

Here's a JSON representation of the jobTask resource.

```json
{
    "jobNo": "string",
    "jobTaskNo": "string",
    "description": "string",
    "totaling": "string",
    "jobTaskType": "string",
    "indentation": "integer",
    "startingDate": "Date",
    "endingDate": "Date"
}
```

## Related information

[GET jobTask](../api/dynamics_jobtask_get.md)
