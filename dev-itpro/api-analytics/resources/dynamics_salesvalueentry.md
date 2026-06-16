---
title: salesValueEntry resource type
description: Represents a salesValueEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# salesValueEntry resource type

Represents a sales value entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salesValueEntry](../api/dynamics_salesvalueentry_get.md)|salesValueEntry|Gets a salesValueEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|itemLedgerEntryNo|integer|The primary key of the salesValueEntry.|
|itemLedgerEntryType|string|Specifies the itemLedgerEntryType of the salesValueEntry.|
|entryNo|integer|The primary key of the salesValueEntry.|
|entryType|string|Specifies the entryType of the salesValueEntry.|
|documentNo|string|Specifies the documentNo of the salesValueEntry.|
|documentType|string|Specifies the documentType of the salesValueEntry.|
|invoicedQuantity|decimal|Specifies the invoicedQuantity of the salesValueEntry.|
|salesAmountActual|decimal|Specifies the salesAmountActual of the salesValueEntry.|
|costAmountActual|decimal|Specifies the costAmountActual of the salesValueEntry.|
|costAmountNonInvtbl|decimal|Specifies the costAmountNonInvtbl of the salesValueEntry.|
|costPostedToGL|decimal|Specifies the costPostedToGL of the salesValueEntry.|
|customerNo|string|Specifies the customerNo of the salesValueEntry.|
|postingDate|Date|Specifies the postingDate of the salesValueEntry.|
|documentDate|Date|Specifies the documentDate of the salesValueEntry.|
|itemNo|string|Specifies the itemNo of the salesValueEntry.|
|locationCode|string|Specifies the locationCode of the salesValueEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the salesValueEntry.|
|salespersonPurchaserCode|string|Specifies the salespersonPurchaserCode of the salesValueEntry.|
|returnReasonCode|string|Specifies the returnReasonCode of the salesValueEntry.|
|projectNo|string|Specifies the projectNo of the salesValueEntry.|

## JSON representation

Here's a JSON representation of the salesValueEntry resource.

```json
{
    "itemLedgerEntryNo": 1001,
    "itemLedgerEntryType": "Sale",
    "entryNo": 1002,
    "entryType": "Sale",
    "documentNo": "103001",
    "documentType": "Invoice",
    "invoicedQuantity": 10.00,
    "salesAmountActual": 1500.00,
    "costAmountActual": 25.5,
    "costAmountNonInvtbl": 25.5,
    "costPostedToGL": 25.5,
    "customerNo": "10000",
    "postingDate": "2026-01-15",
    "documentDate": "2026-01-10",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "dimensionSetID": 102,
    "salespersonPurchaserCode": "JR",
    "returnReasonCode": "RETURN",
    "projectNo": "10000"
}
```

## Related information

[GET salesValueEntry](../api/dynamics_salesvalueentry_get.md)
