---
title: purchaseReceipt resource type | Microsoft Docs
description: A purchase receipt object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# purchaseReceipt resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase receipt in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseReceipt](../api/dynamics_purchasereceipt_get.md)|purchaseReceipt|Gets a purchase receipt object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the purchaseReceipt.|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the purchaseReceipt.|
|[purchaseReceiptLines](dynamics_purchasereceiptline.md)|purchaseReceiptLines |Gets the purchasereceiptlines of the purchaseReceipt.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseReceipt.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase receipt. Non-editable.|
|number|string|Specifies the number of the purchase receipt.|
|invoiceDate|date|The invoice date .|
|postingDate|date|The date that the purchase receipt   is posted.|
|dueDate|date|T he date the purchase receipt is due.|
|vendorNumber|string|Specifies vendor's number.|
|vendorName|string|Specifies vendor's name.|
|payToName|string|Pay to name of the purchase receipt. |
|payToContact|string|Pay to contact.|
|payToVendorNumber|string|Pay to vendor number.|
|shipToName|string|Ship to name.|
|shipToContact|string|Ship to contact.|
|buyFromAddressLine1|string|Buy from address line 1.|
|buyFromAddressLine2|string|Buy from address line 2.|
|buyFromCity|string|Buy from city.|
|buyFromCountry|string|Buy from state.|
|buyFromState|string|Buy from state.|
|buyFromPostCode|string|Buy from country.|
|shipToAddressLine1|string|Ship to address line 1.|
|shipToAddressLine2|string|Ship to address line 2.|
|shipToCity|string|Ship to city.|
|shipToCountry|string|Ship to country.|
|shipToState|string|Ship to state.|
|shipToPostCode|string|Ship to post code.|
|payToAddressLine1|string|Pay to address line 1.|
|payToAddressLine2|string|Pay to address line 2.|
|payToCity|string|Pay to address line 2.|
|payToCountry|string|Pay to country.|
|payToState|string|Pay to state.|
|payToPostCode|string|Pay to post code.|
|currencyCode|string|The default currency code for the purchase receipt.|
|lastModifiedDateTime|datetime|The last datetime the purchase receipt was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the purchaseReceipt resource.


```json
{
    "id": "GUID",
    "number": "string",
    "invoiceDate": "date",
    "postingDate": "date",
    "dueDate": "date",
    "vendorNumber": "string",
    "vendorName": "string",
    "payToName": "string",
    "payToContact": "string",
    "payToVendorNumber": "string",
    "shipToName": "string",
    "shipToContact": "string",
    "buyFromAddressLine1": "string",
    "buyFromAddressLine2": "string",
    "buyFromCity": "string",
    "buyFromCountry": "string",
    "buyFromState": "string",
    "buyFromPostCode": "string",
    "shipToAddressLine1": "string",
    "shipToAddressLine2": "string",
    "shipToCity": "string",
    "shipToCountry": "string",
    "shipToState": "string",
    "shipToPostCode": "string",
    "payToAddressLine1": "string",
    "payToAddressLine2": "string",
    "payToCity": "string",
    "payToCountry": "string",
    "payToState": "string",
    "payToPostCode": "string",
    "currencyCode": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET purchaseReceipt](../api/dynamics_purchaseReceipt_Get.md)
