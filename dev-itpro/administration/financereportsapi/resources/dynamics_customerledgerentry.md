---
title: customerLedgerEntry resource type
description: A customer ledger entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# customerLedgerEntry resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a customer ledger entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET customerLedgerEntry](../api/dynamics_customerledgerentry_get.md)|customerLedgerEntry|Gets a customer ledger entry object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNumber|integer|G/L Entry number.|
|documentType|string|Specifies the document type of the customer ledger entry.|
|description|string|Specifies the description of the customer ledger entry.|
|postingDate|date|The date that the customer ledger entry   is posted.|
|documentNumber|string|Specifies a document number for the customer ledger entry.|
|externalDocumentNumber|string|Specifies an external document number for the customer ledger entry.|
|balancingAccountNumber|string|The balancing G/L Account number.|
|balancingAccountType|string||
|customerNumber|string|The customer's number.|
|open|boolean||
|dimensionSetID|integer||
|currencyCode|string|The default currency code for the customer ledger entry.|
|lastModifiedDateTime|datetime|The last datetime the customer ledger entry was modified. Read-Only.|
|amount|decimal|Specifies the total amount (including VAT) that the customer ledger entry consists of.|
|debitAmount|decimal|Specifies the debitAmount of the customer ledger entry.|
|creditAmount|decimal|Specifies the creditAmount of the customer ledger entry.|
|amountLocalCurrency|decimal||
|debitAmountLocalCurrency|decimal||
|creditAmountLocalCurrency|decimal||

## JSON representation

Here is a JSON representation of the customerLedgerEntry resource.


```json
{
    "entryNumber": "integer",
    "documentType": "string",
    "description": "string",
    "postingDate": "date",
    "documentNumber": "string",
    "externalDocumentNumber": "string",
    "balancingAccountNumber": "string",
    "balancingAccountType": "string",
    "customerNumber": "string",
    "open": "boolean",
    "dimensionSetID": "integer",
    "currencyCode": "string",
    "lastModifiedDateTime": "datetime",
    "amount": "decimal",
    "debitAmount": "decimal",
    "creditAmount": "decimal",
    "amountLocalCurrency": "decimal",
    "debitAmountLocalCurrency": "decimal",
    "creditAmountLocalCurrency": "decimal"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET customerLedgerEntry](../api/dynamics_customerledgerentry_get.md)
