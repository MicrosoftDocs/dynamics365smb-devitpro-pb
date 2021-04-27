---
title: taxGroups resource type | Microsoft Docs
description: A tax group object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# taxGroups resource type

[!INCLUDE[d365_api_newversion](../../includes/d365_api_newversion.md)]

Represents a taxGroups resource type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET taxGroups](../api/dynamics_taxGroups_get.md)|taxGroups|Gets a tax group object.|
|[POST taxGroups](../api/dynamics_create_taxGroups.md)|taxGroups|Creates a tax group object.|
|[PATCH taxGroups](../api/dynamics_taxGroups_update.md)|taxGroups|Updates a tax group object.|
|[DELETE taxGroups](../api/dynamics_taxGroups_delete.md)|none|Deletes a tax group object.|

## Properties

| Property     | Type   |Description|
|:---------------|:--------|:----------|
|id|GUID|The unique ID of the taxGroup. Read-Only.|
|code|string|Specifies the tax group.|
|displayName|string|Specifies the tax group display name.|
|lastModifiedDateTime|datetime|The last datetime the tax group was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the taxGroup.

```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "lastModifiedDateTime": "datetime"
}
```

## See Also

[Get Tax Groups](../api/dynamics_taxgroups_get.md)  
[Create Tax Groups](../api/dynamics_create_taxgroups.md)  
[Update Tax Groups](../api/dynamics_taxgroups_update.md)  
[Delete Tax Groups](../api/dynamics_taxgroups_delete.md)  