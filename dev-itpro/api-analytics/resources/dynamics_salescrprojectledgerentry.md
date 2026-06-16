---
title: salesCrProjectLedgerEntry resource type
description: Represents a salesCrProjectLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesCrProjectLedgerEntry resource type

Represents a sales cr project ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesCrProjectLedgerEntry](../api/dynamics_salescrprojectledgerentry_get.md)|salesCrProjectLedgerEntry|Gets a salesCrProjectLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|postingDate|Date|Specifies the postingDate of the salesCrProjectLedgerEntry.|
|type|string|Specifies the type of the salesCrProjectLedgerEntry.|
|description|string|Specifies the description of the salesCrProjectLedgerEntry.|
|entryNo|integer|The primary key of the salesCrProjectLedgerEntry.|
|no|string|Specifies the no of the salesCrProjectLedgerEntry.|
|documentNo|string|Specifies the documentNo of the salesCrProjectLedgerEntry.|
|locationCode|string|Specifies the locationCode of the salesCrProjectLedgerEntry.|
|quantityBase|decimal|Specifies the quantityBase of the salesCrProjectLedgerEntry.|
|totalPriceLCY|decimal|Specifies the totalPriceLCY of the salesCrProjectLedgerEntry.|
|totalCostLCY|decimal|Specifies the totalCostLCY of the salesCrProjectLedgerEntry.|
|unitCostLCY|decimal|Specifies the unitCostLCY of the salesCrProjectLedgerEntry.|
|reasonCode|string|Specifies the reasonCode of the salesCrProjectLedgerEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesCrProjectLedgerEntry.|
|projectNo|string|Specifies the projectNo of the salesCrProjectLedgerEntry.|
|salesCreditDocumentNo|string|Specifies the salesCreditDocumentNo of the salesCrProjectLedgerEntry.|
|campaignNo|string|Specifies the campaignNo of the salesCrProjectLedgerEntry.|
|salespersonCode|string|Specifies the salespersonCode of the salesCrProjectLedgerEntry.|
|opportunityNo|string|Specifies the opportunityNo of the salesCrProjectLedgerEntry.|
|billToCustomerNo|string|Specifies the billToCustomerNo of the salesCrProjectLedgerEntry.|
|sellToCustomerNo|string|Specifies the sellToCustomerNo of the salesCrProjectLedgerEntry.|

## JSON representation

Here's a JSON representation of the salesCrProjectLedgerEntry resource.

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
    "salesCreditDocumentNo": "103001",
    "campaignNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000"
}
```

## Related information

[GET salesCrProjectLedgerEntry](../api/dynamics_salescrprojectledgerentry_get.md)
