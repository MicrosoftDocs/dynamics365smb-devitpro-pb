---
title: incomeStatement resource type  
description: An income statement object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# incomeStatement resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents an income statement in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET incomeStatement](../api/dynamics_incomestatement_get.md)|incomeStatement|Gets a income statement object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the income statement. Non-editable.|
|lineNumber|integer|The income statement item line number.|
|display|string|The income statement item display name.|
|netChange|decimal|The income statement net change. |
|lineType|string|The type of the income statement.|
|indentation|integer|The income statement item indentation used in report layout.|
|dateFilter|date|The date filter used to calculate the income statement items.|

## JSON representation

Here's a JSON representation of the incomeStatement resource.


```json
{
    "id": "GUID",
    "lineNumber": "integer",
    "display": "string",
    "netChange": "decimal",
    "lineType": "string",
    "indentation": "integer",
    "dateFilter": "date"
}
```

## Related information

[GET incomeStatement](../api/dynamics_incomeStatement_Get.md)
