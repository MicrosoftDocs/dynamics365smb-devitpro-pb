---
title: salesInvoices resource type | Microsoft Docs
description: A sales invoice object in Dynamics 365 for Finance and Operations, Business edition. 
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# salesInvoices resource type
Represents a sales invoice in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. 

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                       | Return Type |Description                    |
|:-------------------------------------------------------------|:------------|:------------------------------|
|[GET salesInvoices](../api/dynamics_salesinvoice_get.md)      |salesInvoices|Gets a sales invoice object.   |
|[POST salesInvoices](../api/dynamics_create_salesinvoice.md)  |salesInvoices|Creates a sales invoice object.|
|[PATCH salesInvoices](../api/dynamics_salesinvoice_update.md) |salesInvoices|Updates a sales invoice object.|
|[DELETE salesInvoices](../api/dynamics_salesinvoice_delete.md)|none         |Deletes a sales invoice object.|

## Properties
| Property	            | Type	|Description                                                |
|:----------------------|:----------|:----------------------------------------------------------|
|id                     |GUID       |The invoice ID. Non-editable.                              |
|number                 |string, maximum size 20|The invoice number. Read-Only.                 |
|invoiceDate            |date       |The invoice date                                           |
|customerPurchaseOrderReference|string, maximum size 35|The customer purchase order reference for the invoice|
|dueDate                |date       |The date the invoice is due.                               |
|customerNumber         |string, maximum size 20|The customer number for the invoice.           |
|contactId              |string, maximum size 250|The exchange contact id for the given customer. If a customer id is not specified, we will use the contact id to find it.|
|customerId             |GUID       |The id of the invoice customer.                            |
|customerName           |string, maximum size 50|The full name of the customer. Read-Only.      |
|currencyId             |GUID       |The id of the invoice currency.                            |
|currencyCode           |string, maximum size 10|The currency code for the invoice.             |
|orderId                |GUID       |The unique id of the order to which the invoice is associated to. Read-Only.|
|orderNumber            |string, maximum size 20|The number of the order to which the invoice is associated to. Read-Only.|
|status                 |string, maximum size 20|The invoice status. Status can be: Draft, In Review, Open, Paid, Canceled, or Corrective. Read-Only.|
|discountAmount         |numeric    |The invoice discount amount                                |
|discountAppliedBeforeTax|boolean   |Specifies whether the discount is applied before tax.      |
|totalAmountExcludingTax|numeric    |The total amount excluding tax. Read-Only.                 |
|totalTaxAmount         |numeric    |The total tax amount for the invoice. Read-Only.           |
|totalAmountIncludingTax|numeric    |The total amount for the invoice, including tax. Read-Only.|
|pricesIncludeTax       |boolean    |Specifies whether the prices include Tax or not. Read-Only.|
|billingPostalAddress   |complex    |The billing postal address for the invoice.                |  
|paymentTermsId         |GUID       |The id of the invoice payment term.                        |
|paymentTerms           |string, maximum size 10|The payment terms of the invoice.              |
|shipmentMethodId       |GUID       |The id of the invoice shipment method.                     |
|shipmentMethod         |string, maximum size 10|The shipment method of the invoice.            |
|salesperson            |string, maximum size 20|The salesperson code for the invoice.          |
|lastModifiedDateTime   |datetime   |The last datetime the sales invoice was modified. Read-Only.|


## Relationships
A Currency (currencyCode) must exist in the Currencies table.

A Payment Term (paymentTerms) must exist in the Payment Terms table.

A Shipment Method (shipmentMethod) must exist in the Shipment Method table.

A Customer (customerId) must exist in the Customer table.

An Order (orderId) must exist in the Sales Orders table.

## JSON representation

Here is a JSON representation of the resource.


```json
{
      "id": "GUID",
      "number": "string",
      "invoiceDate": "Date",
      "dueDate": "Date",
      "customerPurchaseOrderReference": "string",
      "customerId": "GUID",
      "contactId": "string",
      "customerNumber": "string",
      "customerName": "string",
      "billingPostalAddress": {NAV.PostalAddress},
      "currencyId": "GUID",
      "currencyCode": "string",
      "orderId": "GUID",
      "orderNumber": "string",
      "paymentTermsId": "GUID",
      "paymentTerms": "string",
      "shipmentMethodId": "GUID",
      "shipmentMethod": "string",
      "salesperson": "string",
      "pricesIncludeTax": "boolean",
      "discountAmount": "decimal",
      "discountAppliedBeforeTax": "boolean",
      "totalAmountExcludingTax": "decimal",
      "totalTaxAmount": "decimal",
      "totalAmountIncludingTax": "decimal",
      "status": "string",
      "lastModifiedDateTime": "DateTime"
}

```
## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get sales invoice](../api/dynamics_salesinvoice_get.md)  
[Create sales invoice](../api/dynamics_create_salesinvoice.md)  
[Update sales invoice](../api/dynamics_salesinvoice_update.md)  
[Delete sales invoice](../api/dynamics_salesinvoice_delete.md)  