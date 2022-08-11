---
title: businessUnit resource type
description: A business unit object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# businessUnit resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a business unit in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET businessUnit](../api/dynamics_businessunit_get.md)|businessUnit|Gets a business unit object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[generalLedgerAccounts](dynamics_generalledgeraccount.md)|generalLedgerAccounts |Gets the generalledgeraccounts of the businessUnit.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the business unit. Non-editable.|
|code|string|The code of the business unit.|
|startingDate|date||
|endingDate|date||
|lastModifiedDateTime|datetime|The last datetime the business unit was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the businessUnit resource.


```json
{
    "id": "GUID",
    "code": "string",
    "startingDate": "date",
    "endingDate": "date",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET businessUnit](../api/dynamics_businessunit_get.md)
