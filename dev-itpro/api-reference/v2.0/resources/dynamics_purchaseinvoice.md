---
title: purchaseInvoice resource type  
description: A purchase invoice object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# purchaseInvoice resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase invoice in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseInvoice](../api/dynamics_purchaseinvoice_get.md)|purchaseInvoice|Gets a purchase invoice object.|
|[DELETE purchaseInvoice](../api/dynamics_purchaseinvoice_delete.md)|none|Deletes a purchase invoice object.|
|[POST purchaseInvoice](../api/dynamics_purchaseinvoice_create.md)|purchaseInvoice|Creates a purchase invoice object.|
|[PATCH purchaseInvoice](../api/dynamics_purchaseinvoice_update.md)|purchaseInvoice|Updates a purchase invoice object.|

## Bound Actions

The purchaseInvoice resource type offers a bound action called `post` which posts the corresponding purchaseInvoice batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/purchaseInvoices({id})/Microsoft.NAV.post`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the purchaseInvoice.|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the purchaseInvoice.|
|[currency](dynamics_currency.md)|currency |Gets the currency of the purchaseInvoice.|
|[purchaseInvoiceLines](dynamics_purchaseinvoiceline.md)|purchaseInvoiceLines |Gets the purchaseinvoicelines of the purchaseInvoice.|
|[pdfDocument](dynamics_pdfdocument.md)|pdfDocument |Gets the pdfdocument of the purchaseInvoice.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the purchaseInvoice.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseInvoice.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase invoice. Non-editable.|
|number|string|Specifies the number of the purchase invoice.|
|invoiceDate|date|The invoice date .|
|postingDate|date|The date that the purchase invoice   is posted.|
|dueDate|date|T he date the purchase invoice is due.|
|vendorInvoiceNumber|string|The vendor sales order reference for the purchase invoice.|
|vendorId|GUID|The unique ID of vendor.|
|vendorNumber|string|Specifies vendor's number.|
|vendorName|string|Specifies vendor's name.|
|payToName|string|Pay to name of the purchase invoice. |
|payToContact|string|Pay to contact.|
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
|currencyId|GUID|Specifies which currency the purchase invoice uses.|
|currencyCode|string|The default currency code for the purchase invoice.|
|orderId|GUID|The id of the order to which the purchase invoice is associated to. Read-Only.|
|orderNumber|string|The number of the order to which the purchase invoice is associated to. Read-Only.|
|pricesIncludeTax|boolean|Specifies whether the prices include Tax or not. Read-Only.|
|discountAmount|decimal|The purchase invoice discount amount.|
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|totalAmountExcludingTax|decimal|The total amount excluding tax. Read-Only.  |
|totalTaxAmount|decimal|The total tax amount for the purchase invoice. Read-Only.|
|totalAmountIncludingTax|decimal|The total amount including tax. Read-Only.  |
|status|NAV.invoiceEntityAggregateStatus|The status of the purchase invoice. It can be " ", "Draft", "In Review", "Open", "Paid", "Canceled" or "Corrective".|
|lastModifiedDateTime|datetime|The last datetime the purchase invoice was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the purchaseInvoice resource.


```json
{
    "id": "GUID",
    "number": "string",
    "invoiceDate": "date",
    "postingDate": "date",
    "dueDate": "date",
    "vendorInvoiceNumber": "string",
    "vendorId": "GUID",
    "vendorNumber": "string",
    "vendorName": "string",
    "payToName": "string",
    "payToContact": "string",
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
    "currencyId": "GUID",
    "currencyCode": "string",
    "orderId": "GUID",
    "orderNumber": "string",
    "pricesIncludeTax": "boolean",
    "discountAmount": "decimal",
    "discountAppliedBeforeTax": "boolean",
    "totalAmountExcludingTax": "decimal",
    "totalTaxAmount": "decimal",
    "totalAmountIncludingTax": "decimal",
    "status": "NAV.invoiceEntityAggregateStatus",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET purchaseInvoice](../api/dynamics_purchaseInvoice_Get.md)
[DELETE purchaseInvoice](../api/dynamics_purchaseInvoice_Delete.md)
[POST purchaseInvoice](../api/dynamics_purchaseInvoice_Create.md)
[PATCH purchaseInvoice](../api/dynamics_purchaseInvoice_Update.md)
