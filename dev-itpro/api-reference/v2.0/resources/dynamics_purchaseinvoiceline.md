---
title: purchaseInvoiceLine resource type | Microsoft Docs
description: A purchase invoice line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# purchaseInvoiceLine resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase invoice line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseInvoiceLine](../api/dynamics_purchaseinvoiceline_get.md)|purchaseInvoiceLine|Gets a purchase invoice line object.|
|[DELETE purchaseInvoiceLine](../api/dynamics_purchaseinvoiceline_delete.md)|none|Deletes a purchase invoice line object.|
|[POST purchaseInvoiceLine](../api/dynamics_purchaseinvoiceline_create.md)|purchaseInvoiceLine|Creates a purchase invoice line object.|
|[PATCH purchaseInvoiceLine](../api/dynamics_purchaseinvoiceline_update.md)|purchaseInvoiceLine|Updates a purchase invoice line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[purchaseInvoice](dynamics_purchaseinvoice.md)|purchaseInvoice |Gets the purchaseinvoice of the purchaseInvoiceLine.|
|[item](dynamics_item.md)|item |Gets the item of the purchaseInvoiceLine.|
|[account](dynamics_account.md)|account |Gets the account of the purchaseInvoiceLine.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the purchaseInvoiceLine.|
|[itemVariant](dynamics_itemvariant.md)|itemVariant |Gets the itemvariant of the purchaseInvoiceLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseInvoiceLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase invoice line. Non-editable.|
|documentId|GUID|The ID of the parent purchase invoice line. |
|sequence|integer|The line sequence number.|
|itemId|GUID|The ID of the item in the purchase invoice line.|
|accountId|GUID|The id of the account that the purchase invoice line is related to. |
|lineType|NAV.invoiceLineAggLineType|The type of the purchase invoice line. It can be "Comment", "Account", "Item", "Resource" Value", "Fixed Asset" or "Charge".|
|lineObjectNumber|string|The number of the object (account or item) of the purchase invoice line.|
|description|string|Specifies the description of the purchase invoice line.|
|unitOfMeasureId|GUID|The ID of unit of measure for the purchase invoice line.|
|unitOfMeasureCode|string|The code of unit of measure for the purchase invoice line.|
|unitCost|decimal|The unit cost of each individual item in the purchase invoice line.|
|quantity|decimal|The quantity of the item in the purchase invoice line.|
|discountAmount|decimal|The purchase invoice line discount amount.|
|discountPercent|decimal|The line discount percent.    |
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|amountExcludingTax|decimal|The line amount excluding the tax. Read-Only.|
|taxCode|string|The tax code for the line.       |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|totalTaxAmount|decimal|The total tax amount for the purchase invoice line. Read-Only.|
|amountIncludingTax|decimal|The total amount for the line including tax. Read-Only.|
|invoiceDiscountAllocation|decimal|The purchase invoice line discount allocation is the purchase invoice line discount distributed on the total amount. Read-Only.|
|netAmount|decimal|The net amount is the amount including all discounts (taken from the purchase invoice line). Read-Only.|
|netTaxAmount|decimal|The net tax amount is the tax amount calculated from net amount. Read-Only.|
|netAmountIncludingTax|decimal|The net amount including tax is the total net amount including tax. Read-Only.|
|expectedReceiptDate|date|The date the item in the line is expected to be received.|
|itemVariantId|GUID|The ID of the item variant in the purchase invoice line.|

## JSON representation

Here is a JSON representation of the purchaseInvoiceLine resource.


```json
{
    "id": "GUID",
    "documentId": "GUID",
    "sequence": "integer",
    "itemId": "GUID",
    "accountId": "GUID",
    "lineType": "NAV.invoiceLineAggLineType",
    "lineObjectNumber": "string",
    "description": "string",
    "unitOfMeasureId": "GUID",
    "unitOfMeasureCode": "string",
    "unitCost": "decimal",
    "quantity": "decimal",
    "discountAmount": "decimal",
    "discountPercent": "decimal",
    "discountAppliedBeforeTax": "boolean",
    "amountExcludingTax": "decimal",
    "taxCode": "string",
    "taxPercent": "decimal",
    "totalTaxAmount": "decimal",
    "amountIncludingTax": "decimal",
    "invoiceDiscountAllocation": "decimal",
    "netAmount": "decimal",
    "netTaxAmount": "decimal",
    "netAmountIncludingTax": "decimal",
    "expectedReceiptDate": "date",
    "itemVariantId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET purchaseInvoiceLine](../api/dynamics_purchaseInvoiceLine_Get.md)
[DELETE purchaseInvoiceLine](../api/dynamics_purchaseInvoiceLine_Delete.md)
[POST purchaseInvoiceLine](../api/dynamics_purchaseInvoiceLine_Create.md)
[PATCH purchaseInvoiceLine](../api/dynamics_purchaseInvoiceLine_Update.md)
