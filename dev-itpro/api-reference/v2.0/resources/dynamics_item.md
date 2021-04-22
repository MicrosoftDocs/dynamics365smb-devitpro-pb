---
title: item resource type | Microsoft Docs
description: An item object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/29/2021
ms.author: solsen
---

# item resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an item in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET item](../api/dynamics_item_get.md)|item|Gets a item object.|
|[DELETE item](../api/dynamics_item_delete.md)|none|Deletes a item object.|
|[POST item](../api/dynamics_item_create.md)|item|Creates a item object.|
|[PATCH item](../api/dynamics_item_update.md)|item|Updates a item object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[itemCategory](dynamics_itemcategory.md)|itemCategory |Gets the itemcategory of the item.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the item.|
|[picture](dynamics_picture.md)|picture |Gets the picture of the item.|
|[defaultDimensions](dynamics_defaultdimension.md)|defaultDimensions |Gets the defaultdimensions of the item.|
|[itemVariants](dynamics_itemvariant.md)|itemVariants |Gets the itemvariants of the item.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item. Non-editable.|
|number|string|Specifies the number of the item.|
|displayName|string|Specifies the item's name. This name will appear on all sales documents for the item.|
|type|NAV.itemType|Specifies the type of the item. It can be "Inventory", "Service" or "Non-Inventory".|
|itemCategoryId|GUID|The ID of the item category in the item.|
|itemCategoryCode|string|The code of the item category in the item.|
|blocked|boolean|Specifies that entries cannot be posted to the item. **True** indicates account is blocked and posting is not allowed.|
|gtin|string|This is the Global Trade Item Number. |
|inventory|decimal|Specifies how many units, such as pieces, boxes, or cans, of the item are in inventory. Read-Only.|
|unitPrice|decimal|Specifies the price for one unit of the item in the specified item.|
|priceIncludesTax|boolean|Specifies that the unitPrice includes tax. Set to **true**, if unitPrice includes tax.|
|unitCost|decimal|The unit cost of each individual item in the item.|
|taxGroupId|GUID|Specifies the ID of the Tax Group for the item. |
|taxGroupCode|string|A Tax Group represents a group of inventory items or resources that are subject to identical tax terms.|
|baseUnitOfMeasureId|GUID|Specifies the ID of the unit of measure.|
|baseUnitOfMeasureCode|string|The item's base unit of measure code.|
|lastModifiedDateTime|datetime|The last datetime the item was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the item resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "type": "NAV.itemType",
    "itemCategoryId": "GUID",
    "itemCategoryCode": "string",
    "blocked": "boolean",
    "gtin": "string",
    "inventory": "decimal",
    "unitPrice": "decimal",
    "priceIncludesTax": "boolean",
    "unitCost": "decimal",
    "taxGroupId": "GUID",
    "taxGroupCode": "string",
    "baseUnitOfMeasureId": "GUID",
    "baseUnitOfMeasureCode": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET item](../api/dynamics_item_Get.md)
[DELETE item](../api/dynamics_item_Delete.md)
[POST item](../api/dynamics_item_Create.md)
[PATCH item](../api/dynamics_item_Update.md)
