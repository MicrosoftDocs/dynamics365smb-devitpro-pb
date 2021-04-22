---
title: paymentMethod resource type | Microsoft Docs
description: A payment method object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# paymentMethod resource type

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a payment method in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET paymentMethod](../api/dynamics_paymentmethod_get.md)|paymentMethod|Gets a payment method object.|
|[DELETE paymentMethod](../api/dynamics_paymentmethod_delete.md)|none|Deletes a payment method object.|
|[POST paymentMethod](../api/dynamics_paymentmethod_create.md)|paymentMethod|Creates a payment method object.|
|[PATCH paymentMethod](../api/dynamics_paymentmethod_update.md)|paymentMethod|Updates a payment method object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the payment method. Non-editable.|
|code|string|The code of the payment method.|
|displayName|string|Specifies the payment method's name. This name will appear on all sales documents for the payment method.|
|lastModifiedDateTime|datetime|The last datetime the payment method was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the paymentMethod resource.


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
[GET paymentMethod](../api/dynamics_paymentMethod_Get.md)
[DELETE paymentMethod](../api/dynamics_paymentMethod_Delete.md)
[POST paymentMethod](../api/dynamics_paymentMethod_Create.md)
[PATCH paymentMethod](../api/dynamics_paymentMethod_Update.md)
