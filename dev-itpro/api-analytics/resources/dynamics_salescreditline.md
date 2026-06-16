---
title: salesCreditLine resource type
description: Represents a salesCreditLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesCreditLine resource type

Represents a sales credit line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesCreditLine](../api/dynamics_salescreditline_get.md)|salesCreditLine|Gets a salesCreditLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|postingDate|Date|Specifies the postingDate of the salesCreditLine.|
|type|string|Specifies the type of the salesCreditLine.|
|description|string|Specifies the description of the salesCreditLine.|
|documentNo|string|The primary key of the salesCreditLine.|
|lineNo|integer|The primary key of the salesCreditLine.|
|no|string|Specifies the no of the salesCreditLine.|
|locationCode|string|Specifies the locationCode of the salesCreditLine.|
|quantityBase|decimal|Specifies the quantityBase of the salesCreditLine.|
|amount|decimal|Specifies the amount of the salesCreditLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the salesCreditLine.|
|returnReasonCode|string|Specifies the returnReasonCode of the salesCreditLine.|
|shipmentDate|Date|Specifies the shipmentDate of the salesCreditLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesCreditLine.|
|projectNo|string|Specifies the projectNo of the salesCreditLine.|
|billToCustomerNo|string|Specifies the billToCustomerNo of the salesCreditLine.|
|sellToCustomerNo|string|Specifies the sellToCustomerNo of the salesCreditLine.|
|salesCreditDocumentNo|string|Specifies the salesCreditDocumentNo of the salesCreditLine.|
|campaignNo|string|Specifies the campaignNo of the salesCreditLine.|
|salespersonCode|string|Specifies the salespersonCode of the salesCreditLine.|
|opportunityNo|string|Specifies the opportunityNo of the salesCreditLine.|

## JSON representation

Here's a JSON representation of the salesCreditLine resource.

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
    "shipmentDate": "2026-01-20",
    "dimensionSetID": 102,
    "projectNo": "10000",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000",
    "salesCreditDocumentNo": "103001",
    "campaignNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000"
}
```

## Related information

[GET salesCreditLine](../api/dynamics_salescreditline_get.md)
