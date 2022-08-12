---
title: generalLedgerAccount resource type
description: A general ledger account object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# generalLedgerAccount resource type (Beta)

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general ledger account in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerAccount](../api/dynamics_generalledgeraccount_get.md)|generalLedgerAccount|Gets a general ledger account object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[generalLedgerBudgets](dynamics_generalledgerbudget.md)|generalLedgerBudgets |Gets the generalledgerbudgets of the generalLedgerAccount.|
|[businessUnit](dynamics_businessunit.md)|businessUnit |Gets the businessunit of the generalLedgerAccount.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general ledger account. Non-editable.|
|accountNumber|string|The number of the account that the general ledger account is related to. |
|accountName|string||
|accountType|string|The type of the account that the general ledger account is related to. |
|accountCategory|string||
|accountSubcategoryEntryNumber|integer||
|accountSubcategoryDescription|string||
|indentation|integer|The general ledger account item indentation used in report layout.|
|netChange|decimal|The general ledger account net change. |
|incomeBalance|string||
|budgetFilter|string||
|businessUnitFilter|string||
|parentAccountNumber|string||
|lastModifiedDateTime|datetime|The last datetime the general ledger account was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the generalLedgerAccount resource.


```json
{
    "id": "GUID",
    "accountNumber": "string",
    "accountName": "string",
    "accountType": "string",
    "accountCategory": "string",
    "accountSubcategoryEntryNumber": "integer",
    "accountSubcategoryDescription": "string",
    "indentation": "integer",
    "netChange": "decimal",
    "incomeBalance": "string",
    "budgetFilter": "string",
    "businessUnitFilter": "string",
    "parentAccountNumber": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET generalLedgerAccount](../api/dynamics_generalledgeraccount_get.md)
