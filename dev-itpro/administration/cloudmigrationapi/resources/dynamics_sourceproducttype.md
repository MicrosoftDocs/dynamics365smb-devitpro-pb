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
Represents a source product type in [!INCLUDE[prod_short](../../../includes/prod_short.md)] that can be used for cloud migration. The values can be used for setupCloudMigration to indicate from which source product to migrate from.

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET sourceProductType](../api/dynamics_sourceproducttype_get.md)|sourceProductType|Gets a source product type object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|string|The unique ID of the source product type. Read-Only.|
|displayName|string|Specifies the source product type's name. This name will appear on all sales documents for the source product type.|
|estimatedSize|decimal|Read-Only property representing the approximate size of the On-Prem company. The data migrated will be smaller, since the data will be compressed and not all tables will be included.|
|created|boolean|Specifies if the company was created. It will not reflect if the setup of the company was correct or not. For this you should check the status property. If the company has been created, however status is different.|


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
