---
title: purchaseValueEntry resource type
description: Represents a purchaseValueEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# purchaseValueEntry resource type

Represents a purchase value entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET purchaseValueEntry](../api/dynamics_purchasevalueentry_get.md)|purchaseValueEntry|Gets a purchaseValueEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the purchaseValueEntry.|
|entryType|string|Specifies the entryType of the purchaseValueEntry.|
|documentNo|string|Specifies the documentNo of the purchaseValueEntry.|
|documentType|string|Specifies the documentType of the purchaseValueEntry.|
|vendorNo|string|Specifies the vendorNo of the purchaseValueEntry.|
|postingDate|Date|Specifies the postingDate of the purchaseValueEntry.|
|itemNo|string|Specifies the itemNo of the purchaseValueEntry.|
|locationCode|string|Specifies the locationCode of the purchaseValueEntry.|
|dimensionSetID|integer|Specifies the dimensionSetID of the purchaseValueEntry.|
|invoicedQuantity|decimal|Specifies the invoicedQuantity of the purchaseValueEntry.|
|costAmountActual|decimal|Specifies the costAmountActual of the purchaseValueEntry.|
|salespersonPurchaserCode|string|Specifies the salespersonPurchaserCode of the purchaseValueEntry.|
|returnReasonCode|string|Specifies the returnReasonCode of the purchaseValueEntry.|
|projectNo|string|Specifies the projectNo of the purchaseValueEntry.|
|adjustment|boolean|Specifies the adjustment of the purchaseValueEntry.|
|capacityLedgerEntryNo|integer|Specifies the capacityLedgerEntryNo of the purchaseValueEntry.|
|discountAmount|decimal|Specifies the discountAmount of the purchaseValueEntry.|
|itemLedgerEntryNo|integer|Specifies the itemLedgerEntryNo of the purchaseValueEntry.|
|itemLedgerEntryType|string|Specifies the itemLedgerEntryType of the purchaseValueEntry.|

## JSON representation

Here's a JSON representation of the purchaseValueEntry resource.

```json
{
    "entryNo": "integer",
    "entryType": "string",
    "documentNo": "string",
    "documentType": "string",
    "vendorNo": "string",
    "postingDate": "Date",
    "itemNo": "string",
    "locationCode": "string",
    "dimensionSetID": "integer",
    "invoicedQuantity": "decimal",
    "costAmountActual": "decimal",
    "salespersonPurchaserCode": "string",
    "returnReasonCode": "string",
    "projectNo": "string",
    "adjustment": "boolean",
    "capacityLedgerEntryNo": "integer",
    "discountAmount": "decimal",
    "itemLedgerEntryNo": "integer",
    "itemLedgerEntryType": "string"
}
```

## Related information

[GET purchaseValueEntry](../api/dynamics_purchasevalueentry_get.md)
