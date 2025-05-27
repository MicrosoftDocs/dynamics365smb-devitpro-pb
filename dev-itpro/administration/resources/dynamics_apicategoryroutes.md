---
title: apicategoryroutes resource type
description: An apicategoryroutes object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# apicategoryroutes resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an apicategoryroutes in [!INCLUDE[prod_short](../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET apicategoryroutes](../api/dynamics_apicategoryroutes_get.md)|apicategoryroutes|Gets a apicategoryroutes object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|route|string||
|publisher|string|Specifies the publisher of the extension.|
|group|string||
|version|string||

## JSON representation

Here is a JSON representation of the apicategoryroutes resource.


```json
{
    "route": "string",
    "publisher": "string",
    "group": "string",
    "version": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## Related information
[GET apicategoryroutes](../api/dynamics_apicategoryroutes_get.md)
