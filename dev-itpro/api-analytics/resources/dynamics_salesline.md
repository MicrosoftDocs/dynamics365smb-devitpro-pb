---
title: salesLine resource type
description: Represents a salesLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesLine resource type

Represents a sales line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesLine](../api/dynamics_salesline_get.md)|salesLine|Gets a salesLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|orderNo|string|The primary key of the salesLine.|
|documentType|string|The primary key of the salesLine.|
|billToCustomerNo|string|Specifies the billToCustomerNo of the salesLine.|
|sellToCustomerNo|string|Specifies the sellToCustomerNo of the salesLine.|
|salespersonCode|string|Specifies the salespersonCode of the salesLine.|
|opportunityNo|string|Specifies the opportunityNo of the salesLine.|
|quoteNo|string|Specifies the quoteNo of the salesLine.|
|quoteValidUntilDate|Date|Specifies the quoteValidUntilDate of the salesLine.|
|orderDate|Date|Specifies the orderDate of the salesLine.|
|documentDate|Date|Specifies the documentDate of the salesLine.|
|dueDate|Date|Specifies the dueDate of the salesLine.|
|campaignNo|string|Specifies the campaignNo of the salesLine.|
|salesLineDocumentType|string|The primary key of the salesLine.|
|type|string|Specifies the type of the salesLine.|
|description|string|Specifies the description of the salesLine.|
|documentNo|string|The primary key of the salesLine.|
|lineNo|integer|The primary key of the salesLine.|
|itemNo|string|Specifies the itemNo of the salesLine.|
|locationCode|string|Specifies the locationCode of the salesLine.|
|quantityBase|decimal|Specifies the quantityBase of the salesLine.|
|outstandingQtyBase|decimal|Specifies the outstandingQtyBase of the salesLine.|
|outstandingAmountLCY|decimal|Specifies the outstandingAmountLCY of the salesLine.|
|amount|decimal|Specifies the amount of the salesLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the salesLine.|
|outstandingQuantity|decimal|Specifies the outstandingQuantity of the salesLine.|
|returnReasonCode|string|Specifies the returnReasonCode of the salesLine.|
|shipmentDate|Date|Specifies the shipmentDate of the salesLine.|
|plannedShipmentDate|Date|Specifies the plannedShipmentDate of the salesLine.|
|plannedDeliveryDate|Date|Specifies the plannedDeliveryDate of the salesLine.|
|requestedDeliveryDate|Date|Specifies the requestedDeliveryDate of the salesLine.|
|promisedDeliveryDate|Date|Specifies the promisedDeliveryDate of the salesLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesLine.|
|returnQtyRcdNotInvd|decimal|Specifies the returnQtyRcdNotInvd of the salesLine.|
|returnQtyReceivedBase|decimal|Specifies the returnQtyReceivedBase of the salesLine.|
|returnQtyToReceiveBase|decimal|Specifies the returnQtyToReceiveBase of the salesLine.|
|returnRcdNotInvdLCY|decimal|Specifies the returnRcdNotInvdLCY of the salesLine.|
|quantityShippedBase|decimal|Specifies the quantityShippedBase of the salesLine.|
|quantityToShipBase|decimal|Specifies the quantityToShipBase of the salesLine.|
|qtyShippedNotInvdBase|decimal|Specifies the qtyShippedNotInvdBase of the salesLine.|
|shippedNotInvoicedLCYNoVAT|decimal|Specifies the shippedNotInvoicedLCYNoVAT of the salesLine.|
|shippedNotInvoiced|decimal|Specifies the shippedNotInvoiced of the salesLine.|
|quantityInvoiced|decimal|Specifies the quantityInvoiced of the salesLine.|
|projectNo|string|Specifies the projectNo of the salesLine.|
|postingDate|Date|Specifies the postingDate of the salesLine.|

## JSON representation

Here's a JSON representation of the salesLine resource.

```json
{
    "orderNo": "10000",
    "documentType": "Invoice",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "quoteNo": "10000",
    "quoteValidUntilDate": "2026-01-15",
    "orderDate": "2026-01-12",
    "documentDate": "2026-01-10",
    "dueDate": "2026-02-28",
    "campaignNo": "10000",
    "salesLineDocumentType": "Invoice",
    "type": "Item",
    "description": "ATHENS Desk",
    "documentNo": "103001",
    "lineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "outstandingQtyBase": 10.00,
    "outstandingAmountLCY": 1500.00,
    "amount": 1500.00,
    "unitCostLCY": 25.5,
    "outstandingQuantity": 10.00,
    "returnReasonCode": "RETURN",
    "shipmentDate": "2026-01-20",
    "plannedShipmentDate": "2026-01-20",
    "plannedDeliveryDate": "2026-01-15",
    "requestedDeliveryDate": "2026-01-15",
    "promisedDeliveryDate": "2026-01-15",
    "dimensionSetID": 102,
    "returnQtyRcdNotInvd": 10.00,
    "returnQtyReceivedBase": 10.00,
    "returnQtyToReceiveBase": 10.00,
    "returnRcdNotInvdLCY": 100.00,
    "quantityShippedBase": 10.00,
    "quantityToShipBase": 10.00,
    "qtyShippedNotInvdBase": 10.00,
    "shippedNotInvoicedLCYNoVAT": 100.00,
    "shippedNotInvoiced": 100.00,
    "quantityInvoiced": 10.00,
    "projectNo": "10000",
    "postingDate": "2026-01-15"
}
```

## Related information

[GET salesLine](../api/dynamics_salesline_get.md)
