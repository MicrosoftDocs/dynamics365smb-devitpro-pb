---
title: itemShippedNotInvoicedSalesLine resource type
description: Represents a itemShippedNotInvoicedSalesLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# itemShippedNotInvoicedSalesLine resource type

Represents a item shipped not invoiced sales line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemShippedNotInvoicedSalesLine](../api/dynamics_itemshippednotinvoicedsalesline_get.md)|itemShippedNotInvoicedSalesLine|Gets a itemShippedNotInvoicedSalesLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|salesOrderNo|string|The primary key of the itemShippedNotInvoicedSalesLine.|
|documentType|string|The primary key of the itemShippedNotInvoicedSalesLine.|
|customerNo|string|Specifies the customerNo of the itemShippedNotInvoicedSalesLine.|
|orderDate|Date|Specifies the orderDate of the itemShippedNotInvoicedSalesLine.|
|salespersonCode|string|Specifies the salespersonCode of the itemShippedNotInvoicedSalesLine.|
|salesLineDocumentType|string|The primary key of the itemShippedNotInvoicedSalesLine.|
|documentNo|string|The primary key of the itemShippedNotInvoicedSalesLine.|
|lineNo|integer|The primary key of the itemShippedNotInvoicedSalesLine.|
|itemNo|string|Specifies the itemNo of the itemShippedNotInvoicedSalesLine.|
|locationCode|string|Specifies the locationCode of the itemShippedNotInvoicedSalesLine.|
|qtyShippedNotInvdBase|decimal|Specifies the qtyShippedNotInvdBase of the itemShippedNotInvoicedSalesLine.|
|shippedNotInvoicedLCY|decimal|Specifies the shippedNotInvoicedLCY of the itemShippedNotInvoicedSalesLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the itemShippedNotInvoicedSalesLine.|
|shippedNotInvoiced|decimal|Specifies the shippedNotInvoiced of the itemShippedNotInvoicedSalesLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the itemShippedNotInvoicedSalesLine.|

## JSON representation

Here's a JSON representation of the itemShippedNotInvoicedSalesLine resource.

```json
{
    "salesOrderNo": "10000",
    "documentType": "Invoice",
    "customerNo": "10000",
    "orderDate": "2026-01-12",
    "salespersonCode": "JR",
    "salesLineDocumentType": "Invoice",
    "documentNo": "103001",
    "lineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "qtyShippedNotInvdBase": 10.00,
    "shippedNotInvoicedLCY": 100.00,
    "unitCostLCY": 25.5,
    "shippedNotInvoiced": 100.00,
    "dimensionSetID": 102
}
```

## Related information

[GET itemShippedNotInvoicedSalesLine](../api/dynamics_itemshippednotinvoicedsalesline_get.md)
