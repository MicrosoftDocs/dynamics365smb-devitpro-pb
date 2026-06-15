---
title: itemOutstandingPurchaseLine resource type
description: Represents a itemOutstandingPurchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# itemOutstandingPurchaseLine resource type

Represents a item outstanding purchase line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemOutstandingPurchaseLine](../api/dynamics_itemoutstandingpurchaseline_get.md)|itemOutstandingPurchaseLine|Gets a itemOutstandingPurchaseLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|purchOrderNo|string|The primary key of the itemOutstandingPurchaseLine.|
|documentType|string|The primary key of the itemOutstandingPurchaseLine.|
|vendorNo|string|Specifies the vendorNo of the itemOutstandingPurchaseLine.|
|orderDate|Date|Specifies the orderDate of the itemOutstandingPurchaseLine.|
|purchaserCode|string|Specifies the purchaserCode of the itemOutstandingPurchaseLine.|
|purchaseLineDocumentType|string|The primary key of the itemOutstandingPurchaseLine.|
|documentNo|string|The primary key of the itemOutstandingPurchaseLine.|
|lineNo|integer|The primary key of the itemOutstandingPurchaseLine.|
|itemNo|string|Specifies the itemNo of the itemOutstandingPurchaseLine.|
|locationCode|string|Specifies the locationCode of the itemOutstandingPurchaseLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the itemOutstandingPurchaseLine.|
|outstandingAmountLCY|decimal|Specifies the outstandingAmountLCY of the itemOutstandingPurchaseLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the itemOutstandingPurchaseLine.|

## JSON representation

Here's a JSON representation of the itemOutstandingPurchaseLine resource.

```json
{
    "purchOrderNo": "string",
    "documentType": "string",
    "vendorNo": "string",
    "orderDate": "Date",
    "purchaserCode": "string",
    "purchaseLineDocumentType": "string",
    "documentNo": "string",
    "lineNo": "integer",
    "itemNo": "string",
    "locationCode": "string",
    "outstandingQtyBase": "decimal",
    "outstandingAmountLCY": "decimal",
    "dimensionSetID": "integer"
}
```

## Related information

[GET itemOutstandingPurchaseLine](../api/dynamics_itemoutstandingpurchaseline_get.md)
