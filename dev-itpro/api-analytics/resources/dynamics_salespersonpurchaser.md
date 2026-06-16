---
title: salespersonPurchaser resource type
description: Represents a salespersonPurchaser entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salespersonPurchaser resource type

Represents a salesperson purchaser in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salespersonPurchaser](../api/dynamics_salespersonpurchaser_get.md)|salespersonPurchaser|Gets a salespersonPurchaser object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|salespersonPurchaserCode|string|The primary key of the salespersonPurchaser.|
|salespersonPurchaserName|string|Specifies the salespersonPurchaserName of the salespersonPurchaser.|

## JSON representation

Here's a JSON representation of the salespersonPurchaser resource.

```json
{
    "salespersonPurchaserCode": "JR",
    "salespersonPurchaserName": "JR"
}
```

## Related information

[GET salespersonPurchaser](../api/dynamics_salespersonpurchaser_get.md)
