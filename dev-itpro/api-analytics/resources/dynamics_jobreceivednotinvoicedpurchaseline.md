---
title: jobReceivedNotInvoicedPurchaseLine resource type
description: Represents a jobReceivedNotInvoicedPurchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# jobReceivedNotInvoicedPurchaseLine resource type

Represents a job received not invoiced purchase line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobReceivedNotInvoicedPurchaseLine](../api/dynamics_jobreceivednotinvoicedpurchaseline_get.md)|jobReceivedNotInvoicedPurchaseLine|Gets a jobReceivedNotInvoicedPurchaseLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|documentType|string|The primary key of the jobReceivedNotInvoicedPurchaseLine.|
|documentNo|string|The primary key of the jobReceivedNotInvoicedPurchaseLine.|
|no|string|Specifies the no of the jobReceivedNotInvoicedPurchaseLine.|
|lineNo|integer|The primary key of the jobReceivedNotInvoicedPurchaseLine.|
|type|string|Specifies the type of the jobReceivedNotInvoicedPurchaseLine.|
|qtyRcdNotInvoicedBase|decimal|Specifies the qtyRcdNotInvoicedBase of the jobReceivedNotInvoicedPurchaseLine.|
|amtRcdNotInvoicedLCY|decimal|Specifies the amtRcdNotInvoicedLCY of the jobReceivedNotInvoicedPurchaseLine.|
|jobNo|string|Specifies the jobNo of the jobReceivedNotInvoicedPurchaseLine.|
|jobTaskNo|string|Specifies the jobTaskNo of the jobReceivedNotInvoicedPurchaseLine.|
|expectedReceiptDate|Date|Specifies the expectedReceiptDate of the jobReceivedNotInvoicedPurchaseLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the jobReceivedNotInvoicedPurchaseLine.|
|description|string|Specifies the description of the jobReceivedNotInvoicedPurchaseLine.|

## JSON representation

Here's a JSON representation of the jobReceivedNotInvoicedPurchaseLine resource.

```json
{
    "documentType": "Invoice",
    "documentNo": "103001",
    "no": "10000",
    "lineNo": 10000,
    "type": "Item",
    "qtyRcdNotInvoicedBase": 10.00,
    "amtRcdNotInvoicedLCY": 100.00,
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "expectedReceiptDate": "2026-01-18",
    "dimensionSetID": 102,
    "description": "ATHENS Desk"
}
```

## Related information

[GET jobReceivedNotInvoicedPurchaseLine](../api/dynamics_jobreceivednotinvoicedpurchaseline_get.md)
