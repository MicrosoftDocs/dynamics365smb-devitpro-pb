---
title: purchaseOrder resource type  
description: A purchase order object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# purchaseOrder resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase order in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseOrder](../api/dynamics_purchaseorder_get.md)|purchaseOrder|Gets a purchase order object.|
|[DELETE purchaseOrder](../api/dynamics_purchaseorder_delete.md)|none|Deletes a purchase order object.|
|[POST purchaseOrder](../api/dynamics_purchaseorder_create.md)|purchaseOrder|Creates a purchase order object.|
|[PATCH purchaseOrder](../api/dynamics_purchaseorder_update.md)|purchaseOrder|Updates a purchase order object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the purchaseOrder.|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the purchaseOrder.|
|[currency](dynamics_currency.md)|currency |Gets the currency of the purchaseOrder.|
|[paymentTerm](dynamics_paymentterm.md)|paymentTerm |Gets the paymentterm of the purchaseOrder.|
|[shipmentMethod](dynamics_shipmentmethod.md)|shipmentMethod |Gets the shipmentmethod of the purchaseOrder.|
|[purchaseOrderLines](dynamics_purchaseorderline.md)|purchaseOrderLines |Gets the purchaseorderlines of the purchaseOrder.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the purchaseOrder.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseOrder.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase order. Non-editable.|
|number|string|Specifies the number of the purchase order.|
|orderDate|date|The order date.|
|postingDate|date|The date that the purchase order   is posted.|
|vendorId|GUID|The unique ID of vendor.|
|vendorNumber|string|Specifies vendor's number.|
|vendorName|string|Specifies vendor's name.|
|payToName|string|Pay to name of the purchase order. |
|payToVendorId|GUID|Pay to vendor id.|
|payToVendorNumber|string|Pay to vendor number.|
|shipToName|string|Ship to name.|
|shipToContact|string|Ship to contact.|
|buyFromAddressLine1|string|Buy from address line 1.|
|buyFromAddressLine2|string|Buy from address line 2.|
|buyFromCity|string|Buy from city.|
|buyFromCountry|string|Buy from state.|
|buyFromState|string|Buy from state.|
|buyFromPostCode|string|Buy from country.|
|payToAddressLine1|string|Pay to address line 1.|
|payToAddressLine2|string|Pay to address line 2.|
|payToCity|string|Pay to address line 2.|
|payToCountry|string|Pay to country.|
|payToState|string|Pay to state.|
|payToPostCode|string|Pay to post code.|
|shipToAddressLine1|string|Ship to address line 1.|
|shipToAddressLine2|string|Ship to address line 2.|
|shipToCity|string|Ship to city.|
|shipToCountry|string|Ship to country.|
|shipToState|string|Ship to state.|
|shipToPostCode|string|Ship to post code.|
|currencyId|GUID|Specifies which currency the purchase order uses.|
|currencyCode|string|The default currency code for the purchase order.|
|pricesIncludeTax|boolean|Specifies whether the prices include Tax or not. Read-Only.|
|paymentTermsId|GUID|Specifies which payment term the purchase order uses.|
|shipmentMethodId|GUID|Specifies which shipment method the purchase order uses.|
|purchaser|string|The purchaser in the purchase order.|
|requestedReceiptDate|date|The date the receipt was requested. |
|discountAmount|decimal|The purchase order discount amount.|
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|totalAmountExcludingTax|decimal|The total amount excluding tax. Read-Only.  |
|totalTaxAmount|decimal|The total tax amount for the purchase order. Read-Only.|
|totalAmountIncludingTax|decimal|The total amount including tax. Read-Only.  |
|fullyReceived|boolean|Specifies whether the purchase order has been fully recieved.|
|status|NAV.purchaseOrderEntityBufferStatus|The status of the purchase order. It can be "Draft", "In Review" or "Open".|
|lastModifiedDateTime|datetime|The last datetime the purchase order was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the purchaseOrder resource.


```json
{
    "id": "GUID",
    "number": "string",
    "orderDate": "date",
    "postingDate": "date",
    "vendorId": "GUID",
    "vendorNumber": "string",
    "vendorName": "string",
    "payToName": "string",
    "payToVendorId": "GUID",
    "payToVendorNumber": "string",
    "shipToName": "string",
    "shipToContact": "string",
    "buyFromAddressLine1": "string",
    "buyFromAddressLine2": "string",
    "buyFromCity": "string",
    "buyFromCountry": "string",
    "buyFromState": "string",
    "buyFromPostCode": "string",
    "payToAddressLine1": "string",
    "payToAddressLine2": "string",
    "payToCity": "string",
    "payToCountry": "string",
    "payToState": "string",
    "payToPostCode": "string",
    "shipToAddressLine1": "string",
    "shipToAddressLine2": "string",
    "shipToCity": "string",
    "shipToCountry": "string",
    "shipToState": "string",
    "shipToPostCode": "string",
    "currencyId": "GUID",
    "currencyCode": "string",
    "pricesIncludeTax": "boolean",
    "paymentTermsId": "GUID",
    "shipmentMethodId": "GUID",
    "purchaser": "string",
    "requestedReceiptDate": "date",
    "discountAmount": "decimal",
    "discountAppliedBeforeTax": "boolean",
    "totalAmountExcludingTax": "decimal",
    "totalTaxAmount": "decimal",
    "totalAmountIncludingTax": "decimal",
    "fullyReceived": "boolean",
    "status": "NAV.purchaseOrderEntityBufferStatus",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET purchaseOrder](../api/dynamics_purchaseorder_get.md)  
[DELETE purchaseOrder](../api/dynamics_purchaseorder_delete.md)  
[POST purchaseOrder](../api/dynamics_purchaseorder_create.md)  
[PATCH purchaseOrder](../api/dynamics_purchaseorder_update.md)  
