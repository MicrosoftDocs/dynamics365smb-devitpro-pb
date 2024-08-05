---
title: generalLedgerSetup resource type
description: A general ledger setup object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/09/2024
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerSetup resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general ledger setup in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerSetup](../api/dynamics_generalledgersetup_get.md)|generalLedgerSetup|Gets a general ledger setup object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general ledger setup. Non-editable.|
|allowPostingFrom|date||
|allowPostingTo|date||
|additionalReportingCurrency|string||
|localCurrencyCode|string||
|localCurrencySymbol|string||
|lastModifiedDateTime|datetime|The last datetime the general ledger setup was modified. Read-Only.|
|allowQueryFromConsolidation|boolean||

## JSON representation

Here is a JSON representation of the generalLedgerSetup resource.


```json
{
    "id": "GUID",
    "allowPostingFrom": "date",
    "allowPostingTo": "date",
    "additionalReportingCurrency": "string",
    "localCurrencyCode": "string",
    "localCurrencySymbol": "string",
    "lastModifiedDateTime": "datetime",
    "allowQueryFromConsolidation": "boolean"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET generalLedgerSetup](../api/dynamics_generalledgersetup_get.md)
