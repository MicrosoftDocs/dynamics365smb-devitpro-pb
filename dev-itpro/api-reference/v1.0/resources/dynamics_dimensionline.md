---
title: (v1.0) dimensionLines resource type
description: (v1.0) A dimension line in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# dimensionLines resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a dimension line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                         | Return Type  |Description                 |
|:---------------------------------------------------------------|:-------------|:---------------------------|
|[GET dimensionLines](../api/dynamics_dimensionline_get.md)      |dimensionLines|Gets a dimension line object   |
|[POST dimensionLines](../api/dynamics_create_dimensionline.md)  |dimensionLines|Creates a dimension line object|
|[PATCH dimensionLines](../api/dynamics_dimensionline_update.md) |dimensionLines|Updates a dimension line object|
|[DELETE dimensionLines](../api/dynamics_dimensionline_delete.md)|none          |Deletes a dimension line object|

## Properties

| Property       | Type                  |Description                                               |
|:---------------|:----------------------|:---------------------------------------------------------|
|parentId        |GUID                   |The ID of the parent entity. Non editable.                |
|id              |GUID                   |The unique ID of the dimension line. Non editable.        |
|code            |string, maximum size 20|The code of the dimension.                                |
|displayName     |string, maximum size 30|The display name of the dimension. Read-Only.             |
|valueId         |GUID                   |The unique ID of the value of the dimension.              |
|valueCode       |string, maximum size 20|The code of the value of the dimension.                   |
|valueDisplayName|string, maximum size 50|The display name of the value of the dimension. Read-Only.|

## Relationships
A dimension line must have a "Parent Entity" with an Id, that is represented by the parent Id.
"Parent Entity" can be one of the following:
 1) Journal Line
 2) Customer Payment.

A Dimension (id) must exist in the Dimensions endpoint.

A Dimension Value (valueId) must exist in the Dimension Values endpoint.

## JSON representation

Here is a JSON representation of the resource.

```json
{
  "parentId": "GUID",
  "id": "GUID",
  "code": "String",
  "displayName": "String",
  "valueId": "GUID",
  "valueCode": "String",
  "valueDisplayName": "String"
}
```

## See also
  
[Get Dimension Line](../api/dynamics_dimensionline_get.md)  
[Post Dimension Line](../api/dynamics_create_dimensionline.md)  
[Patch Dimension Line](../api/dynamics_dimensionline_update.md)  
[Delete Dimension Line](../api/dynamics_dimensionline_delete.md)  
