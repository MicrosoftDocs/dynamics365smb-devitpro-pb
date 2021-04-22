---
title: salesQuote resource type  
description: A sales quote object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# salesQuote resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a sales quote in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesQuote](../api/dynamics_salesquote_get.md)|salesQuote|Gets a sales quote object.|
|[DELETE salesQuote](../api/dynamics_salesquote_delete.md)|none|Deletes a sales quote object.|
|[POST salesQuote](../api/dynamics_salesquote_create.md)|salesQuote|Creates a sales quote object.|
|[PATCH salesQuote](../api/dynamics_salesquote_update.md)|salesQuote|Updates a sales quote object.|

## Bound Actions

The salesQuote resource type offers a bound action called `makeInvoice` which make invoices the corresponding salesQuote batch.
This is illustrated in the following example:
`MAKEINVOICE https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesQuotes({id})/Microsoft.NAV.makeInvoice`

The response has no content; the response code is 204.

The salesQuote resource type offers a bound action called `makeOrder` which make orders the corresponding salesQuote batch.
This is illustrated in the following example:
`MAKEORDER https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesQuotes({id})/Microsoft.NAV.makeOrder`

The response has no content; the response code is 204.

The salesQuote resource type offers a bound action called `send` which sends the corresponding salesQuote batch.
This is illustrated in the following example:
`SEND https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/salesQuotes({id})/Microsoft.NAV.send`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[customer](dynamics_customer.md)|customer |Gets the customer of the salesQuote.|
|[countryRegion](dynamics_countryregion.md)|countryRegion |Gets the countryregion of the salesQuote.|
|[currency](dynamics_currency.md)|currency |Gets the currency of the salesQuote.|
|[paymentTerm](dynamics_paymentterm.md)|paymentTerm |Gets the paymentterm of the salesQuote.|
|[shipmentMethod](dynamics_shipmentmethod.md)|shipmentMethod |Gets the shipmentmethod of the salesQuote.|
|[salesQuoteLines](dynamics_salesquoteline.md)|salesQuoteLines |Gets the salesquotelines of the salesQuote.|
|[pdfDocument](dynamics_pdfdocument.md)|pdfDocument |Gets the pdfdocument of the salesQuote.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the salesQuote.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesQuote.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales quote. Non-editable.|
|number|string|Specifies the number of the sales quote.|
|externalDocumentNumber|string|Specifies an external document number for the sales quote.|
|documentDate|date|The quote date.|
|postingDate|date|The date that the sales quote   is posted.|
|dueDate|date|T he date the sales quote is due.|
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
|currencyId|GUID|Specifies which currency the sales quote uses.|
|currencyCode|string|The default currency code for the sales quote.|
|paymentTermsId|GUID|Specifies which payment term the sales quote uses.|
|shipmentMethodId|GUID|Specifies which shipment method the sales quote uses.|
|salesperson|string|The salesperson code for the sales quote.|
|discountAmount|decimal|The sales quote discount amount.|
|totalAmountExcludingTax|decimal|The total amount excluding tax. Read-Only.  |
|totalTaxAmount|decimal|The total tax amount for the sales quote. Read-Only.|
|totalAmountIncludingTax|decimal|The total amount including tax. Read-Only.  |
|status|NAV.salesQuoteEntityBufferStatus|Specifies the status of the sales quote. It can be "Draft", "Sent", "Accepted" or "Expired ".|
|sentDate|datetime|The the date and time the quote was sent our to the customer. Read-Only.|
|validUntilDate|date|The date a quote is valid until.|
|acceptedDate|date|The date a sales quote is accepted. Read-Only.|
|lastModifiedDateTime|datetime|The last datetime the sales quote was modified. Read-Only.|
|phoneNumber|string|Specifies the sales quote's telephone number.|
|email|string|Specifies the sales quote's email address.|

## JSON representation

Here is a JSON representation of the salesQuote resource.


```json
{
    "id": "GUID",
    "number": "string",
    "externalDocumentNumber": "string",
    "documentDate": "date",
    "postingDate": "date",
    "dueDate": "date",
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
    "paymentTermsId": "GUID",
    "shipmentMethodId": "GUID",
    "salesperson": "string",
    "discountAmount": "decimal",
    "totalAmountExcludingTax": "decimal",
    "totalTaxAmount": "decimal",
    "totalAmountIncludingTax": "decimal",
    "status": "NAV.salesQuoteEntityBufferStatus",
    "sentDate": "datetime",
    "validUntilDate": "date",
    "acceptedDate": "date",
    "lastModifiedDateTime": "datetime",
    "phoneNumber": "string",
    "email": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET salesQuote](../api/dynamics_salesQuote_Get.md)
[DELETE salesQuote](../api/dynamics_salesQuote_Delete.md)
[POST salesQuote](../api/dynamics_salesQuote_Create.md)
[PATCH salesQuote](../api/dynamics_salesQuote_Update.md)
