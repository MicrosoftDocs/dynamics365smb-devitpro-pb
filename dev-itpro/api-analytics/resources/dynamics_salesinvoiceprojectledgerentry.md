---
title: salesInvoiceProjectLedgerEntry resource type
description: Represents a salesInvoiceProjectLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# salesInvoiceProjectLedgerEntry resource type

Represents a sales invoice project ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesInvoiceProjectLedgerEntry](../api/dynamics_salesinvoiceprojectledgerentry_get.md)|salesInvoiceProjectLedgerEntry|Gets a salesInvoiceProjectLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|postingDate|Date|Specifies the postingDate of the salesInvoiceProjectLedgerEntry.|
|type|string|Specifies the type of the salesInvoiceProjectLedgerEntry.|
|description|string|Specifies the description of the salesInvoiceProjectLedgerEntry.|
|entryNo|integer|The primary key of the salesInvoiceProjectLedgerEntry.|
|no|string|Specifies the no of the salesInvoiceProjectLedgerEntry.|
|documentNo|string|Specifies the documentNo of the salesInvoiceProjectLedgerEntry.|
|locationCode|string|Specifies the locationCode of the salesInvoiceProjectLedgerEntry.|
|quantityBase|decimal|Specifies the quantityBase of the salesInvoiceProjectLedgerEntry.|
|totalPriceLCY|decimal|Specifies the totalPriceLCY of the salesInvoiceProjectLedgerEntry.|
|totalCostLCY|decimal|Specifies the totalCostLCY of the salesInvoiceProjectLedgerEntry.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the salesInvoiceProjectLedgerEntry.|
|reasonCode|string|Specifies the reasonCode of the salesInvoiceProjectLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesInvoiceProjectLedgerEntry.|
|projectNo|string|Specifies the projectNo of the salesInvoiceProjectLedgerEntry.|
|salesInvoiceDocumentNo|string|Specifies the salesInvoiceDocumentNo of the salesInvoiceProjectLedgerEntry.|
|campaignNo|string|Specifies the campaignNo of the salesInvoiceProjectLedgerEntry.|
|salespersonCode|string|Specifies the salespersonCode of the salesInvoiceProjectLedgerEntry.|
|opportunityNo|string|Specifies the opportunityNo of the salesInvoiceProjectLedgerEntry.|
|quoteNo|string|Specifies the quoteNo of the salesInvoiceProjectLedgerEntry.|
|billToCustomerNo|string|Specifies the billToCustomerNo of the salesInvoiceProjectLedgerEntry.|
|sellToCustomerNo|string|Specifies the sellToCustomerNo of the salesInvoiceProjectLedgerEntry.|

## JSON representation

Here's a JSON representation of the salesInvoiceProjectLedgerEntry resource.

```json
{
    "postingDate": "2026-01-15",
    "type": "Item",
    "description": "ATHENS Desk",
    "entryNo": 1001,
    "no": "10000",
    "documentNo": "103001",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "totalPriceLCY": 49.99,
    "totalCostLCY": 25.5,
    "unitCostLCY": 25.5,
    "reasonCode": "RETURN",
    "dimensionSetID": 102,
    "projectNo": "10000",
    "salesInvoiceDocumentNo": "103001",
    "campaignNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "quoteNo": "10000",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000"
}
```

## Related information

[GET salesInvoiceProjectLedgerEntry](../api/dynamics_salesinvoiceprojectledgerentry_get.md)
