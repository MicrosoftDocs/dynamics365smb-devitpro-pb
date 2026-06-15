---
title: item resource type
description: Represents a item entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# item resource type

Represents a item in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET item](../api/dynamics_item_get.md)|item|Gets a item object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemNo|string|The primary key of the item.|
|itemDescription|string|Specifies the itemDescription of the item.|
|baseUnitofMeasure|string|Specifies the baseUnitofMeasure of the item.|
|unitCost|decimal|Specifies the unitCost of the item.|
|inventoryPostingGroup|string|Specifies the inventoryPostingGroup of the item.|
|routingNo|string|Specifies the routingNo of the item.|
|productionBomNo|string|Specifies the productionBomNo of the item.|
|replenishmentSystem|string|Specifies the replenishmentSystem of the item.|
|singleLevelCapOvhdCost|decimal|Specifies the singleLevelCapOvhdCost of the item.|
|singleLevelCapacityCost|decimal|Specifies the singleLevelCapacityCost of the item.|
|singleLevelMaterialCost|decimal|Specifies the singleLevelMaterialCost of the item.|
|singleLevelMfgOvhdCost|decimal|Specifies the singleLevelMfgOvhdCost of the item.|
|singleLevelSubcontrdCost|decimal|Specifies the singleLevelSubcontrdCost of the item.|
|singleLvlMatNonInvtCost|decimal|Specifies the singleLvlMatNonInvtCost of the item.|
|rolledUpCapOverheadCost|decimal|Specifies the rolledUpCapOverheadCost of the item.|
|rolledUpCapacityCost|decimal|Specifies the rolledUpCapacityCost of the item.|
|rolledUpMatNonInvtCost|decimal|Specifies the rolledUpMatNonInvtCost of the item.|
|rolledUpMaterialCost|decimal|Specifies the rolledUpMaterialCost of the item.|
|rolledUpMfgOvhdCost|decimal|Specifies the rolledUpMfgOvhdCost of the item.|
|rolledUpSubcontractedCost|decimal|Specifies the rolledUpSubcontractedCost of the item.|
|scrapPrc|decimal|Specifies the scrapPrc of the item.|
|itemCategoryCode|string|Specifies the itemCategoryCode of the item.|
|itemCategoryDescription|string|Specifies the itemCategoryDescription of the item.|

## JSON representation

Here's a JSON representation of the item resource.

```json
{
    "itemNo": "string",
    "itemDescription": "string",
    "baseUnitofMeasure": "string",
    "unitCost": "decimal",
    "inventoryPostingGroup": "string",
    "routingNo": "string",
    "productionBomNo": "string",
    "replenishmentSystem": "string",
    "singleLevelCapOvhdCost": "decimal",
    "singleLevelCapacityCost": "decimal",
    "singleLevelMaterialCost": "decimal",
    "singleLevelMfgOvhdCost": "decimal",
    "singleLevelSubcontrdCost": "decimal",
    "singleLvlMatNonInvtCost": "decimal",
    "rolledUpCapOverheadCost": "decimal",
    "rolledUpCapacityCost": "decimal",
    "rolledUpMatNonInvtCost": "decimal",
    "rolledUpMaterialCost": "decimal",
    "rolledUpMfgOvhdCost": "decimal",
    "rolledUpSubcontractedCost": "decimal",
    "scrapPrc": "decimal",
    "itemCategoryCode": "string",
    "itemCategoryDescription": "string"
}
```

## Related information

[GET item](../api/dynamics_item_get.md)
