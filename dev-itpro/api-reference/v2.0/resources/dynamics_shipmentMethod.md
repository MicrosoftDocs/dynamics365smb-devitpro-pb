---
title: shipmentMethod resource type | Microsoft Docs
description: A shipment method object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# shipmentMethod resource type

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a shipment method in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET shipmentMethod](../api/dynamics_shipmentmethod_get.md)|shipmentMethod|Gets a shipment method object.|
|[DELETE shipmentMethod](../api/dynamics_shipmentmethod_delete.md)|none|Deletes a shipment method object.|
|[POST shipmentMethod](../api/dynamics_shipmentmethod_create.md)|shipmentMethod|Creates a shipment method object.|
|[PATCH shipmentMethod](../api/dynamics_shipmentmethod_update.md)|shipmentMethod|Updates a shipment method object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the shipment method. Non-editable.|
|code|string|The code of the shipment method.|
|displayName|string|Specifies the shipment method's name. This name will appear on all sales documents for the shipment method.|
|lastModifiedDateTime|datetime|The last datetime the shipment method was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the shipmentMethod resource.


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
[GET shipmentMethod](../api/dynamics_shipmentMethod_Get.md)
[DELETE shipmentMethod](../api/dynamics_shipmentMethod_Delete.md)
[POST shipmentMethod](../api/dynamics_shipmentMethod_Create.md)
[PATCH shipmentMethod](../api/dynamics_shipmentMethod_Update.md)
