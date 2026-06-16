---
title: salesInvoiceLine resource type
description: Represents a salesInvoiceLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesInvoiceLine resource type

Represents a sales invoice line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesInvoiceLine](../api/dynamics_salesinvoiceline_get.md)|salesInvoiceLine|Gets a salesInvoiceLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|postingDate|Date|Specifies the postingDate of the salesInvoiceLine.|
|type|string|Specifies the type of the salesInvoiceLine.|
|description|string|Specifies the description of the salesInvoiceLine.|
|documentNo|string|The primary key of the salesInvoiceLine.|
|lineNo|integer|The primary key of the salesInvoiceLine.|
|no|string|Specifies the no of the salesInvoiceLine.|
|locationCode|string|Specifies the locationCode of the salesInvoiceLine.|
|quantityBase|decimal|Specifies the quantityBase of the salesInvoiceLine.|
|amount|decimal|Specifies the amount of the salesInvoiceLine.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the salesInvoiceLine.|
|returnReasonCode|string|Specifies the returnReasonCode of the salesInvoiceLine.|
|shipmentDate|Date|Specifies the shipmentDate of the salesInvoiceLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesInvoiceLine.|
|projectNo|string|Specifies the projectNo of the salesInvoiceLine.|
|billToCustomerNo|string|Specifies the billToCustomerNo of the salesInvoiceLine.|
|sellToCustomerNo|string|Specifies the sellToCustomerNo of the salesInvoiceLine.|
|salesInvoiceDocumentNo|string|Specifies the salesInvoiceDocumentNo of the salesInvoiceLine.|
|campaignNo|string|Specifies the campaignNo of the salesInvoiceLine.|
|salespersonCode|string|Specifies the salespersonCode of the salesInvoiceLine.|
|opportunityNo|string|Specifies the opportunityNo of the salesInvoiceLine.|
|quoteNo|string|Specifies the quoteNo of the salesInvoiceLine.|

## JSON representation

Here's a JSON representation of the salesInvoiceLine resource.

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
    "salesInvoiceDocumentNo": "103001",
    "campaignNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "quoteNo": "10000"
}
```

## Related information

[GET salesInvoiceLine](../api/dynamics_salesinvoiceline_get.md)
