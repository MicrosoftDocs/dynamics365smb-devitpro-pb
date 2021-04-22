---
title: currency resource type | Microsoft Docs
description: A currency object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# currency resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a currency in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET currency](../api/dynamics_currency_get.md)|currency|Gets a currency object.|
|[DELETE currency](../api/dynamics_currency_delete.md)|none|Deletes a currency object.|
|[POST currency](../api/dynamics_currency_create.md)|currency|Creates a currency object.|
|[PATCH currency](../api/dynamics_currency_update.md)|currency|Updates a currency object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the currency. Non-editable.|
|code|string|The code of the currency.|
|displayName|string|Specifies the currency's name. This name will appear on all sales documents for the currency.|
|symbol|string|Specifies a graphical representation of the unit of measure.|
|amountDecimalPlaces|string|Specifies the number of decimal places the system will display on amounts for this currency.||
|amountRoundingPrecision|decimal|Specifies the size of the interval to be used when rounding amounts for this currency.|
|lastModifiedDateTime|datetime|The last datetime the currency was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the currency resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "symbol": "string",
    "amountDecimalPlaces": "string",
    "amountRoundingPrecision": "decimal",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET currency](../api/dynamics_currency_Get.md)
[DELETE currency](../api/dynamics_currency_Delete.md)
[POST currency](../api/dynamics_currency_Create.md)
[PATCH currency](../api/dynamics_currency_Update.md)
