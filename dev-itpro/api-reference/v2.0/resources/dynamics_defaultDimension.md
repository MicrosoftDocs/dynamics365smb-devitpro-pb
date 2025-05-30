---
title: defaultDimension resource type  
description: A default dimensions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# defaultDimension resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a default dimensions in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET defaultDimension](../api/dynamics_defaultdimension_get.md)|defaultDimension|Gets a default dimensions object.|
|[DELETE defaultDimension](../api/dynamics_defaultdimension_delete.md)|none|Deletes a default dimensions object.|
|[POST defaultDimension](../api/dynamics_defaultdimension_create.md)|defaultDimension|Creates a default dimensions object.|
|[PATCH defaultDimension](../api/dynamics_defaultdimension_update.md)|defaultDimension|Updates a default dimensions object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[item](dynamics_item.md)|item |Gets the item of the defaultDimension.|
|[account](dynamics_account.md)|account |Gets the account of the defaultDimension.|
|[dimension](dynamics_dimension.md)|dimension |Gets the dimension of the defaultDimension.|
|[dimensionValue](dynamics_dimensionvalue.md)|dimensionValue |Gets the dimensionvalue of the defaultDimension.|
|[customer](dynamics_customer.md)|customer |Gets the customer of the defaultDimension.|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the defaultDimension.|
|[employee](dynamics_employee.md)|employee |Gets the employee of the defaultDimension.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the default dimensions. Non-editable.|
|parentType|NAV.defaultDimensionParentType|The type of the parent document of the default dimensions. It can be " ", "Customer", "Item", "Vendor" or "Employee".|
|parentId|GUID|The ID of the parent entity. |
|dimensionId|GUID|The unique ID of dimension.|
|dimensionCode|string|The dimension code.|
|dimensionValueId|GUID|The unique ID of the dimension value.|
|dimensionValueCode|string|The dimension value code.  |
|postingValidation|NAV.defaultDimensionValuePostingType|Specifies how default dimensions and their values must be used. It can be " ", "Code_Mandatory", "Same_Code" or "No_Code".|
|lastModifiedDateTime|datetime|The last datetime the default dimensions was modified. Read-Only.|

## JSON representation

Here's a JSON representation of the defaultDimension resource.


```json
{
    "id": "GUID",
    "parentType": "NAV.defaultDimensionParentType",
    "parentId": "GUID",
    "dimensionId": "GUID",
    "dimensionCode": "string",
    "dimensionValueId": "GUID",
    "dimensionValueCode": "string",
    "postingValidation": "NAV.defaultDimensionValuePostingType",
    "lastModifiedDateTime": "datetime"
}
```

## Related information

[GET defaultDimension](../api/dynamics_defaultDimension_Get.md)  
[DELETE defaultDimension](../api/dynamics_defaultDimension_Delete.md)  
[POST defaultDimension](../api/dynamics_defaultDimension_Create.md)  
[PATCH defaultDimension](../api/dynamics_defaultDimension_Update.md)
