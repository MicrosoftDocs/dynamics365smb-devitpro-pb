---
title: externalbusinesseventdefinitions resource type
description: An externalbusinesseventdefinitions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/09/2024
ms.author: solsen
---

# externalbusinesseventdefinitions resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an externalbusinesseventdefinitions in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET externalbusinesseventdefinitions](../api/dynamics_externalbusinesseventdefinitions_get.md)|externalbusinesseventdefinitions|Gets a externalbusinesseventdefinitions object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|appId|GUID|The ID of the App.|
|name|string|Represents the externalbusinesseventdefinitions's name.|
|eventVersion|string||
|payload|string||
|displayName|string|Specifies the externalbusinesseventdefinitions's name. This name will appear on all sales documents for the externalbusinesseventdefinitions.|
|description|string|Specifies the description of the externalbusinesseventdefinitions.|
|category|string|Specifies the category of the externalbusinesseventdefinitions.|
|appName|string||
|appPublisher|string||
|appVersion|string|The version of the App.|

## JSON representation

Here is a JSON representation of the externalbusinesseventdefinitions resource.


```json
{
    "appId": "GUID",
    "name": "string",
    "eventVersion": "string",
    "payload": "string",
    "displayName": "string",
    "description": "string",
    "category": "string",
    "appName": "string",
    "appPublisher": "string",
    "appVersion": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET externalbusinesseventdefinitions](../api/dynamics_externalbusinesseventdefinitions_get.md)
