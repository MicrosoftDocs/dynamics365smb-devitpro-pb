---
title: purchaseOrderLine resource type  
description: A purchase order line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# purchaseOrderLine resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase order line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseOrderLine](../api/dynamics_purchaseorderline_get.md)|purchaseOrderLine|Gets a purchase order line object.|
|[DELETE purchaseOrderLine](../api/dynamics_purchaseorderline_delete.md)|none|Deletes a purchase order line object.|
|[POST purchaseOrderLine](../api/dynamics_purchaseorderline_create.md)|purchaseOrderLine|Creates a purchase order line object.|
|[PATCH purchaseOrderLine](../api/dynamics_purchaseorderline_update.md)|purchaseOrderLine|Updates a purchase order line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[purchaseOrder](dynamics_purchaseorder.md)|purchaseOrder |Gets the purchaseorder of the purchaseOrderLine.|
|[item](dynamics_item.md)|item |Gets the item of the purchaseOrderLine.|
|[account](dynamics_account.md)|account |Gets the account of the purchaseOrderLine.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the purchaseOrderLine.|
|[itemVariant](dynamics_itemvariant.md)|itemVariant |Gets the itemvariant of the purchaseOrderLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseOrderLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase order line. Non-editable.|
|documentId|GUID|The ID of the parent purchase order line. |
|sequence|integer|The line sequence number.|
|itemId|GUID|The ID of the item in the purchase order line.|
|accountId|GUID|The id of the account that the purchase order line is related to. |
|lineType|NAV.invoiceLineAggLineType|The type of the purchase order line. It can be "Comment", "Account", "Item", "Resource" Value", "Fixed Asset" or "Charge".|
|lineObjectNumber|string|The number of the object (account or item) of the purchase order line.|
|description|string|Specifies the description of the purchase order line.|
|unitOfMeasureId|GUID|The ID of unit of measure for the purchase order line.|
|unitOfMeasureCode|string|The code of unit of measure for the purchase order line.|
|quantity|decimal|The quantity of the item in the purchase order line.|
|directUnitCost|decimal|The direct cost per unit. |
|discountAmount|decimal|The purchase order line discount amount.|
|discountPercent|decimal|The line discount percent.    |
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|amountExcludingTax|decimal|The line amount excluding the tax. Read-Only.|
|taxCode|string|The tax code for the line.       |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|totalTaxAmount|decimal|The total tax amount for the purchase order line. Read-Only.|
|amountIncludingTax|decimal|The total amount for the line including tax. Read-Only.|
|invoiceDiscountAllocation|decimal|The purchase order line discount allocation is the purchase order line discount distributed on the total amount. Read-Only.|
|netAmount|decimal|The net amount is the amount including all discounts (taken from the purchase order line). Read-Only.|
|netTaxAmount|decimal|The net tax amount is the tax amount calculated from net amount. Read-Only.|
|netAmountIncludingTax|decimal|The net amount including tax is the total net amount including tax. Read-Only.|
|expectedReceiptDate|date|The date the item in the line is expected to be received.|
|receivedQuantity|decimal|The quantity of items from the purchase order line that was received.|
|invoicedQuantity|decimal|The quantity of items from the purchase order line that was invoiced.|
|invoiceQuantity|decimal|The quantity of items from the purchase order line to be invoiced.|
|receiveQuantity|decimal|The quantity of items from the purchase order line to be received.|
|itemVariantId|GUID|The ID of the item variant in the purchase order line.|

## JSON representation

Here is a JSON representation of the purchaseOrderLine resource.


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
    "quantity": "decimal",
    "directUnitCost": "decimal",
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
    "receivedQuantity": "decimal",
    "invoicedQuantity": "decimal",
    "invoiceQuantity": "decimal",
    "receiveQuantity": "decimal",
    "itemVariantId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET purchaseOrderLine](../api/dynamics_purchaseorderline_get.md)  
[DELETE purchaseOrderLine](../api/dynamics_purchaseorderline_delete.md)  
[POST purchaseOrderLine](../api/dynamics_purchaseorderline_create.md)  
[PATCH purchaseOrderLine](../api/dynamics_purchaseorderline_update.md)  
