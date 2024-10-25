---
title: purchaseCreditMemoLine resource type
description: A purchase credit memo line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/09/2024
ms.author: solsen
ms.reviewer: solsen
---

# purchaseCreditMemoLine resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a purchase credit memo line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_get.md)|purchaseCreditMemoLine|Gets a purchase credit memo line object.|
|[DELETE purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_delete.md)|none|Deletes a purchase credit memo line object.|
|[POST purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_create.md)|purchaseCreditMemoLine|Creates a purchase credit memo line object.|
|[PATCH purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_update.md)|purchaseCreditMemoLine|Updates a purchase credit memo line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[purchaseCreditMemo](dynamics_purchasecreditmemo.md)|purchaseCreditMemo |Gets the purchasecreditmemo of the purchaseCreditMemoLine.|
|[item](dynamics_item.md)|item |Gets the item of the purchaseCreditMemoLine.|
|[account](dynamics_account.md)|account |Gets the account of the purchaseCreditMemoLine.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the purchaseCreditMemoLine.|
|[itemVariant](dynamics_itemvariant.md)|itemVariant |Gets the itemvariant of the purchaseCreditMemoLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the purchaseCreditMemoLine.|
|[location](dynamics_location.md)|location |Gets the location of the purchaseCreditMemoLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the purchase credit memo line. Non-editable.|
|documentId|GUID|The ID of the parent purchase credit memo line. |
|sequence|integer|The line sequence number.|
|itemId|GUID|The ID of the item in the purchase credit memo line.|
|accountId|GUID|The id of the account that the purchase credit memo line is related to. |
|lineType|NAV.invoiceLineAggLineType|The type of the purchase credit memo line. It can be "Comment", "Account", "Item", "Resource" Value", "Fixed Asset" or "Charge".|
|lineObjectNumber|string|The number of the object (account or item) of the purchase credit memo line.|
|description|string|Specifies the description of the purchase credit memo line.|
|unitOfMeasureId|GUID|The ID of unit of measure for the purchase credit memo line.|
|unitOfMeasureCode|string|The code of unit of measure for the purchase credit memo line.|
|unitCost|decimal|The unit cost of each individual item in the purchase credit memo line.|
|quantity|decimal|The quantity of the item in the purchase credit memo line.|
|discountAmount|decimal|The purchase credit memo line discount amount.|
|discountPercent|decimal|The line discount percent.    |
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|amountExcludingTax|decimal|The line amount excluding the tax. Read-Only.|
|taxCode|string|The tax code for the line.       |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|totalTaxAmount|decimal|The total tax amount for the purchase credit memo line. Read-Only.|
|amountIncludingTax|decimal|The total amount for the line including tax. Read-Only.|
|invoiceDiscountAllocation|decimal|The purchase credit memo line discount allocation is the purchase credit memo line discount distributed on the total amount. Read-Only.|
|netAmount|decimal|The net amount is the amount including all discounts (taken from the purchase credit memo line). Read-Only.|
|netTaxAmount|decimal|The net tax amount is the tax amount calculated from net amount. Read-Only.|
|netAmountIncludingTax|decimal|The net amount including tax is the total net amount including tax. Read-Only.|
|itemVariantId|GUID|The ID of the item variant in the purchase credit memo line.|
|locationId|GUID||

## JSON representation

Here is a JSON representation of the purchaseCreditMemoLine resource.


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
    "itemVariantId": "GUID",
    "locationId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## Related information
[GET purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_get.md)
[DELETE purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_delete.md)
[POST purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_create.md)
[PATCH purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_update.md)
