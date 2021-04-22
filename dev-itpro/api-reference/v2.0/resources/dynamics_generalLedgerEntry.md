---
title: generalLedgerEntry resource type  
description: A general ledger entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# generalLedgerEntry resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general ledger entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerEntry](../api/dynamics_generalledgerentry_get.md)|generalLedgerEntry|Gets a general ledger entry object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[account](dynamics_account.md)|account |Gets the account of the generalLedgerEntry.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the generalLedgerEntry.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the generalLedgerEntry.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general ledger entry. Non-editable.|
|entryNumber|integer|G/L Entry number.|
|postingDate|date|The date that the general ledger entry   is posted.|
|documentNumber|string|Specifies a document number for the general ledger entry.|
|documentType|NAV.genJournalDocumentType|Specifies the document type of the general ledger entry. It can be " ", "Payment", "Invoice", "Credit Memo", "Finance Charge Memo", "Reminder" or "Refund".|
|accountId|GUID|The id of the account that the general ledger entry is related to. |
|accountNumber|string|The number of the account that the general ledger entry is related to. |
|description|string|Specifies the description of the general ledger entry.|
|debitAmount|decimal|Specifies the debitAmount of the general ledger entry.|
|creditAmount|decimal|Specifies the creditAmount of the general ledger entry.|
|lastModifiedDateTime|datetime|The last datetime the general ledger entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the generalLedgerEntry resource.


```json
{
    "id": "GUID",
    "entryNumber": "integer",
    "postingDate": "date",
    "documentNumber": "string",
    "documentType": "NAV.genJournalDocumentType",
    "accountId": "GUID",
    "accountNumber": "string",
    "description": "string",
    "debitAmount": "decimal",
    "creditAmount": "decimal",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET generalLedgerEntry](../api/dynamics_generalLedgerEntry_Get.md)
