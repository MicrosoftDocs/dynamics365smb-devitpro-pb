---
title: salesInvoice resource type | Microsoft Docs
description: A sales invoice object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# salesInvoice resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a sales invoice in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesInvoice](../api/dynamics_salesinvoice_get.md)|salesInvoice|Gets a sales invoice object.|
|[DELETE salesInvoice](../api/dynamics_salesinvoice_delete.md)|none|Deletes a sales invoice object.|
|[POST salesInvoice](../api/dynamics_salesinvoice_create.md)|salesInvoice|Creates a sales invoice object.|
|[PATCH salesInvoice](../api/dynamics_salesinvoice_update.md)|salesInvoice|Updates a sales invoice object.|

## Bound Actions

The salesInvoice resource type offers a bound action called `cancelAndSend` which cancel and sends the corresponding salesInvoice batch.
This is illustrated in the following example:
`CANCELANDSEND https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesInvoices({id})/Microsoft.NAV.cancelAndSend`

The response has no content; the response code is 204.

The salesInvoice resource type offers a bound action called `cancel` which cancels the corresponding salesInvoice batch.
This is illustrated in the following example:
`CANCEL https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesInvoices({id})/Microsoft.NAV.cancel`

The response has no content; the response code is 204.

The salesInvoice resource type offers a bound action called `makeCorrectiveCreditMemo` which make corrective credit memos the corresponding salesInvoice batch.
This is illustrated in the following example:
`MAKECORRECTIVECREDITMEMO https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesInvoices({id})/Microsoft.NAV.makeCorrectiveCreditMemo`

The response has no content; the response code is 204.

The salesInvoice resource type offers a bound action called `postAndSend` which post and sends the corresponding salesInvoice batch.
This is illustrated in the following example:
`POSTANDSEND https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesInvoices({id})/Microsoft.NAV.postAndSend`

The response has no content; the response code is 204.

