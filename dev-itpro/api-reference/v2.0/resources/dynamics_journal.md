---
title: journal resource type  
description: A journal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# journal resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a journal in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET journal](../api/dynamics_journal_get.md)|journal|Gets a journal object.|
|[DELETE journal](../api/dynamics_journal_delete.md)|none|Deletes a journal object.|
|[POST journal](../api/dynamics_journal_create.md)|journal|Creates a journal object.|
|[PATCH journal](../api/dynamics_journal_update.md)|journal|Updates a journal object.|

## Bound Actions

The journal resource type offers a bound action called `post` which posts the corresponding journal batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/journals({id})/Microsoft.NAV.post`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[account](dynamics_account.md)|account |Gets the account of the journal.|
|[journalLines](dynamics_journalline.md)|journalLines |Gets the journallines of the journal.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the journal. Non-editable.|
|code|string|The code of the journal.|
|displayName|string|Specifies the journal's name. This name will appear on all sales documents for the journal.|
|lastModifiedDateTime|datetime|The last datetime the journal was modified. Read-Only.|
|balancingAccountId|GUID|The balancing G/L Account ID.|
|balancingAccountNumber|string|The balancing G/L Account number.|

## JSON representation

Here is a JSON representation of the journal resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "lastModifiedDateTime": "datetime",
    "balancingAccountId": "GUID",
    "balancingAccountNumber": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET journal](../api/dynamics_journal_Get.md)
[DELETE journal](../api/dynamics_journal_Delete.md)
[POST journal](../api/dynamics_journal_Create.md)
[PATCH journal](../api/dynamics_journal_Update.md)
