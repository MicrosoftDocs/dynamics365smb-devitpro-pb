---
title: documentAttachment resource type
description: A document attachment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/08/2023
ms.author: solsen
---

# documentAttachment resource type

Represents a document attachment in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET documentAttachment](../api/dynamics_documentattachment_get.md)|documentAttachment|Gets a document attachment object.|
|[DELETE documentAttachment](../api/dynamics_documentattachment_delete.md)|none|Deletes a document attachment object.|
|[POST documentAttachment](../api/dynamics_documentattachment_create.md)|documentAttachment|Creates a document attachment object.|
|[PATCH documentAttachment](../api/dynamics_documentattachment_update.md)|documentAttachment|Updates a document attachment object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[item](dynamics_item.md)|item |Gets the item of the documentAttachment.|
|[customer](dynamics_customer.md)|customer |Gets the customer of the documentAttachment.|
|[vendor](dynamics_vendor.md)|vendor |Gets the vendor of the documentAttachment.|
|[salesInvoice](dynamics_salesinvoice.md)|salesInvoice |Gets the salesinvoice of the documentAttachment.|
|[employee](dynamics_employee.md)|employee |Gets the employee of the documentAttachment.|
|[salesCreditMemo](dynamics_salescreditmemo.md)|salesCreditMemo |Gets the salescreditmemo of the documentAttachment.|
|[purchaseInvoice](dynamics_purchaseinvoice.md)|purchaseInvoice |Gets the purchaseinvoice of the documentAttachment.|
|[project](dynamics_project.md)|project |Gets the project of the documentAttachment.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the document attachment. Non-editable.|
|fileName|string|Logical filename.|
|byteSize|integer|File size.|
|attachmentContent|stream|The attachment's content.|
|parentType|NAV.attachmentEntityBufferDocumentType|The type of the parent document of the document attachment. It can be " ", "Journal", "Sales Order", "Sales Quote", "Sales Credit Memo", "Sales Invoice" or "Purchase Invoice".|
|parentId|GUID|The ID of the parent entity. |
|lineNumber|integer|The order of the specific line, which increments in 10000, for example: 10000, 20000, 30000.|
|documentFlowSales|boolean||
|documentFlowPurchase|boolean||
|lastModifiedDateTime|datetime|The last datetime the document attachment was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the documentAttachment resource.


```json
{
    "id": "GUID",
    "fileName": "string",
    "byteSize": "integer",
    "attachmentContent": "stream",
    "parentType": "NAV.attachmentEntityBufferDocumentType",
    "parentId": "GUID",
    "lineNumber": "integer",
    "documentFlowSales": "boolean",
    "documentFlowPurchase": "boolean",
    "lastModifiedDateTime": "datetime"
}
```

## See Also
[GET documentAttachment](../api/dynamics_documentattachment_get.md)
[DELETE documentAttachment](../api/dynamics_documentattachment_delete.md)
[POST documentAttachment](../api/dynamics_documentattachment_create.md)
[PATCH documentAttachment](../api/dynamics_documentattachment_update.md)
