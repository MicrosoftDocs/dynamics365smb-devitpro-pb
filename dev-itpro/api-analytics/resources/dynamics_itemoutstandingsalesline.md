---
title: itemOutstandingSalesLine resource type
description: Represents a itemOutstandingSalesLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemOutstandingSalesLine resource type

Represents a item outstanding sales line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemOutstandingSalesLine](../api/dynamics_itemoutstandingsalesline_get.md)|itemOutstandingSalesLine|Gets a itemOutstandingSalesLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|salesOrderNo|string|The primary key of the itemOutstandingSalesLine.|
|documentType|string|The primary key of the itemOutstandingSalesLine.|
|customerNo|string|Specifies the customerNo of the itemOutstandingSalesLine.|
|orderDate|Date|Specifies the orderDate of the itemOutstandingSalesLine.|
|salespersonCode|string|Specifies the salespersonCode of the itemOutstandingSalesLine.|
|salesLineDocumentType|string|The primary key of the itemOutstandingSalesLine.|
|documentNo|string|The primary key of the itemOutstandingSalesLine.|
|lineNo|integer|The primary key of the itemOutstandingSalesLine.|
|itemNo|string|Specifies the itemNo of the itemOutstandingSalesLine.|
|locationCode|string|Specifies the locationCode of the itemOutstandingSalesLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the itemOutstandingSalesLine.|
|outstandingAmountLCY|decimal|Specifies the outstandingAmountLCY of the itemOutstandingSalesLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the itemOutstandingSalesLine.|
|outstandingQuantity|decimal|Specifies the outstandingQuantity of the itemOutstandingSalesLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the itemOutstandingSalesLine.|

## JSON representation

Here's a JSON representation of the itemOutstandingSalesLine resource.

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
    "outstandingQtyBase": 10.00,
    "outstandingAmountLCY": 1500.00,
    "unitCostLCY": 25.5,
    "outstandingQuantity": 10.00,
    "dimensionSetID": 102
}
```

## Related information

[GET itemOutstandingSalesLine](../api/dynamics_itemoutstandingsalesline_get.md)
