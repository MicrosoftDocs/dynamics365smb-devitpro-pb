---
title: journalLine resource type | Microsoft Docs
description: A journal line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# journalLine resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a journal line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET journalLine](../api/dynamics_journalline_get.md)|journalLine|Gets a journal line object.|
|[DELETE journalLine](../api/dynamics_journalline_delete.md)|none|Deletes a journal line object.|
|[POST journalLine](../api/dynamics_journalline_create.md)|journalLine|Creates a journal line object.|
|[PATCH journalLine](../api/dynamics_journalline_update.md)|journalLine|Updates a journal line object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[journal](dynamics_journal.md)|journal |Gets the journal of the journalLine.|
|[customerPaymentJournal](dynamics_customerpaymentjournal.md)|customerPaymentJournal |Gets the customerpaymentjournal of the journalLine.|
|[account](dynamics_account.md)|account |Gets the account of the journalLine.|
|[attachments](dynamics_attachment.md)|attachments |Gets the attachments of the journalLine.|
|[dimensionSetLines](dynamics_dimensionsetline.md)|dimensionSetLines |Gets the dimensionsetlines of the journalLine.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the journal line. Non-editable.|
|journalId|GUID|The ID of the journal.|
|journalDisplayName|string|The display name of the journal that this line belongs to. Read-Only.|
|lineNumber|integer|The journal line item line number.|
|accountType|NAV.genJournalAccountType|Specifies the type of account. It can be "G/L Account", "Customer", "Vendor", "Bank Account", "Fixed Asset", "IC Partner" or "Employee".|
|accountId|GUID|The id of the account that the journal line is related to. |
|accountNumber|string|The number of the account that the journal line is related to. |
|postingDate|date|The date that the journal line   is posted.|
|documentNumber|string|Specifies a document number for the journal line.|
|externalDocumentNumber|string|Specifies an external document number for the journal line.|
|amount|decimal|Specifies the total amount (including VAT) that the journal line consists of.|
|description|string|Specifies the description of the journal line.|
|comment|string|A user specified comment on the journal line.|
|taxCode|string|The tax code for the line.       |
|balanceAccountType|NAV.genJournalAccountType|Specifies the type of account. It can be "G/L Account", "Customer", "Vendor", "Bank Account", "Fixed Asset", "IC Partner" or "Employee".|
|balancingAccountId|GUID|The balancing G/L Account ID.|
|balancingAccountNumber|string|The balancing G/L Account number.|
|lastModifiedDateTime|datetime|The last datetime the journal line was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the journalLine resource.


```json
{
    "id": "GUID",
    "journalId": "GUID",
    "journalDisplayName": "string",
    "lineNumber": "integer",
    "accountType": "NAV.genJournalAccountType",
    "accountId": "GUID",
    "accountNumber": "string",
    "postingDate": "date",
    "documentNumber": "string",
    "externalDocumentNumber": "string",
    "amount": "decimal",
    "description": "string",
    "comment": "string",
    "taxCode": "string",
    "balanceAccountType": "NAV.genJournalAccountType",
    "balancingAccountId": "GUID",
    "balancingAccountNumber": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET journalLine](../api/dynamics_journalLine_Get.md)
[DELETE journalLine](../api/dynamics_journalLine_Delete.md)
[POST journalLine](../api/dynamics_journalLine_Create.md)
[PATCH journalLine](../api/dynamics_journalLine_Update.md)
