---
title: dimension resource type  
description: A dimension object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# dimension resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a dimension in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dimension](../api/dynamics_dimension_get.md)|dimension|Gets a dimension object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[dimensionValues](dynamics_dimensionvalue.md)|dimensionValues |Gets the dimensionvalues of the dimension.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the dimension. Non-editable.|
|code|string|The code of the dimension.|
|displayName|string|Specifies the dimension's name. This name will appear on all sales documents for the dimension.|
|lastModifiedDateTime|datetime|The last datetime the dimension was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the dimension resource.


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
[GET dimension](../api/dynamics_dimension_Get.md)
