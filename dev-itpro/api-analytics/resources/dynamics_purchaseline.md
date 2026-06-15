---
title: purchaseLine resource type
description: Represents a purchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# purchaseLine resource type

Represents a purchase line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseLine](../api/dynamics_purchaseline_get.md)|purchaseLine|Gets a purchaseLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|orderNo|string|The primary key of the purchaseLine.|
|documentType|string|The primary key of the purchaseLine.|
|payToVendorNo|string|Specifies the payToVendorNo of the purchaseLine.|
|buyFromVendorNo|string|Specifies the buyFromVendorNo of the purchaseLine.|
|purchaserCode|string|Specifies the purchaserCode of the purchaseLine.|
|quoteNo|string|Specifies the quoteNo of the purchaseLine.|
|orderDate|Date|Specifies the orderDate of the purchaseLine.|
|documentDate|Date|Specifies the documentDate of the purchaseLine.|
|dueDate|Date|Specifies the dueDate of the purchaseLine.|
|campaignNo|string|Specifies the campaignNo of the purchaseLine.|
|purchaseLineDocumentType|string|The primary key of the purchaseLine.|
|documentNo|string|The primary key of the purchaseLine.|
|type|string|Specifies the type of the purchaseLine.|
|description|string|Specifies the description of the purchaseLine.|
|lineNo|integer|The primary key of the purchaseLine.|
|itemNo|string|Specifies the itemNo of the purchaseLine.|
|locationCode|string|Specifies the locationCode of the purchaseLine.|
|quantityBase|decimal|Specifies the quantityBase of the purchaseLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the purchaseLine.|
|outstandingAmountLCY|decimal|Specifies the outstandingAmountLCY of the purchaseLine.|
|amount|decimal|Specifies the amount of the purchaseLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the purchaseLine.|
|outstandingQuantity|decimal|Specifies the outstandingQuantity of the purchaseLine.|
|returnReasonCode|string|Specifies the returnReasonCode of the purchaseLine.|
|plannedReceiptDate|Date|Specifies the plannedReceiptDate of the purchaseLine.|
|expectedReceiptDate|Date|Specifies the expectedReceiptDate of the purchaseLine.|
|promisedReceiptDate|Date|Specifies the promisedReceiptDate of the purchaseLine.|
|requestedReceiptDate|Date|Specifies the requestedReceiptDate of the purchaseLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the purchaseLine.|
|qtyRcdNotInvd|decimal|Specifies the qtyRcdNotInvd of the purchaseLine.|
|qtyRcdNotInvdBase|decimal|Specifies the qtyRcdNotInvdBase of the purchaseLine.|
|qtyToReceive|decimal|Specifies the qtyToReceive of the purchaseLine.|
|qtyToReceiveBase|decimal|Specifies the qtyToReceiveBase of the purchaseLine.|
|amtRcdNotInvdExVATLCY|decimal|Specifies the amtRcdNotInvdExVATLCY of the purchaseLine.|
|amtRcdNotInvd|decimal|Specifies the amtRcdNotInvd of the purchaseLine.|
|amtRcdNotInvdLCY|decimal|Specifies the amtRcdNotInvdLCY of the purchaseLine.|
|qtyReceived|decimal|Specifies the qtyReceived of the purchaseLine.|
|qtyReceivedBase|decimal|Specifies the qtyReceivedBase of the purchaseLine.|
|quantityInvoiced|decimal|Specifies the quantityInvoiced of the purchaseLine.|
|projectNo|string|Specifies the projectNo of the purchaseLine.|
|prepmtAmountInvLCY|decimal|Specifies the prepmtAmountInvLCY of the purchaseLine.|

## JSON representation

Here's a JSON representation of the purchaseLine resource.

```json
{
    "orderNo": "string",
    "documentType": "string",
    "payToVendorNo": "string",
    "buyFromVendorNo": "string",
    "purchaserCode": "string",
    "quoteNo": "string",
    "orderDate": "Date",
    "documentDate": "Date",
    "dueDate": "Date",
    "campaignNo": "string",
    "purchaseLineDocumentType": "string",
    "documentNo": "string",
    "type": "string",
    "description": "string",
    "lineNo": "integer",
    "itemNo": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "outstandingQtyBase": "decimal",
    "outstandingAmountLCY": "decimal",
    "amount": "decimal",
    "unitCostLCY": "decimal",
    "outstandingQuantity": "decimal",
    "returnReasonCode": "string",
    "plannedReceiptDate": "Date",
    "expectedReceiptDate": "Date",
    "promisedReceiptDate": "Date",
    "requestedReceiptDate": "Date",
    "dimensionSetID": "integer",
    "qtyRcdNotInvd": "decimal",
    "qtyRcdNotInvdBase": "decimal",
    "qtyToReceive": "decimal",
    "qtyToReceiveBase": "decimal",
    "amtRcdNotInvdExVATLCY": "decimal",
    "amtRcdNotInvd": "decimal",
    "amtRcdNotInvdLCY": "decimal",
    "qtyReceived": "decimal",
    "qtyReceivedBase": "decimal",
    "quantityInvoiced": "decimal",
    "projectNo": "string",
    "prepmtAmountInvLCY": "decimal"
}
```

## Related information

[GET purchaseLine](../api/dynamics_purchaseline_get.md)
