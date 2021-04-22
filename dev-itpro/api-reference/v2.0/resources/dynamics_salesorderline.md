---
title: salesOrderLine resource type  
description: A sales order line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# salesOrderLine resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a sales order line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesOrderLine](../api/dynamics_salesorderline_get.md)|salesOrderLine|Gets a sales order line object.|
|[DELETE salesOrderLine](../api/dynamics_salesorderline_delete.md)|none|Deletes a sales order line object.|
|[POST salesOrderLine](../api/dynamics_salesorderline_create.md)|salesOrderLine|Creates a sales order line object.|
|[PATCH salesOrderLine](../api/dynamics_salesorderline_update.md)|salesOrderLine|Updates a sales order line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[salesOrder](dynamics_salesorder.md)|salesOrder |Gets the salesorder of the salesOrderLine.|
|[item](dynamics_item.md)|item |Gets the item of the salesOrderLine.|
|[account](dynamics_account.md)|account |Gets the account of the salesOrderLine.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the salesOrderLine.|
|[itemVariant](dynamics_itemvariant.md)|itemVariant |Gets the itemvariant of the salesOrderLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesOrderLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales order line. Non-editable.|
|documentId|GUID|The ID of the parent sales order line. |
|sequence|integer|The line sequence number.|
|itemId|GUID|The ID of the item in the sales order line.|
|accountId|GUID|The id of the account that the sales order line is related to. |
|lineType|NAV.invoiceLineAggLineType|The type of the sales order line. It can be "Comment", "Account", "Item", "Resource" Value", "Fixed Asset" or "Charge".|
|lineObjectNumber|string|The number of the object (account or item) of the sales order line.|
|description|string|Specifies the description of the sales order line.|
|unitOfMeasureId|GUID|The ID of unit of measure for the sales order line.|
|unitOfMeasureCode|string|The code of unit of measure for the sales order line.|
|quantity|decimal|The quantity of the item in the sales order line.|
|unitPrice|decimal|Specifies the price for one unit of the item in the specified sales order line.|
|discountAmount|decimal|The sales order line discount amount.|
|discountPercent|decimal|The line discount percent.    |
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|amountExcludingTax|decimal|The line amount excluding the tax. Read-Only.|
|taxCode|string|The tax code for the line.       |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|totalTaxAmount|decimal|The total tax amount for the sales order line. Read-Only.|
|amountIncludingTax|decimal|The total amount for the line including tax. Read-Only.|
|invoiceDiscountAllocation|decimal|The sales order line discount allocation is the sales order line discount distributed on the total amount. Read-Only.|
|netAmount|decimal|The net amount is the amount including all discounts (taken from the sales order line). Read-Only.|
|netTaxAmount|decimal|The net tax amount is the tax amount calculated from net amount. Read-Only.|
|netAmountIncludingTax|decimal|The net amount including tax is the total net amount including tax. Read-Only.|
|shipmentDate|date|The date the item in the line is expected to ship.|
|shippedQuantity|decimal|The quantity of items from the order already shipped.|
|invoicedQuantity|decimal|The quantity of items from the sales order line that was invoiced.|
|invoiceQuantity|decimal|The quantity of items from the sales order line to be invoiced.|
|shipQuantity|decimal|The quantity of items from the order to be shipped.|
|itemVariantId|GUID|The ID of the item variant in the sales order line.|

## JSON representation

Here is a JSON representation of the salesOrderLine resource.


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
    "unitPrice": "decimal",
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
    "shipmentDate": "date",
    "shippedQuantity": "decimal",
    "invoicedQuantity": "decimal",
    "invoiceQuantity": "decimal",
    "shipQuantity": "decimal",
    "itemVariantId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET salesOrderLine](../api/dynamics_salesOrderLine_Get.md)
[DELETE salesOrderLine](../api/dynamics_salesOrderLine_Delete.md)
[POST salesOrderLine](../api/dynamics_salesOrderLine_Create.md)
[PATCH salesOrderLine](../api/dynamics_salesOrderLine_Update.md)
