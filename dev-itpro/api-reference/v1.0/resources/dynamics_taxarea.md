---
title: (v1.0) taxAreas resource type
description: (v1.0) A tax area.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# taxAreas resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a tax area resource type in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET taxAreas](../api/dynamics_taxarea_get.md)|taxAreas|Gets a tax area object.|
|[POST taxAreas](../api/dynamics_create_taxarea.md)|taxAreas|Creates a tax area object.|
|[PATCH taxAreas](../api/dynamics_taxarea_update.md)|taxAreas|Updates a tax area object.|
|[DELETE taxAreas](../api/dynamics_taxarea_delete.md)|none|Deletes a tax area object.|

## Properties

| Property     | Type   |Description|
|:---------------|:--------|:----------|
|id|GUID|The unique ID of the tax area. Non-editable.|
|code|string, maximum size 20| The code of the tax area.|
|displayName|string, maximum size 50| The display name of the tax area.|
|lastModifiedDateTime|datetime|The last datetime the tax area was modified. Read-Only.|

## Relationships

## JSON representation

Here is a JSON representation of the resource.


```json
{
  "id": "GUID",
  "code": "String",
  "displayName": "String",
  "lastModifiedDateTime": "datetime"
}
```

## See also

[Get Tax Area](../api/dynamics_taxarea_get.md)  
[Create Tax Area](../api/dynamics_create_taxarea.md)  
[Update Tax Area](../api/dynamics_taxarea_update.md)  
[Delete Tax Area](../api/dynamics_taxarea_delete.md)  