---
title: customerReturnReason resource type
description: A customer return reason object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/27/2021
ms.author: solsen
---

# customerReturnReason resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a customer return reason in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerReturnReason](../api/dynamics_customerreturnreason_get.md)|customerReturnReason|Gets a customer return reason object.|
|[DELETE customerReturnReason](../api/dynamics_customerreturnreason_delete.md)|none|Deletes a customer return reason object.|
|[POST customerReturnReason](../api/dynamics_customerreturnreason_create.md)|customerReturnReason|Creates a customer return reason object.|
|[PATCH customerReturnReason](../api/dynamics_customerreturnreason_update.md)|customerReturnReason|Updates a customer return reason object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the customer return reason. Non-editable.|
|code|string|The code of the customer return reason.|
|description|string|Specifies the description of the customer return reason.|

## JSON representation

Here is a JSON representation of the customerReturnReason resource.


```json
{
    "id": "GUID",
    "code": "string",
    "description": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET customerReturnReason](../api/dynamics_customerreturnreason_get.md)  
[DELETE customerReturnReason](../api/dynamics_customerreturnreason_delete.md)  
[POST customerReturnReason](../api/dynamics_customerreturnreason_create.md)  
[PATCH customerReturnReason](../api/dynamics_customerreturnreason_update.md)  
