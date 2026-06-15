---
title: generalLedgerSetup resource type
description: Represents a generalLedgerSetup entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerSetup resource type

Represents a general ledger setup in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerSetup](../api/dynamics_generalledgersetup_get.md)|generalLedgerSetup|Gets a generalLedgerSetup object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|primaryKey|string|The primary key of the generalLedgerSetup.|
|shortcutDimension1Code|string|Specifies the shortcutDimension1Code of the generalLedgerSetup.|
|shortcutDimension2Code|string|Specifies the shortcutDimension2Code of the generalLedgerSetup.|
|shortcutDimension3Code|string|Specifies the shortcutDimension3Code of the generalLedgerSetup.|
|shortcutDimension4Code|string|Specifies the shortcutDimension4Code of the generalLedgerSetup.|
|shortcutDimension5Code|string|Specifies the shortcutDimension5Code of the generalLedgerSetup.|
|shortcutDimension6Code|string|Specifies the shortcutDimension6Code of the generalLedgerSetup.|
|shortcutDimension7Code|string|Specifies the shortcutDimension7Code of the generalLedgerSetup.|
|shortcutDimension8Code|string|Specifies the shortcutDimension8Code of the generalLedgerSetup.|
|localCurrencyCode|string|Specifies the localCurrencyCode of the generalLedgerSetup.|

## JSON representation

Here's a JSON representation of the generalLedgerSetup resource.

```json
{
    "primaryKey": "string",
    "shortcutDimension1Code": "string",
    "shortcutDimension2Code": "string",
    "shortcutDimension3Code": "string",
    "shortcutDimension4Code": "string",
    "shortcutDimension5Code": "string",
    "shortcutDimension6Code": "string",
    "shortcutDimension7Code": "string",
    "shortcutDimension8Code": "string",
    "localCurrencyCode": "string"
}
```

## Related information

[GET generalLedgerSetup](../api/dynamics_generalledgersetup_get.md)
