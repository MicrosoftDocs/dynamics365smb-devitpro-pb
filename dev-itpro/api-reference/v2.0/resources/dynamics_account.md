---
title: account resource type  
description: An account object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# account resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an account in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET account](../api/dynamics_account_get.md)|account|Gets a account object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[trialBalance](dynamics_trialbalance.md)|trialBalance |Gets the trialbalance of the account.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the account. Non-editable.|
|number|string|Specifies the number of the account.|
|displayName|string|Specifies the account's name. This name will appear on all sales documents for the account.|
|category|NAV.glAccountCategory|Specifies the category of the account. It can be " ", "Assets", "Liabilities", "Equity", "Income", "Cost of Goods Sold" or "Expense".|
|subCategory|string|Specifies the subcategory of the account category of the G/L account.|
|blocked|boolean|Specifies that entries cannot be posted to the account. **True** indicates account is blocked and posting is not allowed.|
|accountType|NAV.glAccountType|The type of the account that the account is related to. It can be "Posting", "Heading", "Total", "Begin Total" or "End Total".|
|directPosting|boolean|Specifies whether direct posting is enabled.|
|lastModifiedDateTime|datetime|The last datetime the account was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the account resource.


```json
{
    "id": "GUID",
    "number": "string",
    "displayName": "string",
    "category": "NAV.glAccountCategory",
    "subCategory": "string",
    "blocked": "boolean",
    "accountType": "NAV.glAccountType",
    "directPosting": "boolean",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET account](../api/dynamics_account_Get.md)
