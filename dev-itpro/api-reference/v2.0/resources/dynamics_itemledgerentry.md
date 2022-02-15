---
title: itemLedgerEntry resource type
description: An item ledger entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/24/2021
ms.author: solsen
---

# itemLedgerEntry resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an item ledger entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET itemLedgerEntry](../api/dynamics_itemledgerentry_get.md)|itemLedgerEntry|Gets a item ledger entry object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[item](dynamics_item.md)|item |Gets the item of the itemLedgerEntry.|
|[customer](dynamics_customer.md)|customer |Gets the customer of the itemLedgerEntry.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item ledger entry. Non-editable.|
|entryNumber|integer|G/L Entry number.|
|itemNumber|string|The name of the item in the item ledger entry.|
|postingDate|date|The date that the item ledger entry   is posted.|
|entryType|NAV.itemLedgerEntryType||
|sourceNumber|string||
|sourceType|NAV.analysisSourceType||
|documentNumber|string|Specifies a document number for the item ledger entry.|
|documentType|NAV.itemLedgerDocumentType||
|description|string|Specifies the description of the item ledger entry.|
|quantity|decimal|The quantity of the item in the item ledger entry.|
|salesAmountActual|decimal||
|costAmountActual|decimal||
|lastModifiedDateTime|datetime|The last datetime the item ledger entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the itemLedgerEntry resource.


```json
{
    "id": "GUID",
    "entryNumber": "integer",
    "itemNumber": "string",
    "postingDate": "date",
    "entryType": "NAV.itemLedgerEntryType",
    "sourceNumber": "string",
    "sourceType": "NAV.analysisSourceType",
    "documentNumber": "string",
    "documentType": "NAV.itemLedgerDocumentType",
    "description": "string",
    "quantity": "decimal",
    "salesAmountActual": "decimal",
    "costAmountActual": "decimal",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET itemLedgerEntry](../api/dynamics_itemledgerentry_get.md)
