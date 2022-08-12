---
title: dimensionValue resource type
description: A dimension value object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# dimensionValue resource type (Beta)

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a dimension value in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dimensionValue](../api/dynamics_dimensionvalue_get.md)|dimensionValue|Gets a dimension value object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[dimensionSetEntries](dynamics_dimensionsetentry.md)|dimensionSetEntries |Gets the dimensionsetentries of the dimensionValue.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the dimension value. Non-editable.|
|dimensionCode|string|The dimension code.|
|dimensionValueCode|string|The dimension value code.  |
|dimensionValueName|string||
|dimensionValueId|integer||
|dimensionValueType|string||
|blocked|boolean|Specifies that entries cannot be posted to the dimension value. **True** indicates account is blocked and posting is not allowed.|
|indentation|integer|The dimension value item indentation used in report layout.|
|consolidationCode|string||
|globalDimensionNumber|integer||
|lastModifiedDateTime|datetime|The last datetime the dimension value was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the dimensionValue resource.


```json
{
    "id": "GUID",
    "dimensionCode": "string",
    "dimensionValueCode": "string",
    "dimensionValueName": "string",
    "dimensionValueId": "integer",
    "dimensionValueType": "string",
    "blocked": "boolean",
    "indentation": "integer",
    "consolidationCode": "string",
    "globalDimensionNumber": "integer",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET dimensionValue](../api/dynamics_dimensionvalue_get.md)
