---
title: generalLedgerEntry resource type
description: A general ledger entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# generalLedgerEntry resource type (Beta)

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general ledger entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerEntry](../api/dynamics_generalledgerentry_get.md)|generalLedgerEntry|Gets a general ledger entry object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general ledger entry. Non-editable.|
|number|integer||
|description|string|Specifies the description of the general ledger entry.|
|postingDate|date|The date that the general ledger entry   is posted.|
|accountNumber|string|The number of the account that the general ledger entry is related to. |
|businessUnitCode|string||
|reveresd|boolean||
|documentNumber|string|Specifies a document number for the general ledger entry.|
|externalDocumentNumber|string|Specifies an external document number for the general ledger entry.|
|sourceType|string||
|sourceNumber|string||
|sourceCode|string||
|amount|decimal|Specifies the total amount (including VAT) that the general ledger entry consists of.|
|debitAmount|decimal|Specifies the debitAmount of the general ledger entry.|
|creditAmount|decimal|Specifies the creditAmount of the general ledger entry.|
|vatAmount|decimal||
|additionalCurrencyAmount|decimal||
|dimensionSetID|integer||
|globalDimension1Code|string||
|globalDimension2Code|string||
|lastModifiedDateTime|datetime|The last datetime the general ledger entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the generalLedgerEntry resource.


```json
{
    "id": "GUID",
    "number": "integer",
    "description": "string",
    "postingDate": "date",
    "accountNumber": "string",
    "businessUnitCode": "string",
    "reveresd": "boolean",
    "documentNumber": "string",
    "externalDocumentNumber": "string",
    "sourceType": "string",
    "sourceNumber": "string",
    "sourceCode": "string",
    "amount": "decimal",
    "debitAmount": "decimal",
    "creditAmount": "decimal",
    "vatAmount": "decimal",
    "additionalCurrencyAmount": "decimal",
    "dimensionSetID": "integer",
    "globalDimension1Code": "string",
    "globalDimension2Code": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET generalLedgerEntry](../api/dynamics_generalledgerentry_get.md)
