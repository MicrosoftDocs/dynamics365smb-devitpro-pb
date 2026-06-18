---
title: itemCategory resource type
description: Represents a itemCategory entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# itemCategory resource type

Represents a item category in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemCategory](../api/dynamics_itemcategory_get.md)|itemCategory|Gets a itemCategory object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The primary key of the itemCategory.|
|description|string|Specifies the description of the itemCategory.|
|parentCategory|string|Specifies the parentCategory of the itemCategory.|
|systemId|GUID|Specifies the systemId of the itemCategory.|

## JSON representation

Here's a JSON representation of the itemCategory resource.

```json
{
    "code": "DEPARTMENT",
    "description": "ATHENS Desk",
    "parentCategory": "",
    "systemId": ""
}
```

## Related information

[GET itemCategory](../api/dynamics_itemcategory_get.md)
