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
    "orderNo": "string",
    "documentType": "string",
    "billToCustomerNo": "string",
    "sellToCustomerNo": "string",
    "salespersonCode": "string",
    "opportunityNo": "string",
    "quoteNo": "string",
    "quoteValidUntilDate": "Date",
    "orderDate": "Date",
    "documentDate": "Date",
    "dueDate": "Date",
    "campaignNo": "string",
    "salesLineDocumentType": "string",
    "type": "string",
    "description": "string",
    "documentNo": "string",
    "lineNo": "integer",
    "itemNo": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "outstandingQtyBase": "decimal",
    "outstandingAmountLCY": "decimal",
    "amount": "decimal",
    "unitCostLCY": "decimal",
    "outstandingQuantity": "decimal",
    "returnReasonCode": "string",
    "shipmentDate": "Date",
    "plannedShipmentDate": "Date",
    "plannedDeliveryDate": "Date",
    "requestedDeliveryDate": "Date",
    "promisedDeliveryDate": "Date",
    "dimensionSetID": "integer",
    "returnQtyRcdNotInvd": "decimal",
    "returnQtyReceivedBase": "decimal",
    "returnQtyToReceiveBase": "decimal",
    "returnRcdNotInvdLCY": "decimal",
    "quantityShippedBase": "decimal",
    "quantityToShipBase": "decimal",
    "qtyShippedNotInvdBase": "decimal",
    "shippedNotInvoicedLCYNoVAT": "decimal",
    "shippedNotInvoiced": "decimal",
    "quantityInvoiced": "decimal",
    "projectNo": "string",
    "postingDate": "Date"
}
```

## Related information

[GET salesLine](../api/dynamics_salesline_get.md)
