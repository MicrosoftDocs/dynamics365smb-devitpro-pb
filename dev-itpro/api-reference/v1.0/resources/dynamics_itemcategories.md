---
title: (v1.0) itemCategories resource type
description: (v1.0) An item category in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# itemCategories resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a category for a number of items in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                          | Return Type  |Description             |
|:----------------------------------------------------------------|:-------------|:-----------------------|
|[GET itemCategories](../api/dynamics_itemcategories_get.md)      |itemCategories|Get an item category.   |
|[POST itemCategories](../api/dynamics_create_itemcategories.md)  |itemCategories|Create an item category.|
|[PATCH itemCategories](../api/dynamics_itemcategories_update.md) |itemCategories|Update an item category.|
|[DELETE itemCategories](../api/dynamics_itemcategories_delete.md)|none          |Delete an item category.|

## Properties

| Property           | Type   |Description                                     |
|:-------------------|:-------|:-----------------------------------------------|
|id                  |GUID    |The unique ID of the itemCategory. Non-editable.|
|code                |string  |The itemCategory code.                          |
|displayName         |string  |The itemCategories display name.                |
|lastModifiedDateTime|datetime|The last datetime the itemCategory was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the itemCategories.

```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "lastModifiedDateTime": "datetime"
}
```

## See also



[Error Codes](../dynamics_error_codes.md)  
[Get Item Categories](../api/dynamics_itemcategories_get.md)  
[Create Item Categories](../api/dynamics_create_itemcategories.md)  
[Update Item Categories](../api/dynamics_itemcategories_update.md)  
[Delete Item Categories](../api/dynamics_itemcategories_delete.md)  