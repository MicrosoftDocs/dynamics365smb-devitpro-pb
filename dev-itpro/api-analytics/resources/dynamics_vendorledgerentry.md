---
title: vendorLedgerEntry resource type
description: Represents a vendorLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "vleEntryNo": "integer",
    "vleDueDate": "Date",
    "vleOpen": "boolean",
    "vlePostingDate": "Date",
    "vleDocumentDate": "Date",
    "vleDimensionSetID": "integer",
    "vleClosedAtDate": "Date",
    "vleReasonCode": "string",
    "dvleEntryNo": "integer",
    "dvlePostingDate": "Date",
    "dvleLedgerEntryAmount": "boolean",
    "dvleEntryType": "string",
    "dvleDocumentType": "string",
    "dvleDocumentNo": "string",
    "dvleInitialEntryDueDate": "Date",
    "dvleAmountLCY": "decimal",
    "dvleVendorNo": "string",
    "dvleApplicationNo": "integer",
    "dvleAppliedVendLedgerEntryNo": "integer",
    "purchInvHeaderDocumentNo": "string",
    "purchInvHeaderPaymentTermsCode": "string",
    "purchInvHeaderPmtDiscountDate": "Date"
}
```

## Related information

[GET vendorLedgerEntry](../api/dynamics_vendorledgerentry_get.md)
