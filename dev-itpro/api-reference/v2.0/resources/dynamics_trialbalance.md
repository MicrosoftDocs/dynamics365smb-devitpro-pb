---
title: trialBalance resource type  
description: A trial balance object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# trialBalance resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a trial balance in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET trialBalance](../api/dynamics_trialbalance_get.md)|trialBalance|Gets a trial balance object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[account](dynamics_account.md)|account |Gets the account of the trialBalance.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|accountId|GUID|The id of the account that the trial balance is related to. |
|number|string|Specifies the number of the trial balance.|
|accountType|string|The type of the account that the trial balance is related to. |
|display|string|The trial balance item display name.|
|totalDebit|string|Represents total debit amount in G/L Account.|
|totalCredit|string|Represents total credit amount in G/L Account.|
|balanceAtDateDebit|string|Represents positive Balance at Date amount in G/L Account.|
|balanceAtDateCredit|string|Represents negative Balance at Date amount in G/L Account.|
|dateFilter|date|The date filter used to calculate the trial balance items.|

## JSON representation

Here is a JSON representation of the trialBalance resource.


```json
{
    "accountId": "GUID",
    "number": "string",
    "accountType": "string",
    "display": "string",
    "totalDebit": "string",
    "totalCredit": "string",
    "balanceAtDateDebit": "string",
    "balanceAtDateCredit": "string",
    "dateFilter": "date"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET trialBalance](../api/dynamics_trialBalance_Get.md)
