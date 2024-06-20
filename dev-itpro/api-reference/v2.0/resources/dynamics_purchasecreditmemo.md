---
title: purchaseCreditMemo resource type
description: A purchase credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/09/2024
ms.author: solsen
ms.reviewer: solsen
---

# purchaseCreditMemo resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase credit memo in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseCreditMemo](../api/dynamics_purchasecreditmemo_get.md)|purchaseCreditMemo|Gets a purchase credit memo object.|
|[DELETE purchaseCreditMemo](../api/dynamics_purchasecreditmemo_delete.md)|none|Deletes a purchase credit memo object.|
|[POST purchaseCreditMemo](../api/dynamics_purchasecreditmemo_create.md)|purchaseCreditMemo|Creates a purchase credit memo object.|
|[PATCH purchaseCreditMemo](../api/dynamics_purchasecreditmemo_update.md)|purchaseCreditMemo|Updates a purchase credit memo object.|

## Bound Actions

The purchaseCreditMemo resource type offers a bound action called `cancel` which cancels the corresponding purchaseCreditMemo batch.
This is illustrated in the following example:
`CANCEL https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/purchaseCreditMemos({id})/Microsoft.NAV.cancel`

The response has no content; the response code is 204.

The purchaseCreditMemo resource type offers a bound action called `post` which posts the corresponding purchaseCreditMemo batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/purchaseCreditMemos({id})/Microsoft.NAV.post`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the purchaseCreditMemo.|
|[dimensionValue](dynamics_dimensionvalue.md)|dimensionValue |Gets the dimensionvalue of the purchaseCreditMemo.|
|[currency](dynamics_currency.md)|currency |Gets the currency of the purchaseCreditMemo.|
|[paymentTerm](dynamics_paymentterm.md)|paymentTerm |Gets the paymentterm of the purchaseCreditMemo.|
|[shipmentMethod](dynamics_shipmentmethod.md)|shipmentMethod |Gets the shipmentmethod of the purchaseCreditMemo.|
|[customerReturnReason](dynamics_customerreturnreason.md)|customerReturnReason |Gets the customerreturnreason of the purchaseCreditMemo.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseCreditMemo.|
|[purchaseCreditMemoLines](dynamics_purchasecreditmemoline.md)|purchaseCreditMemoLines |Gets the purchasecreditmemolines of the purchaseCreditMemo.|
|[pdfDocument](dynamics_pdfdocument.md)|pdfDocument |Gets the pdfdocument of the purchaseCreditMemo.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the purchaseCreditMemo.|
|[documentAttachments](dynamics_documentattachment.md)|documentAttachments |Gets the documentattachments of the purchaseCreditMemo.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase credit memo. Non-editable.|
|number|string|Specifies the number of the purchase credit memo.|
|creditMemoDate|date|The credit memo date.|
|postingDate|date|The date that the purchase credit memo   is posted.|
|dueDate|date|T he date the purchase credit memo is due.|
|vendorId|GUID|The unique ID of vendor.|
|vendorNumber|string|Specifies vendor's number.|
|vendorName|string|Specifies vendor's name.|
|payToVendorId|GUID|Pay to vendor id.|
|payToVendorNumber|string|Pay to vendor number.|
|payToName|string|Pay to name of the purchase credit memo. |
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
|shortcutDimension1Code|string||
|shortcutDimension2Code|string||
|currencyId|GUID|Specifies which currency the purchase credit memo uses.|
|currencyCode|string|The default currency code for the purchase credit memo.|
|paymentTermsId|GUID|Specifies which payment term the purchase credit memo uses.|
|shipmentMethodId|GUID|Specifies which shipment method the purchase credit memo uses.|
|purchaser|string|The purchaser in the purchase credit memo.|
|pricesIncludeTax|boolean|Specifies whether the prices include Tax or not. Read-Only.|
|discountAmount|decimal|The purchase credit memo discount amount.|
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|totalAmountExcludingTax|decimal|The total amount excluding tax. Read-Only.  |
|totalTaxAmount|decimal|The total tax amount for the purchase credit memo. Read-Only.|
|totalAmountIncludingTax|decimal|The total amount including tax. Read-Only.  |
|status|NAV.purchCrMemoEntityStatus||
|lastModifiedDateTime|datetime|The last datetime the purchase credit memo was modified. Read-Only.|
|invoiceId|GUID|The unique ID of invoice.|
|invoiceNumber|string|The sales invoice number that the purchase credit memo  is linked to.|
|vendorReturnReasonId|GUID||

## JSON representation

Here is a JSON representation of the purchaseCreditMemo resource.


```json
{
    "id": "GUID",
    "number": "string",
    "creditMemoDate": "date",
    "postingDate": "date",
    "dueDate": "date",
    "vendorId": "GUID",
    "vendorNumber": "string",
    "vendorName": "string",
    "payToVendorId": "GUID",
    "payToVendorNumber": "string",
    "payToName": "string",
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
    "shortcutDimension1Code": "string",
    "shortcutDimension2Code": "string",
    "currencyId": "GUID",
    "currencyCode": "string",
    "paymentTermsId": "GUID",
    "shipmentMethodId": "GUID",
    "purchaser": "string",
    "pricesIncludeTax": "boolean",
    "discountAmount": "decimal",
    "discountAppliedBeforeTax": "boolean",
    "totalAmountExcludingTax": "decimal",
    "totalTaxAmount": "decimal",
    "totalAmountIncludingTax": "decimal",
    "status": "NAV.purchCrMemoEntityStatus",
    "lastModifiedDateTime": "datetime",
    "invoiceId": "GUID",
    "invoiceNumber": "string",
    "vendorReturnReasonId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also

[GET purchaseCreditMemo](../api/dynamics_purchasecreditmemo_get.md)  
[DELETE purchaseCreditMemo](../api/dynamics_purchasecreditmemo_delete.md)  
[POST purchaseCreditMemo](../api/dynamics_purchasecreditmemo_create.md)  
[PATCH purchaseCreditMemo](../api/dynamics_purchasecreditmemo_update.md)  
