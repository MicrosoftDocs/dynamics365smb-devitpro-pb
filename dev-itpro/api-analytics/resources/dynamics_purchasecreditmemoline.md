---
title: purchaseCreditMemoLine resource type
description: Represents a purchaseCreditMemoLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# purchaseCreditMemoLine resource type

Represents a purchase credit memo line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_get.md)|purchaseCreditMemoLine|Gets a purchaseCreditMemoLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|postingDate|Date|Specifies the postingDate of the purchaseCreditMemoLine.|
|type|string|Specifies the type of the purchaseCreditMemoLine.|
|description|string|Specifies the description of the purchaseCreditMemoLine.|
|documentNo|string|The primary key of the purchaseCreditMemoLine.|
|lineNo|integer|The primary key of the purchaseCreditMemoLine.|
|no|string|Specifies the no of the purchaseCreditMemoLine.|
|locationCode|string|Specifies the locationCode of the purchaseCreditMemoLine.|
|quantityBase|decimal|Specifies the quantityBase of the purchaseCreditMemoLine.|
|amount|decimal|Specifies the amount of the purchaseCreditMemoLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the purchaseCreditMemoLine.|
|returnReasonCode|string|Specifies the returnReasonCode of the purchaseCreditMemoLine.|
|expectedReceiptDate|Date|Specifies the expectedReceiptDate of the purchaseCreditMemoLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the purchaseCreditMemoLine.|
|projectNo|string|Specifies the projectNo of the purchaseCreditMemoLine.|
|payToVendorNo|string|Specifies the payToVendorNo of the purchaseCreditMemoLine.|
|buyFromVendorNo|string|Specifies the buyFromVendorNo of the purchaseCreditMemoLine.|
|purchaseCreditMemoDocumentNo|string|Specifies the purchaseCreditMemoDocumentNo of the purchaseCreditMemoLine.|
|campaignNo|string|Specifies the campaignNo of the purchaseCreditMemoLine.|
|purchaserCode|string|Specifies the purchaserCode of the purchaseCreditMemoLine.|

## JSON representation

Here's a JSON representation of the purchaseCreditMemoLine resource.

```json
{
    "postingDate": "2026-01-15",
    "type": "Item",
    "description": "ATHENS Desk",
    "documentNo": "103001",
    "lineNo": 10000,
    "no": "10000",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "amount": 1500.00,
    "unitCostLCY": 25.5,
    "returnReasonCode": "RETURN",
    "expectedReceiptDate": "2026-01-18",
    "dimensionSetID": 102,
    "projectNo": "10000",
    "payToVendorNo": "10000",
    "buyFromVendorNo": "10000",
    "purchaseCreditMemoDocumentNo": "103001",
    "campaignNo": "10000",
    "purchaserCode": "JR"
}
```

## Related information

[GET purchaseCreditMemoLine](../api/dynamics_purchasecreditmemoline_get.md)
