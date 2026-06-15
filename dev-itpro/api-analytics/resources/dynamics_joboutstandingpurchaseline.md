---
title: jobOutstandingPurchaseLine resource type
description: Represents a jobOutstandingPurchaseLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "documentType": "string",
    "documentNo": "string",
    "no": "string",
    "type": "string",
    "outstandingQtyBase": "decimal",
    "outstandingAmountLCY": "decimal",
    "jobNo": "string",
    "jobTaskNo": "string",
    "expectedReceiptDate": "Date",
    "dimensionSetID": "integer",
    "description": "string",
    "auxiliaryIndex1": "integer"
}
```

## Related information

[GET jobOutstandingPurchaseLine](../api/dynamics_joboutstandingpurchaseline_get.md)
