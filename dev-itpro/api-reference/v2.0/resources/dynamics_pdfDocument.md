---
title: pdfDocument resource type
description: A pdf document object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.date: 04/28/2025

ms.author: solsen
---

# pdfDocument resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a PDF document in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. It allows you to retrieve PDF documents related to various entities such as sales invoices, sales quotes, sales credit memos, purchase invoices, and purchase credit memos.

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pdfDocument](../api/dynamics_pdfdocument_get.md)|pdfDocument|Gets a PDF document object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[salesInvoice](dynamics_salesinvoice.md)|salesInvoice |Gets the salesinvoice of the pdfDocument.|
|[salesOrder](dynamics_salesorder.md)|salesOrder |Gets the salesorder of the pdfDocument.|
|[salesQuote](dynamics_salesquote.md)|salesQuote |Gets the salesquote of the pdfDocument.|
|[salesCreditMemo](dynamics_salescreditmemo.md)|salesCreditMemo |Gets the salescreditmemo of the pdfDocument.|
|[purchaseInvoice](dynamics_purchaseinvoice.md)|purchaseInvoice |Gets the purchaseinvoice of the pdfDocument.|
|[purchaseCreditMemo](dynamics_purchasecreditmemo.md)|purchaseCreditMemo |Gets the purchasecreditmemo of the pdfDocument.|
|[customerContact](dynamics_customercontact.md)|customerContact |Gets the customercontact of the pdfDocument.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the PDF document. Non-editable.|
|parentId|GUID|The ID of the parent entity. |
|parentType|NAV.attachmentEntityBufferDocumentType|The type of the parent document of the PDF document. It can be " ", "Journal", "Sales Order", "Sales Quote", "Sales Credit Memo", "Sales Invoice" or "Purchase Invoice".|
|pdfDocumentContent|stream|The content of the PDF document.|

## JSON representation

Here's a JSON representation of the pdfDocument resource.


```json
{
    "id": "GUID",
    "parentId": "GUID",
    "parentType": "NAV.attachmentEntityBufferDocumentType",
    "pdfDocumentContent": "stream"
}
```

## Related information

[GET pdfDocument](../api/dynamics_pdfDocument_Get.md)
