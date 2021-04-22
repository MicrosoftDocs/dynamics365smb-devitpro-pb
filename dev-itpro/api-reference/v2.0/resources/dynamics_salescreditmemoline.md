---
title: salesCreditMemoLine resource type | Microsoft Docs
description: A sales credit memo line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# salesCreditMemoLine resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a sales credit memo line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesCreditMemoLine](../api/dynamics_salescreditmemoline_get.md)|salesCreditMemoLine|Gets a sales credit memo line object.|
|[DELETE salesCreditMemoLine](../api/dynamics_salescreditmemoline_delete.md)|none|Deletes a sales credit memo line object.|
|[POST salesCreditMemoLine](../api/dynamics_salescreditmemoline_create.md)|salesCreditMemoLine|Creates a sales credit memo line object.|
|[PATCH salesCreditMemoLine](../api/dynamics_salescreditmemoline_update.md)|salesCreditMemoLine|Updates a sales credit memo line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[salesCreditMemo](dynamics_salescreditmemo.md)|salesCreditMemo |Gets the salescreditmemo of the salesCreditMemoLine.|
|[item](dynamics_item.md)|item |Gets the item of the salesCreditMemoLine.|
|[account](dynamics_account.md)|account |Gets the account of the salesCreditMemoLine.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the salesCreditMemoLine.|
|[itemVariant](dynamics_itemvariant.md)|itemVariant |Gets the itemvariant of the salesCreditMemoLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesCreditMemoLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales credit memo line. Non-editable.|
|documentId|GUID|The ID of the parent sales credit memo line. |
|sequence|integer|The line sequence number.|
|itemId|GUID|The ID of the item in the sales credit memo line.|
|accountId|GUID|The id of the account that the sales credit memo line is related to. |
|lineType|NAV.invoiceLineAggLineType|The type of the sales credit memo line. It can be "Comment", "Account", "Item", "Resource" Value", "Fixed Asset" or "Charge".|
|lineObjectNumber|string|The number of the object (account or item) of the sales credit memo line.|
|description|string|Specifies the description of the sales credit memo line.|
|unitOfMeasureId|GUID|The ID of unit of measure for the sales credit memo line.|
|unitOfMeasureCode|string|The code of unit of measure for the sales credit memo line.|
|unitPrice|decimal|Specifies the price for one unit of the item in the specified sales credit memo line.|
|quantity|decimal|The quantity of the item in the sales credit memo line.|
|discountAmount|decimal|The sales credit memo line discount amount.|
|discountPercent|decimal|The line discount percent.    |
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|amountExcludingTax|decimal|The line amount excluding the tax. Read-Only.|
|taxCode|string|The tax code for the line.       |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|totalTaxAmount|decimal|The total tax amount for the sales credit memo line. Read-Only.|
|amountIncludingTax|decimal|The total amount for the line including tax. Read-Only.|
|invoiceDiscountAllocation|decimal|The sales credit memo line discount allocation is the sales credit memo line discount distributed on the total amount. Read-Only.|
|netAmount|decimal|The net amount is the amount including all discounts (taken from the sales credit memo line). Read-Only.|
|netTaxAmount|decimal|The net tax amount is the tax amount calculated from net amount. Read-Only.|
|netAmountIncludingTax|decimal|The net amount including tax is the total net amount including tax. Read-Only.|
|shipmentDate|date|The date the item in the line is expected to ship.|
|itemVariantId|GUID|The ID of the item variant in the sales credit memo line.|

## JSON representation

Here is a JSON representation of the salesCreditMemoLine resource.


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
    "unitPrice": "decimal",
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
    "shipmentDate": "date",
    "itemVariantId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET salesCreditMemoLine](../api/dynamics_salesCreditMemoLine_Get.md)
[DELETE salesCreditMemoLine](../api/dynamics_salesCreditMemoLine_Delete.md)
[POST salesCreditMemoLine](../api/dynamics_salesCreditMemoLine_Create.md)
[PATCH salesCreditMemoLine](../api/dynamics_salesCreditMemoLine_Update.md)
