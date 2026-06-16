---
title: itemReceivedNotInvoicedPurchaseLine resource type
description: Represents a itemReceivedNotInvoicedPurchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemReceivedNotInvoicedPurchaseLine resource type

Represents a item received not invoiced purchase line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemReceivedNotInvoicedPurchaseLine](../api/dynamics_itemreceivednotinvoicedpurchaseline_get.md)|itemReceivedNotInvoicedPurchaseLine|Gets a itemReceivedNotInvoicedPurchaseLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|purchaseOrderNo|string|The primary key of the itemReceivedNotInvoicedPurchaseLine.|
|documentType|string|The primary key of the itemReceivedNotInvoicedPurchaseLine.|
|vendorNo|string|Specifies the vendorNo of the itemReceivedNotInvoicedPurchaseLine.|
|orderDate|Date|Specifies the orderDate of the itemReceivedNotInvoicedPurchaseLine.|
|purchaserCode|string|Specifies the purchaserCode of the itemReceivedNotInvoicedPurchaseLine.|
|purchaseLineDocumentType|string|The primary key of the itemReceivedNotInvoicedPurchaseLine.|
|documentNo|string|The primary key of the itemReceivedNotInvoicedPurchaseLine.|
|lineNo|integer|The primary key of the itemReceivedNotInvoicedPurchaseLine.|
|itemNo|string|Specifies the itemNo of the itemReceivedNotInvoicedPurchaseLine.|
|locationCode|string|Specifies the locationCode of the itemReceivedNotInvoicedPurchaseLine.|
|qtyRcdNotInvoicedBase|decimal|Specifies the qtyRcdNotInvoicedBase of the itemReceivedNotInvoicedPurchaseLine.|
|amtRcdNotInvoicedLCY|decimal|Specifies the amtRcdNotInvoicedLCY of the itemReceivedNotInvoicedPurchaseLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the itemReceivedNotInvoicedPurchaseLine.|

## JSON representation

Here's a JSON representation of the itemReceivedNotInvoicedPurchaseLine resource.

```json
{
    "purchaseOrderNo": "10000",
    "documentType": "Invoice",
    "vendorNo": "20000",
    "orderDate": "2026-01-12",
    "purchaserCode": "JR",
    "purchaseLineDocumentType": "Invoice",
    "documentNo": "103001",
    "lineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "qtyRcdNotInvoicedBase": 10.00,
    "amtRcdNotInvoicedLCY": 100.00,
    "dimensionSetID": 102
}
```

## Related information

[GET itemReceivedNotInvoicedPurchaseLine](../api/dynamics_itemreceivednotinvoicedpurchaseline_get.md)
