---
title: vendorLedgerEntry resource type
description: Represents a vendorLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# vendorLedgerEntry resource type

Represents a vendor ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET vendorLedgerEntry](../api/dynamics_vendorledgerentry_get.md)|vendorLedgerEntry|Gets a vendorLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|vleEntryNo|integer|The primary key of the vendorLedgerEntry.|
|vleDueDate|Date|Specifies the vleDueDate of the vendorLedgerEntry.|
|vleOpen|boolean|Specifies the vleOpen of the vendorLedgerEntry.|
|vlePostingDate|Date|Specifies the vlePostingDate of the vendorLedgerEntry.|
|vleDocumentDate|Date|Specifies the vleDocumentDate of the vendorLedgerEntry.|
|vleDimensionSetID|integer|Specifies the vleDimensionSetID of the vendorLedgerEntry.|
|vleClosedAtDate|Date|Specifies the vleClosedAtDate of the vendorLedgerEntry.|
|vleReasonCode|string|Specifies the vleReasonCode of the vendorLedgerEntry.|
|dvleEntryNo|integer|The primary key of the vendorLedgerEntry.|
|dvlePostingDate|Date|Specifies the dvlePostingDate of the vendorLedgerEntry.|
|dvleLedgerEntryAmount|boolean|Specifies the dvleLedgerEntryAmount of the vendorLedgerEntry.|
|dvleEntryType|string|Specifies the dvleEntryType of the vendorLedgerEntry.|
|dvleDocumentType|string|Specifies the dvleDocumentType of the vendorLedgerEntry.|
|dvleDocumentNo|string|Specifies the dvleDocumentNo of the vendorLedgerEntry.|
|dvleInitialEntryDueDate|Date|Specifies the dvleInitialEntryDueDate of the vendorLedgerEntry.|
|dvleAmountLCY|decimal|Specifies the dvleAmountLCY of the vendorLedgerEntry.|
|dvleVendorNo|string|Specifies the dvleVendorNo of the vendorLedgerEntry.|
|dvleApplicationNo|integer|Specifies the dvleApplicationNo of the vendorLedgerEntry.|
|dvleAppliedVendLedgerEntryNo|integer|Specifies the dvleAppliedVendLedgerEntryNo of the vendorLedgerEntry.|
|purchInvHeaderDocumentNo|string|Specifies the purchInvHeaderDocumentNo of the vendorLedgerEntry.|
|purchInvHeaderPaymentTermsCode|string|Specifies the purchInvHeaderPaymentTermsCode of the vendorLedgerEntry.|
|purchInvHeaderPmtDiscountDate|Date|Specifies the purchInvHeaderPmtDiscountDate of the vendorLedgerEntry.|

## JSON representation

Here's a JSON representation of the vendorLedgerEntry resource.

```json
{
    "vleEntryNo": 1001,
    "vleDueDate": "2026-02-28",
    "vleOpen": true,
    "vlePostingDate": "2026-01-15",
    "vleDocumentDate": "2026-01-10",
    "vleDimensionSetID": 102,
    "vleClosedAtDate": "2025-12-31",
    "vleReasonCode": "RETURN",
    "dvleEntryNo": 1002,
    "dvlePostingDate": "2026-01-15",
    "dvleLedgerEntryAmount": true,
    "dvleEntryType": "Sale",
    "dvleDocumentType": "Invoice",
    "dvleDocumentNo": "103001",
    "dvleInitialEntryDueDate": "2026-02-28",
    "dvleAmountLCY": 1500.00,
    "dvleVendorNo": "10000",
    "dvleApplicationNo": 0,
    "dvleAppliedVendLedgerEntryNo": 1003,
    "purchInvHeaderDocumentNo": "103001",
    "purchInvHeaderPaymentTermsCode": "1M(8D)",
    "purchInvHeaderPmtDiscountDate": "2026-01-25"
}
```

## Related information

[GET vendorLedgerEntry](../api/dynamics_vendorledgerentry_get.md)
