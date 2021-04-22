---
title: countryRegion resource type | Microsoft Docs
description: A country/region object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# countryRegion resource type

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a country/region in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET countryRegion](../api/dynamics_countryregion_get.md)|countryRegion|Gets a country/region object.|
|[DELETE countryRegion](../api/dynamics_countryregion_delete.md)|none|Deletes a country/region object.|
|[POST countryRegion](../api/dynamics_countryregion_create.md)|countryRegion|Creates a country/region object.|
|[PATCH countryRegion](../api/dynamics_countryregion_update.md)|countryRegion|Updates a country/region object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the country/region. Non-editable.|
|code|string|The code of the country/region.|
|displayName|string|Specifies the country/region's name. This name will appear on all sales documents for the country/region.|
|addressFormat|string|Specifies the format of the address that is displayed on external-facing documents. You link an address format to a country/region code so that external-facing documents based on cards or documents with that country/region code use the specified address format.|
|lastModifiedDateTime|datetime|The last datetime the country/region was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the countryRegion resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "addressFormat": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET countryRegion](../api/dynamics_countryRegion_Get.md)
[DELETE countryRegion](../api/dynamics_countryRegion_Delete.md)
[POST countryRegion](../api/dynamics_countryRegion_Create.md)
[PATCH countryRegion](../api/dynamics_countryRegion_Update.md)
