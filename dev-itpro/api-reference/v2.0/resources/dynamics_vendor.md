---
title: vendor resource type | Microsoft Docs
description: A vendor object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# vendor resource type

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a vendor in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET vendor](../api/dynamics_vendor_get.md)|vendor|Gets a vendor object.|
|[DELETE vendor](../api/dynamics_vendor_delete.md)|none|Deletes a vendor object.|
|[POST vendor](../api/dynamics_vendor_create.md)|vendor|Creates a vendor object.|
|[PATCH vendor](../api/dynamics_vendor_update.md)|vendor|Updates a vendor object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the vendor.|
|[currency](dynamics_currency.md)|currency |Gets the currency of the vendor.|
|[paymentTerm](dynamics_paymentterm.md)|paymentTerm |Gets the paymentterm of the vendor.|
|[paymentMethod](dynamics_paymentmethod.md)|paymentMethod |Gets the paymentmethod of the vendor.|
|[picture](dynamics_picture.md)|picture |Gets the picture of the vendor.|
|[defaultDimensions](dynamics_defaultdimension.md)|defaultDimensions |Gets the defaultdimensions of the vendor.|
|[agedAccountsPayable](dynamics_agedaccountspayable.md)|agedAccountsPayable |Gets the agedaccountspayable of the vendor.|
|[contactsInformation](dynamics_contactinformation.md)|contactsInformation |Gets the contactsinformation of the vendor.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the vendor. Non-editable.|
|number|string|Specifies the number of the vendor.|
|displayName|string|Specifies the vendor's name. This name will appear on all sales documents for the vendor.|
|addressLine1|string|Specifies the vendor's address. This address will appear on all sales documents for the vendor.|
|addressLine2|string|Specifies the vendor's address. This address will appear on all sales documents for the vendor.|
|city|string|Specifies the vendor's city.|
|state|string|Specifies the vendor's state.|
|country|string|Specifies the vendor's country.|
|postalCode|string|Specifies the vendor's postal code.|
|phoneNumber|string|Specifies the vendor's telephone number.|
|email|string|Specifies the vendor's email address.|
|website|string|Specifies the vendor's home page address.|
|taxRegistrationNumber|string|Specified the tax registration number of the vendor.|
|currencyId|GUID|Specifies which currency the vendor uses.|
|currencyCode|string|The default currency code for the vendor.|
|irs1099Code|string|Specifies a 1099 code for the vendor. US only.|
|paymentTermsId|GUID|Specifies which payment term the vendor uses.|
|paymentMethodId|GUID|Specifies which payment method the vendor uses.|
|taxLiable|boolean|Specifies if the vendor or vendor is liable for sales tax. Set to **true** if the vendor is tax liable.|
|blocked|NAV.vendorBlocked|Specifies which transactions with the customer cannot be posted. It can be <Member Name=" ", "Payment" or "All".|
|balance|decimal|Specifies vendor's total balance.|
|lastModifiedDateTime|datetime|The last datetime the vendor was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the vendor resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "addressLine1": "string",
    "addressLine2": "string",
    "city": "string",
    "state": "string",
    "country": "string",
    "postalCode": "string",
    "phoneNumber": "string",
    "email": "string",
    "website": "string",
    "taxRegistrationNumber": "string",
    "currencyId": "GUID",
    "currencyCode": "string",
    "irs1099Code": "string",
    "paymentTermsId": "GUID",
    "paymentMethodId": "GUID",
    "taxLiable": "boolean",
    "blocked": "NAV.vendorBlocked",
    "balance": "decimal",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET vendor](../api/dynamics_vendor_Get.md)
[DELETE vendor](../api/dynamics_vendor_Delete.md)
[POST vendor](../api/dynamics_vendor_Create.md)
[PATCH vendor](../api/dynamics_vendor_Update.md)
