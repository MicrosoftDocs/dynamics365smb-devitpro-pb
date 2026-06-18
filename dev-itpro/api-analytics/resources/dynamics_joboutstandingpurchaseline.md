---
title: jobOutstandingPurchaseLine resource type
description: Represents a jobOutstandingPurchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# jobOutstandingPurchaseLine resource type

Represents a job outstanding purchase line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobOutstandingPurchaseLine](../api/dynamics_joboutstandingpurchaseline_get.md)|jobOutstandingPurchaseLine|Gets a jobOutstandingPurchaseLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|documentType|string|The primary key of the jobOutstandingPurchaseLine.|
|documentNo|string|The primary key of the jobOutstandingPurchaseLine.|
|no|string|Specifies the no of the jobOutstandingPurchaseLine.|
|type|string|Specifies the type of the jobOutstandingPurchaseLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the jobOutstandingPurchaseLine.|
|outstandingAmountLCY|decimal|Specifies the outstandingAmountLCY of the jobOutstandingPurchaseLine.|
|jobNo|string|Specifies the jobNo of the jobOutstandingPurchaseLine.|
|jobTaskNo|string|Specifies the jobTaskNo of the jobOutstandingPurchaseLine.|
|expectedReceiptDate|Date|Specifies the expectedReceiptDate of the jobOutstandingPurchaseLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the jobOutstandingPurchaseLine.|
|description|string|Specifies the description of the jobOutstandingPurchaseLine.|
|auxiliaryIndex1|integer|The primary key of the jobOutstandingPurchaseLine.|

## JSON representation

Here's a JSON representation of the jobOutstandingPurchaseLine resource.

```json
{
    "documentType": "Invoice",
    "documentNo": "103001",
    "no": "10000",
    "type": "Item",
    "outstandingQtyBase": 10.00,
    "outstandingAmountLCY": 1500.00,
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "expectedReceiptDate": "2026-01-18",
    "dimensionSetID": 102,
    "description": "ATHENS Desk",
    "auxiliaryIndex1": 1
}
```

## Related information

[GET jobOutstandingPurchaseLine](../api/dynamics_joboutstandingpurchaseline_get.md)
