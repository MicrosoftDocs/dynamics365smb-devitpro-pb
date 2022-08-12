---
title: accountingPeriod resource type
description: An accounting period object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/11/2022
ms.author: solsen
---

# accountingPeriod resource type (Beta)

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an accounting period in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET accountingPeriod](../api/dynamics_accountingperiod_get.md)|accountingPeriod|Gets a accounting period object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the accounting period. Non-editable.|
|displayName|string|Specifies the accounting period's name. This name will appear on all sales documents for the accounting period.|
|startingDate|date||
|endingDate|date||
|newFiscalYear|boolean||
|fiscalYearStartDate|date||
|fiscalYearEndDate|date||
|closed|boolean||
|lastModifiedDateTime|datetime|The last datetime the accounting period was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the accountingPeriod resource.


```json
{
    "id": "GUID",
    "displayName": "string",
    "startingDate": "date",
    "endingDate": "date",
    "newFiscalYear": "boolean",
    "fiscalYearStartDate": "date",
    "fiscalYearEndDate": "date",
    "closed": "boolean",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET accountingPeriod](../api/dynamics_accountingperiod_get.md)
