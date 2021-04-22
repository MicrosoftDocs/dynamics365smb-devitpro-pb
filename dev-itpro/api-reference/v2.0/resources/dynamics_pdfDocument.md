---
title: pdfDocument resource type | Microsoft Docs
description: A pdf document object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# pdfDocument resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a pdf document in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET pdfDocument](../api/dynamics_pdfdocument_get.md)|pdfDocument|Gets a pdf document object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[salesInvoice](dynamics_salesinvoice.md)|salesInvoice |Gets the salesinvoice of the pdfDocument.|
|[salesQuote](dynamics_salesquote.md)|salesQuote |Gets the salesquote of the pdfDocument.|
|[salesCreditMemo](dynamics_salescreditmemo.md)|salesCreditMemo |Gets the salescreditmemo of the pdfDocument.|
|[purchaseInvoice](dynamics_purchaseinvoice.md)|purchaseInvoice |Gets the purchaseinvoice of the pdfDocument.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the pdf document. Non-editable.|
|parentId|GUID|The ID of the parent entity. |
|parentType|NAV.attachmentEntityBufferDocumentType|The type of the parent document of the pdf document. It can be " ", "Journal", "Sales Order", "Sales Quote", "Sales Credit Memo", "Sales Invoice" or "Purchase Invoice".|
|pdfDocumentContent|stream|The content of the PDF document.|

## JSON representation

Here is a JSON representation of the pdfDocument resource.


```json
{
    "id": "GUID",
    "parentId": "GUID",
    "parentType": "NAV.attachmentEntityBufferDocumentType",
    "pdfDocumentContent": "stream"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET pdfDocument](../api/dynamics_pdfDocument_Get.md)
