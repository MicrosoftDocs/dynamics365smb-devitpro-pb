---
title: inventoryAdjustmentEntryOrder resource type
description: Represents a inventoryAdjustmentEntryOrder entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# inventoryAdjustmentEntryOrder resource type

Represents a inventory adjustment entry order in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET inventoryAdjustmentEntryOrder](../api/dynamics_inventoryadjustmententryorder_get.md)|inventoryAdjustmentEntryOrder|Gets a inventoryAdjustmentEntryOrder object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|Specifies the itemNo of the inventoryAdjustmentEntryOrder.|
|orderLineNo|integer|The primary key of the inventoryAdjustmentEntryOrder.|
|orderNo|string|The primary key of the inventoryAdjustmentEntryOrder.|
|singleLevelMaterialCost|decimal|Specifies the singleLevelMaterialCost of the inventoryAdjustmentEntryOrder.|
|singleLevelCapacityCost|decimal|Specifies the singleLevelCapacityCost of the inventoryAdjustmentEntryOrder.|
|singleLevelSubcontrdCost|decimal|Specifies the singleLevelSubcontrdCost of the inventoryAdjustmentEntryOrder.|
|singleLevelCapOvhdCost|decimal|Specifies the singleLevelCapOvhdCost of the inventoryAdjustmentEntryOrder.|
|singleLevelMfgOvhdCost|decimal|Specifies the singleLevelMfgOvhdCost of the inventoryAdjustmentEntryOrder.|
|iSFinished|boolean|Specifies the iSFinished of the inventoryAdjustmentEntryOrder.|
|completelyInvoiced|boolean|Specifies the completelyInvoiced of the inventoryAdjustmentEntryOrder.|
|indirectCostPercent|decimal|Specifies the indirectCostPercent of the inventoryAdjustmentEntryOrder.|
|overheadRate|decimal|Specifies the overheadRate of the inventoryAdjustmentEntryOrder.|
|auxiliaryIndex1|string|The primary key of the inventoryAdjustmentEntryOrder.|

## JSON representation

Here's a JSON representation of the inventoryAdjustmentEntryOrder resource.

```json
{
    "itemNo": "1896-S",
    "orderLineNo": 10000,
    "orderNo": "10000",
    "singleLevelMaterialCost": 25.5,
    "singleLevelCapacityCost": 25.5,
    "singleLevelSubcontrdCost": 25.5,
    "singleLevelCapOvhdCost": 25.5,
    "singleLevelMfgOvhdCost": 25.5,
    "iSFinished": false,
    "completelyInvoiced": false,
    "indirectCostPercent": 25.5,
    "overheadRate": 1.00,
    "auxiliaryIndex1": ""
}
```

## Related information

[GET inventoryAdjustmentEntryOrder](../api/dynamics_inventoryadjustmententryorder_get.md)
