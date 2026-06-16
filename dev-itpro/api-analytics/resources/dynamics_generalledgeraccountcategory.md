---
title: generalLedgerAccountCategory resource type
description: Represents a generalLedgerAccountCategory entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# generalLedgerAccountCategory resource type

Represents a general ledger account category in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalLedgerAccountCategory](../api/dynamics_generalledgeraccountcategory_get.md)|generalLedgerAccountCategory|Gets a generalLedgerAccountCategory object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|integer|The primary key of the generalLedgerAccountCategory.|
|parentEntryNo|integer|Specifies the parentEntryNo of the generalLedgerAccountCategory.|
|description|string|Specifies the description of the generalLedgerAccountCategory.|
|presentationOrder|string|Specifies the presentationOrder of the generalLedgerAccountCategory.|
|siblingSequenceNo|integer|Specifies the siblingSequenceNo of the generalLedgerAccountCategory.|
|indentation|integer|Specifies the indentation of the generalLedgerAccountCategory.|
|accountCategory|string|Specifies the accountCategory of the generalLedgerAccountCategory.|
|incomeBalance|string|Specifies the incomeBalance of the generalLedgerAccountCategory.|
|additionalReportDefinition|string|Specifies the additionalReportDefinition of the generalLedgerAccountCategory.|
|systemGenerated|boolean|Specifies the systemGenerated of the generalLedgerAccountCategory.|
|hasChildren|boolean|Specifies the hasChildren of the generalLedgerAccountCategory.|

## JSON representation

Here's a JSON representation of the generalLedgerAccountCategory resource.

```json
{
    "entryNo": 1001,
    "parentEntryNo": 1002,
    "description": "ATHENS Desk",
    "presentationOrder": "",
    "siblingSequenceNo": 1,
    "indentation": 0,
    "accountCategory": "",
    "incomeBalance": "Income Statement",
    "additionalReportDefinition": "",
    "systemGenerated": false,
    "hasChildren": false
}
```

## Related information

[GET generalLedgerAccountCategory](../api/dynamics_generalledgeraccountcategory_get.md)
