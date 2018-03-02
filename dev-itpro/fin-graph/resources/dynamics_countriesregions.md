---
title: countriesRegions resource type | Microsoft Docs
description: A Countries/Regions object in Dynamics 365 for Finance and Operations, Business edition. 
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# countriesRegions resource type
Represents a countriesRegions object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], which is part of an address.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                              | Return Type    |Description                |
|:--------------------------------------------------------------------|:---------------|:--------------------------|
|[GET countriesRegions](../api/dynamics_countriesregions_get.md)      |countriesRegions|Get a Countries/Regions.   |
|[POST countriesRegions](../api/dynamics_create_countriesregions.md)  |countriesRegions|Create a Countries/Regions.|
|[PATCH countriesRegions](../api/dynamics_countriesregions_update.md) |countriesRegions|Update a Countries/Regions.|
|[DELETE countriesRegions](../api/dynamics_countriesregions_delete.md)|none            |Delete a Countries/Regions.|

## Properties
| Property	     | Type	      |Description                                                  |
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get counties regions](../api/dynamics_countriesregions_get.md)  
[Post countries regions](../api/dynamics_create_countriesregions.md)  
[Patch countries regions](../api/dynamics_countriesregions_update.md)  
[Delete countries regions](../api/dynamics_countriesregions_delete.md)  
