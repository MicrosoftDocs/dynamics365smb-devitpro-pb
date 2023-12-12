---
title: apicategoryroutes resource type
description: An apicategoryroutes object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/04/2023
ms.author: solsen
---

# apicategoryroutes resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an apicategoryroutes in [!INCLUDE[prod_short](../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

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

## See Also
[GET apicategoryroutes](../api/dynamics_apicategoryroutes_get.md)
