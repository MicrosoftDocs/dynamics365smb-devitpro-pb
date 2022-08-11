---
title: dimensionSetEntry resource type
description: A dimension set entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# dimensionSetEntry resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a dimension set entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dimensionSetEntry](../api/dynamics_dimensionsetentry_get.md)|dimensionSetEntry|Gets a dimension set entry object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[dimensionValue](dynamics_dimensionvalue.md)|dimensionValue |Gets the dimensionvalue of the dimensionSetEntry.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the dimension set entry. Non-editable.|
|setId|integer||
|dimensionCode|string|The dimension code.|
|dimensionDisplayName|string||
|dimensionValueCode|string|The dimension value code.  |
|dimensionValueDisplayName|string||
|dimensionValueId|integer||
|lastModifiedDateTime|datetime|The last datetime the dimension set entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the dimensionSetEntry resource.


```json
{
    "id": "GUID",
    "setId": "integer",
    "dimensionCode": "string",
    "dimensionDisplayName": "string",
    "dimensionValueCode": "string",
    "dimensionValueDisplayName": "string",
    "dimensionValueId": "integer",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET dimensionSetEntry](../api/dynamics_dimensionsetentry_get.md)
