---
title: accountCategory resource type
description: Represents a accountCategory entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# accountCategory resource type

Represents a account category in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET accountCategory](../api/dynamics_accountcategory_get.md)|accountCategory|Gets a accountCategory object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|powerBIAccCategory|string|The primary key of the accountCategory.|
|glAccCategoryEntryNo|integer|Specifies the glAccCategoryEntryNo of the accountCategory.|
|parentAccCategoryEntryNo|integer|Specifies the parentAccCategoryEntryNo of the accountCategory.|

## JSON representation

Here's a JSON representation of the accountCategory resource.

```json
{
    "powerBIAccCategory": "",
    "glAccCategoryEntryNo": 1001,
    "parentAccCategoryEntryNo": 1002
}
```

## Related information

[GET accountCategory](../api/dynamics_accountcategory_get.md)
