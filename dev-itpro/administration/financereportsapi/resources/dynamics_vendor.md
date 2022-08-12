---
title: vendor resource type
description: A vendor object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# vendor resource type (Beta)

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a vendor in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET vendor](../api/dynamics_vendor_get.md)|vendor|Gets a vendor object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the vendor. Non-editable.|
|number|string|Specifies the number of the vendor.|
|displayName|string|Specifies the vendor's name. This name will appear on all sales documents for the vendor.|
|city|string|Specifies the vendor's city.|
|state|string|Specifies the vendor's state.|
|country|string|Specifies the vendor's country.|
|postalCode|string|Specifies the vendor's postal code.|
|currencyCode|string|The default currency code for the vendor.|
|paymentTermsId|GUID|Specifies which payment term the vendor uses.|
|paymentMethodId|GUID|Specifies which payment method the vendor uses.|
|taxLiable|boolean|Specifies if the vendor or vendor is liable for sales tax. Set to **true** if the vendor is tax liable.|
|blocked|string|Specifies that transactions with the vendor cannot be posted. Set to **All**, if the vendor is blocked, set to blank if not blocked.|
|balance|decimal|Specifies vendor's total balance.|
|lastModifiedDateTime|datetime|The last datetime the vendor was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the vendor resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "city": "string",
    "state": "string",
    "country": "string",
    "postalCode": "string",
    "currencyCode": "string",
    "paymentTermsId": "GUID",
    "paymentMethodId": "GUID",
    "taxLiable": "boolean",
    "blocked": "string",
    "balance": "decimal",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET vendor](../api/dynamics_vendor_get.md)