The salesInvoice resource type offers a bound action called `post` which posts the corresponding salesInvoice batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesInvoices({id})/Microsoft.NAV.post`

The response has no content; the response code is 204.

The salesInvoice resource type offers a bound action called `send` which sends the corresponding salesInvoice batch.
This is illustrated in the following example:
`SEND https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesInvoices({id})/Microsoft.NAV.send`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[customer](dynamics_customer.md)|customer |Gets the customer of the salesInvoice.|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the salesInvoice.|
|[currency](dynamics_currency.md)|currency |Gets the currency of the salesInvoice.|
|[paymentTerm](dynamics_paymentterm.md)|paymentTerm |Gets the paymentterm of the salesInvoice.|
|[shipmentMethod](dynamics_shipmentmethod.md)|shipmentMethod |Gets the shipmentmethod of the salesInvoice.|
|[salesInvoiceLines](dynamics_salesinvoiceline.md)|salesInvoiceLines |Gets the salesinvoicelines of the salesInvoice.|
|[pdfDocument](dynamics_pdfdocument.md)|pdfDocument |Gets the pdfdocument of the salesInvoice.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the salesInvoice.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesInvoice.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales invoice. Non-editable.|
|number|string|Specifies the number of the sales invoice.|
|externalDocumentNumber|string|Specifies an external document number for the sales invoice.|
|invoiceDate|date|The invoice date .|
|postingDate|date|The date that the sales invoice   is posted.|
|dueDate|date|T he date the sales invoice is due.|
|customerPurchaseOrderReference|string|The customer purchase order reference for the invoice.|
|customerId|GUID|The unique ID of customer.  |
|customerNumber|string|The customer's number.|
|customerName|string|The customer's name.|
|billToName|string|Bill to name.|
|billToCustomerId|GUID|Bill to customer id.|
|billToCustomerNumber|string|Bill to customer number.|
|shipToName|string|Ship to name.|
|shipToContact|string|Ship to contact.|
|sellToAddressLine1|string|Sell to address line 1.|
|sellToAddressLine2|string|Sell to address line 2.|
|sellToCity|string|Sell to city.|
|sellToCountry|string|Sell to country.|
|sellToState|string|Sell to state.|
|sellToPostCode|string|Sell to post code.|
|billToAddressLine1|string|Bill to address line 1.|
|billToAddressLine2|string|Bill to address line 2.|
|billToCity|string|Bill to city.|
|billToCountry|string|Bill to country.|
|billToState|string|Bill to state.|
|billToPostCode|string|Bill to post code.|
|shipToAddressLine1|string|Ship to address line 1.|
|shipToAddressLine2|string|Ship to address line 2.|
|shipToCity|string|Ship to city.|
|shipToCountry|string|Ship to country.|
|shipToState|string|Ship to state.|
|shipToPostCode|string|Ship to post code.|
|currencyId|GUID|Specifies which currency the sales invoice uses.|
|currencyCode|string|The default currency code for the sales invoice.|
|orderId|GUID|The id of the order to which the sales invoice is associated to. Read-Only.|
|orderNumber|string|The number of the order to which the sales invoice is associated to. Read-Only.|
|paymentTermsId|GUID|Specifies which payment term the sales invoice uses.|
|shipmentMethodId|GUID|Specifies which shipment method the sales invoice uses.|
|salesperson|string|The salesperson code for the sales invoice.|
|pricesIncludeTax|boolean|Specifies whether the prices include Tax or not. Read-Only.|
|remainingAmount|decimal|The amount including VAT.|
|discountAmount|decimal|The sales invoice discount amount.|
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|totalAmountExcludingTax|decimal|The total amount excluding tax. Read-Only.  |
|totalTaxAmount|decimal|The total tax amount for the sales invoice. Read-Only.|
|totalAmountIncludingTax|decimal|The total amount including tax. Read-Only.  |
|status|NAV.invoiceEntityAggregateStatus|The status of the sales invoice. It can be " ", "Draft", "In Review", "Open", "Paid", "Canceled" or "Corrective".|
|lastModifiedDateTime|datetime|The last datetime the sales invoice was modified. Read-Only.|
|phoneNumber|string|Specifies the sales invoice's telephone number.|
|email|string|Specifies the sales invoice's email address.|

## JSON representation

Here is a JSON representation of the salesInvoice resource.


```json
{
    "id": "GUID",
    "number": "string",
    "externalDocumentNumber": "string",
    "invoiceDate": "date",
    "postingDate": "date",
    "dueDate": "date",
    "customerPurchaseOrderReference": "string",
    "customerId": "GUID",
    "customerNumber": "string",
    "customerName": "string",
    "billToName": "string",
    "billToCustomerId": "GUID",
    "billToCustomerNumber": "string",
    "shipToName": "string",
    "shipToContact": "string",
    "sellToAddressLine1": "string",
    "sellToAddressLine2": "string",
    "sellToCity": "string",
    "sellToCountry": "string",
    "sellToState": "string",
    "sellToPostCode": "string",
    "billToAddressLine1": "string",
    "billToAddressLine2": "string",
    "billToCity": "string",
    "billToCountry": "string",
    "billToState": "string",
    "billToPostCode": "string",
    "shipToAddressLine1": "string",
    "shipToAddressLine2": "string",
    "shipToCity": "string",
    "shipToCountry": "string",
    "shipToState": "string",
    "shipToPostCode": "string",
    "currencyId": "GUID",
    "currencyCode": "string",
    "orderId": "GUID",
    "orderNumber": "string",
    "paymentTermsId": "GUID",
    "shipmentMethodId": "GUID",
    "salesperson": "string",
    "pricesIncludeTax": "boolean",
    "remainingAmount": "decimal",
    "discountAmount": "decimal",
    "discountAppliedBeforeTax": "boolean",
    "totalAmountExcludingTax": "decimal",
    "totalTaxAmount": "decimal",
    "totalAmountIncludingTax": "decimal",
    "status": "NAV.invoiceEntityAggregateStatus",
    "lastModifiedDateTime": "datetime",
    "phoneNumber": "string",
    "email": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET salesInvoice](../api/dynamics_salesInvoice_Get.md)
[DELETE salesInvoice](../api/dynamics_salesInvoice_Delete.md)
[POST salesInvoice](../api/dynamics_salesInvoice_Create.md)
[PATCH salesInvoice](../api/dynamics_salesInvoice_Update.md)
