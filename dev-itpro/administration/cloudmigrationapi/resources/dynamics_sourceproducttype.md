---
title: sourceProductType resource type
description: A source product type object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/25/2022
ms.author: solsen
---

# sourceProductType resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a source product type in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET sourceProductType](../api/dynamics_sourceproducttype_get.md)|sourceProductType|Gets a source product type object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|string|The unique ID of the source product type. Read-Only.|
|displayName|string|Specifies the source product type's name. This name will appear on all sales documents for the source product type.|
|estimatedSize|decimal||
|created|boolean||


## JSON representation

Here is a JSON representation of the sourceProductType resource.


```json
{
    "id": "string",
    "displayName": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET sourceProductType](../api/dynamics_sourceproducttype_get.md)
