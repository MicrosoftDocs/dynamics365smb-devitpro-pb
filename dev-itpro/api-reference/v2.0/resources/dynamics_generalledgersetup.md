---
title: generalLedgerSetup resource type
description: A general ledger setup object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerSetup resource type

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
|shortcutDimension1Code|string||
|shortcutDimension2Code|string||
|shortcutDimension3Code|string||
|shortcutDimension4Code|string||
|shortcutDimension5Code|string||
|shortcutDimension6Code|string||
|shortcutDimension7Code|string||
|shortcutDimension8Code|string||


## JSON representation

Here's a JSON representation of the generalLedgerSetup resource.


```json
{
    "id": "GUID",
    "allowPostingFrom": "date",
    "allowPostingTo": "date",
    "additionalReportingCurrency": "string",
    "localCurrencyCode": "string",
    "localCurrencySymbol": "string",
    "lastModifiedDateTime": "datetime",
    "allowQueryFromConsolidation": "boolean",
    "shortcutDimension1Code": "string",
    "shortcutDimension2Code": "string",
    "shortcutDimension3Code": "string",
    "shortcutDimension4Code": "string",
    "shortcutDimension5Code": "string",
    "shortcutDimension6Code": "string",
    "shortcutDimension7Code": "string",
    "shortcutDimension8Code": "string"
}
```

## Related information

[GET generalLedgerSetup](../api/dynamics_generalledgersetup_get.md)
