---
title: apicategoryroutes resource type
description: An apicategoryroutes object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics365-business-central
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
---

# apicategoryroutes resource type

Represents an apicategoryroutes object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

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

## Related information

[GET apicategoryroutes](../api/dynamics_apicategoryroutes_get.md)
