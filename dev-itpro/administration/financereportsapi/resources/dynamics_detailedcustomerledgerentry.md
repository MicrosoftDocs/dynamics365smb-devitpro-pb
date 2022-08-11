---
title: detailedCustomerLedgerEntry resource type
description: A detailed customer ledger entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# detailedCustomerLedgerEntry resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a detailed customer ledger entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET detailedCustomerLedgerEntry](../api/dynamics_detailedcustomerledgerentry_get.md)|detailedCustomerLedgerEntry|Gets a detailed customer ledger entry object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNumber|integer|G/L Entry number.|
|entryType|string||
|customerNumber|string|The customer's number.|
|amount|decimal|Specifies the total amount (including VAT) that the detailed customer ledger entry consists of.|
|debitAmount|decimal|Specifies the debitAmount of the detailed customer ledger entry.|
|creditAmount|decimal|Specifies the creditAmount of the detailed customer ledger entry.|
|amountLocalCurrency|decimal||
|debitAmountLocalCurrency|decimal||
|creditAmountLocalCurrency|decimal||
|initialEntryGLobalDim1|string||
|initialEntryGLobalDim2|string||
|postingDate|date|The date that the detailed customer ledger entry   is posted.|
|currencyCode|string|The default currency code for the detailed customer ledger entry.|
|lastModifiedDateTime|datetime|The last datetime the detailed customer ledger entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the detailedCustomerLedgerEntry resource.


```json
{
    "entryNumber": "integer",
    "entryType": "string",
    "customerNumber": "string",
    "amount": "decimal",
    "debitAmount": "decimal",
    "creditAmount": "decimal",
    "amountLocalCurrency": "decimal",
    "debitAmountLocalCurrency": "decimal",
    "creditAmountLocalCurrency": "decimal",
    "initialEntryGLobalDim1": "string",
    "initialEntryGLobalDim2": "string",
    "postingDate": "date",
    "currencyCode": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET detailedCustomerLedgerEntry](../api/dynamics_detailedcustomerledgerentry_get.md)
