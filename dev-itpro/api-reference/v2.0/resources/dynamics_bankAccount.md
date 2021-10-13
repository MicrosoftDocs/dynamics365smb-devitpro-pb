---
title: bankAccount resource type  
description: A bank account object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# bankAccount resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a bank account in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET bankAccount](../api/dynamics_bankaccount_get.md)|bankAccount|Gets a bank account object.|
|[DELETE bankAccount](../api/dynamics_bankaccount_delete.md)|none|Deletes a bank account object.|
|[POST bankAccount](../api/dynamics_bankaccount_create.md)|bankAccount|Creates a bank account object.|
|[PATCH bankAccount](../api/dynamics_bankaccount_update.md)|bankAccount|Updates a bank account object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the bank account. Non-editable.|
|number|string|Specifies the number of the bank account.|
|displayName|string|Specifies the bank account's name. This name will appear on all sales documents for the bank account.|

## JSON representation

Here is a JSON representation of the bankAccount resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET bankAccount](../api/dynamics_bankAccount_Get.md)
[DELETE bankAccount](../api/dynamics_bankAccount_Delete.md)
[POST bankAccount](../api/dynamics_bankAccount_Create.md)
[PATCH bankAccount](../api/dynamics_bankAccount_Update.md)
