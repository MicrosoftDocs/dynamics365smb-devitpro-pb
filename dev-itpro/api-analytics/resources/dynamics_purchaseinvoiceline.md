---
title: purchaseInvoiceLine resource type
description: Represents a purchaseInvoiceLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# purchaseInvoiceLine resource type

Represents a purchase invoice line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseInvoiceLine](../api/dynamics_purchaseinvoiceline_get.md)|purchaseInvoiceLine|Gets a purchaseInvoiceLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|postingDate|Date|Specifies the postingDate of the purchaseInvoiceLine.|
|type|string|Specifies the type of the purchaseInvoiceLine.|
|description|string|Specifies the description of the purchaseInvoiceLine.|
|documentNo|string|The primary key of the purchaseInvoiceLine.|
|lineNo|integer|The primary key of the purchaseInvoiceLine.|
|no|string|Specifies the no of the purchaseInvoiceLine.|
|locationCode|string|Specifies the locationCode of the purchaseInvoiceLine.|
|quantityBase|decimal|Specifies the quantityBase of the purchaseInvoiceLine.|
|amount|decimal|Specifies the amount of the purchaseInvoiceLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the purchaseInvoiceLine.|
|returnReasonCode|string|Specifies the returnReasonCode of the purchaseInvoiceLine.|
|expectedReceiptDate|Date|Specifies the expectedReceiptDate of the purchaseInvoiceLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the purchaseInvoiceLine.|
|projectNo|string|Specifies the projectNo of the purchaseInvoiceLine.|
|payToVendorNo|string|Specifies the payToVendorNo of the purchaseInvoiceLine.|
|buyFromVendorNo|string|Specifies the buyFromVendorNo of the purchaseInvoiceLine.|
|purchaseInvoiceDocumentNo|string|Specifies the purchaseInvoiceDocumentNo of the purchaseInvoiceLine.|
|campaignNo|string|Specifies the campaignNo of the purchaseInvoiceLine.|
|purchaserCode|string|Specifies the purchaserCode of the purchaseInvoiceLine.|
|quoteNo|string|Specifies the quoteNo of the purchaseInvoiceLine.|

## JSON representation

Here's a JSON representation of the purchaseInvoiceLine resource.

```json
{
    "postingDate": "Date",
    "type": "string",
    "description": "string",
    "documentNo": "string",
    "lineNo": "integer",
    "no": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "amount": "decimal",
    "unitCostLCY": "decimal",
    "returnReasonCode": "string",
    "expectedReceiptDate": "Date",
    "dimensionSetID": "integer",
    "projectNo": "string",
    "payToVendorNo": "string",
    "buyFromVendorNo": "string",
    "purchaseInvoiceDocumentNo": "string",
    "campaignNo": "string",
    "purchaserCode": "string",
    "quoteNo": "string"
}
```

## Related information

[GET purchaseInvoiceLine](../api/dynamics_purchaseinvoiceline_get.md)
