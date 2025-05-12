---
title: accountingPeriod resource type
description: An accounting period object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/09/2024
ms.author: solsen
ms.reviewer: solsen
---

# accountingPeriod resource type

Represents an accounting period in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET accountingPeriod](../api/dynamics_accountingperiod_get.md)|accountingPeriod|Gets a accounting period object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the accounting period. Non-editable.|
|startingDate|date||
|name|string|Represents the accounting period's name.|
|newFiscalYear|boolean||
|closed|boolean||
|dateLocked|boolean||
|lastModifiedDateTime|datetime|The last datetime the accounting period was modified. Read-Only.|

## JSON representation

Here's a JSON representation of the accountingPeriod resource.

```json
{
    "id": "GUID",
    "startingDate": "date",
    "name": "string",
    "newFiscalYear": "boolean",
    "closed": "boolean",
    "dateLocked": "boolean",
    "lastModifiedDateTime": "datetime"
}
```

## Related information

[GET accountingPeriod](../api/dynamics_accountingperiod_get.md)
