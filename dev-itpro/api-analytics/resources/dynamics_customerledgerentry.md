---
title: customerLedgerEntry resource type
description: Represents a customerLedgerEntry entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# customerLedgerEntry resource type

Represents a customer ledger entry in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerLedgerEntry](../api/dynamics_customerledgerentry_get.md)|customerLedgerEntry|Gets a customerLedgerEntry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|cleEntryNo|integer|The primary key of the customerLedgerEntry.|
|cleDueDate|Date|Specifies the cleDueDate of the customerLedgerEntry.|
|cleOpen|boolean|Specifies the cleOpen of the customerLedgerEntry.|
|clePostingDate|Date|Specifies the clePostingDate of the customerLedgerEntry.|
|cleDocumentDate|Date|Specifies the cleDocumentDate of the customerLedgerEntry.|
|cleDimensionSetID|integer|Specifies the cleDimensionSetID of the customerLedgerEntry.|
|cleClosedAtDate|Date|Specifies the cleClosedAtDate of the customerLedgerEntry.|
|cleReasonCode|string|Specifies the cleReasonCode of the customerLedgerEntry.|
|dcleEntryNo|integer|The primary key of the customerLedgerEntry.|
|dclePostingDate|Date|Specifies the dclePostingDate of the customerLedgerEntry.|
|dcleLedgerEntryAmount|boolean|Specifies the dcleLedgerEntryAmount of the customerLedgerEntry.|
|dcleEntryType|string|Specifies the dcleEntryType of the customerLedgerEntry.|
|dcleDocumentType|string|Specifies the dcleDocumentType of the customerLedgerEntry.|
|dcleDocumentNo|string|Specifies the dcleDocumentNo of the customerLedgerEntry.|
|dcleInitialEntryDueDate|Date|Specifies the dcleInitialEntryDueDate of the customerLedgerEntry.|
|dcleAmountLCY|decimal|Specifies the dcleAmountLCY of the customerLedgerEntry.|
|dcleCustomerNo|string|Specifies the dcleCustomerNo of the customerLedgerEntry.|
|dcleApplicationNo|integer|Specifies the dcleApplicationNo of the customerLedgerEntry.|
|dcleAppliedCustLedgerEntryNo|integer|Specifies the dcleAppliedCustLedgerEntryNo of the customerLedgerEntry.|
|salesInvHeaderDocumentNo|string|Specifies the salesInvHeaderDocumentNo of the customerLedgerEntry.|
|salesInvHeaderPaymentTermsCode|string|Specifies the salesInvHeaderPaymentTermsCode of the customerLedgerEntry.|
|salesInvHeaderPmtDiscountDate|Date|Specifies the salesInvHeaderPmtDiscountDate of the customerLedgerEntry.|

## JSON representation

Here's a JSON representation of the customerLedgerEntry resource.

```json
{
    "cleEntryNo": "integer",
    "cleDueDate": "Date",
    "cleOpen": "boolean",
    "clePostingDate": "Date",
    "cleDocumentDate": "Date",
    "cleDimensionSetID": "integer",
    "cleClosedAtDate": "Date",
    "cleReasonCode": "string",
    "dcleEntryNo": "integer",
    "dclePostingDate": "Date",
    "dcleLedgerEntryAmount": "boolean",
    "dcleEntryType": "string",
    "dcleDocumentType": "string",
    "dcleDocumentNo": "string",
    "dcleInitialEntryDueDate": "Date",
    "dcleAmountLCY": "decimal",
    "dcleCustomerNo": "string",
    "dcleApplicationNo": "integer",
    "dcleAppliedCustLedgerEntryNo": "integer",
    "salesInvHeaderDocumentNo": "string",
    "salesInvHeaderPaymentTermsCode": "string",
    "salesInvHeaderPmtDiscountDate": "Date"
}
```

## Related information

[GET customerLedgerEntry](../api/dynamics_customerledgerentry_get.md)
