---
title: countriesRegions resource type
description: A Countries/Regions object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# countriesRegions resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a countriesRegions object in [!INCLUDE[prod_short](../../../includes/prod_short.md)], which is part of an address.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                              | Return Type    |Description                |
|:--------------------------------------------------------------------|:---------------|:--------------------------|
|[GET countriesRegions](../api/dynamics_countriesregions_get.md)      |countriesRegions|Get a Countries/Regions.   |
|[POST countriesRegions](../api/dynamics_create_countriesregions.md)  |countriesRegions|Create a Countries/Regions.|
|[PATCH countriesRegions](../api/dynamics_countriesregions_update.md) |countriesRegions|Update a Countries/Regions.|
|[DELETE countriesRegions](../api/dynamics_countriesregions_delete.md)|none            |Delete a Countries/Regions.|

## Properties

| Property       | Type       |Description                                                  |
|:---------------|:-----------|:------------------------------------------------------------|
|id              |GUID        |The unique ID of the country/region. Non-editable.           |
|code            |string      |Specifies the code of the country/region.                    |
|displayName     |string      |Specifies the display name of the country/region.            |
|addressFormat   |string      |Specifies the format of the address that is displayed on external-facing documents. You link an address format to a country/region code so that external-facing documents based on cards or documents with that country/region code use the specified address format.|
|lastModifiedDateTime|datetime|The last datetime the country/region was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the countriesRegions.


```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "addressFormat": "string",
  "lastModifiedDateTime": "datetime"
}
```

## See also
  
[Get Countries Regions](../api/dynamics_countriesregions_get.md)  
[Post Countries Regions](../api/dynamics_create_countriesregions.md)  
[Patch Countries Regions](../api/dynamics_countriesregions_update.md)  
[Delete Countries Regions](../api/dynamics_countriesregions_delete.md)  
