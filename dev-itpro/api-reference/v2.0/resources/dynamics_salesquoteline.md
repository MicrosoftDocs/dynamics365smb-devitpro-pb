---
title: salesQuoteLine resource type  
description: A sales quote line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# salesQuoteLine resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a sales quote line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesQuoteLine](../api/dynamics_salesquoteline_get.md)|salesQuoteLine|Gets a sales quote line object.|
|[DELETE salesQuoteLine](../api/dynamics_salesquoteline_delete.md)|none|Deletes a sales quote line object.|
|[POST salesQuoteLine](../api/dynamics_salesquoteline_create.md)|salesQuoteLine|Creates a sales quote line object.|
|[PATCH salesQuoteLine](../api/dynamics_salesquoteline_update.md)|salesQuoteLine|Updates a sales quote line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[salesQuote](dynamics_salesquote.md)|salesQuote |Gets the salesquote of the salesQuoteLine.|
|[item](dynamics_item.md)|item |Gets the item of the salesQuoteLine.|
|[account](dynamics_account.md)|account |Gets the account of the salesQuoteLine.|
|[unitOfMeasure](dynamics_unitofmeasure.md)|unitOfMeasure |Gets the unitofmeasure of the salesQuoteLine.|
|[itemVariant](dynamics_itemvariant.md)|itemVariant |Gets the itemvariant of the salesQuoteLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the salesQuoteLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the sales quote line. Non-editable.|
|documentId|GUID|The ID of the parent sales quote line. |
|sequence|integer|The line sequence number.|
|itemId|GUID|The ID of the item in the sales quote line.|
|accountId|GUID|The id of the account that the sales quote line is related to. |
|lineType|NAV.invoiceLineAggLineType|The type of the sales quote line. It can be "Comment", "Account", "Item", "Resource" Value", "Fixed Asset" or "Charge".|
|lineObjectNumber|string|The number of the object (account or item) of the sales quote line.|
|description|string|Specifies the description of the sales quote line.|
|unitOfMeasureId|GUID|The ID of unit of measure for the sales quote line.|
|unitOfMeasureCode|string|The code of unit of measure for the sales quote line.|
|unitPrice|decimal|Specifies the price for one unit of the item in the specified sales quote line.|
|quantity|decimal|The quantity of the item in the sales quote line.|
|discountAmount|decimal|The sales quote line discount amount.|
|discountPercent|decimal|The line discount percent.    |
|discountAppliedBeforeTax|boolean|Specifies whether the discount is applied before tax.|
|amountExcludingTax|decimal|The line amount excluding the tax. Read-Only.|
|taxCode|string|The tax code for the line.       |
|taxPercent|decimal|The tax percent for the line. Read-Only.|
|totalTaxAmount|decimal|The total tax amount for the sales quote line. Read-Only.|
|amountIncludingTax|decimal|The total amount for the line including tax. Read-Only.|
|netAmount|decimal|The net amount is the amount including all discounts (taken from the sales quote line). Read-Only.|
|netTaxAmount|decimal|The net tax amount is the tax amount calculated from net amount. Read-Only.|
|netAmountIncludingTax|decimal|The net amount including tax is the total net amount including tax. Read-Only.|
|itemVariantId|GUID|The ID of the item variant in the sales quote line.|

## JSON representation

Here is a JSON representation of the salesQuoteLine resource.


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
    "netAmount": "decimal",
    "netTaxAmount": "decimal",
    "netAmountIncludingTax": "decimal",
    "itemVariantId": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET salesQuoteLine](../api/dynamics_salesQuoteLine_Get.md)
[DELETE salesQuoteLine](../api/dynamics_salesQuoteLine_Delete.md)
[POST salesQuoteLine](../api/dynamics_salesQuoteLine_Create.md)
[PATCH salesQuoteLine](../api/dynamics_salesQuoteLine_Update.md)
