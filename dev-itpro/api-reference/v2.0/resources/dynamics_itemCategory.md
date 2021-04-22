---
title: itemCategory resource type | Microsoft Docs
description: An item category object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# itemCategory resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an item category in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemCategory](../api/dynamics_itemcategory_get.md)|itemCategory|Gets a item category object.|
|[DELETE itemCategory](../api/dynamics_itemcategory_delete.md)|none|Deletes a item category object.|
|[POST itemCategory](../api/dynamics_itemcategory_create.md)|itemCategory|Creates a item category object.|
|[PATCH itemCategory](../api/dynamics_itemcategory_update.md)|itemCategory|Updates a item category object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item category. Non-editable.|
|code|string|The code of the item category.|
|displayName|string|Specifies the item category's name. This name will appear on all sales documents for the item category.|
|lastModifiedDateTime|datetime|The last datetime the item category was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the itemCategory resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET itemCategory](../api/dynamics_itemCategory_Get.md)
[DELETE itemCategory](../api/dynamics_itemCategory_Delete.md)
[POST itemCategory](../api/dynamics_itemCategory_Create.md)
[PATCH itemCategory](../api/dynamics_itemCategory_Update.md)
