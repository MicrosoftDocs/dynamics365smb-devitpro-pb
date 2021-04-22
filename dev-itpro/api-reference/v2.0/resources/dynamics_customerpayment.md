---
title: customerPayment resource type | Microsoft Docs
description: A customer payment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# customerPayment resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a customer payment in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerPayment](../api/dynamics_customerpayment_get.md)|customerPayment|Gets a customer payment object.|
|[DELETE customerPayment](../api/dynamics_customerpayment_delete.md)|none|Deletes a customer payment object.|
|[POST customerPayment](../api/dynamics_customerpayment_create.md)|customerPayment|Creates a customer payment object.|
|[PATCH customerPayment](../api/dynamics_customerpayment_update.md)|customerPayment|Updates a customer payment object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[customerPaymentJournal](dynamics_customerpaymentjournal.md)|customerPaymentJournal |Gets the customerpaymentjournal of the customerPayment.|
|[customer](dynamics_customer.md)|customer |Gets the customer of the customerPayment.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the customerPayment.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the customer payment. Non-editable.|
|journalId|GUID|The ID of the journal.|
|journalDisplayName|string|The display name of the journal that this line belongs to. Read-Only.|
|lineNumber|integer|The customer payment item line number.|
|customerId|GUID|The unique ID of customer.  |
|customerNumber|string|The customer's number.|
|postingDate|date|The date that the customer payment   is posted.|
|documentNumber|string|Specifies a document number for the customer payment.|
|externalDocumentNumber|string|Specifies an external document number for the customer payment.|
|amount|decimal|Specifies the total amount (including VAT) that the customer payment consists of.|
|appliesToInvoiceId|GUID|The unique ID of the invoice that the customer payment is related to.|
|appliesToInvoiceNumber|string|The number of the invoice that the customer payment is related to.|
|description|string|Specifies the description of the customer payment.|
|comment|string|A user specified comment on the customer payment.|
|lastModifiedDateTime|datetime|The last datetime the customer payment was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the customerPayment resource.


```json
{
    "id": "GUID",
    "journalId": "GUID",
    "journalDisplayName": "string",
    "lineNumber": "integer",
    "customerId": "GUID",
    "customerNumber": "string",
    "postingDate": "date",
    "documentNumber": "string",
    "externalDocumentNumber": "string",
    "amount": "decimal",
    "appliesToInvoiceId": "GUID",
    "appliesToInvoiceNumber": "string",
    "description": "string",
    "comment": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET customerPayment](../api/dynamics_customerPayment_Get.md)
[DELETE customerPayment](../api/dynamics_customerPayment_Delete.md)
[POST customerPayment](../api/dynamics_customerPayment_Create.md)
[PATCH customerPayment](../api/dynamics_customerPayment_Update.md)
