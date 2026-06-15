---
title: toBinWarehouseJournalLine resource type
description: Represents a toBinWarehouseJournalLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# toBinWarehouseJournalLine resource type

Represents a to bin warehouse journal line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET toBinWarehouseJournalLine](../api/dynamics_tobinwarehousejournalline_get.md)|toBinWarehouseJournalLine|Gets a toBinWarehouseJournalLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|toBinCode|string|The primary key of the toBinWarehouseJournalLine.|
|itemNo|string|The primary key of the toBinWarehouseJournalLine.|
|locationCode|string|The primary key of the toBinWarehouseJournalLine.|
|qtyBase|decimal|Specifies the qtyBase of the toBinWarehouseJournalLine.|
|lotNo|string|The primary key of the toBinWarehouseJournalLine.|
|serialNo|string|The primary key of the toBinWarehouseJournalLine.|
|toZoneCode|string|The primary key of the toBinWarehouseJournalLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the toBinWarehouseJournalLine.|
|unitOfMeasureCode|string|The primary key of the toBinWarehouseJournalLine.|

## JSON representation

Here's a JSON representation of the toBinWarehouseJournalLine resource.

```json
{
    "toBinCode": "string",
    "itemNo": "string",
    "locationCode": "string",
    "qtyBase": "decimal",
    "lotNo": "string",
    "serialNo": "string",
    "toZoneCode": "string",
    "qtyPerUnitOfMeasure": "decimal",
    "unitOfMeasureCode": "string"
}
```

## Related information

[GET toBinWarehouseJournalLine](../api/dynamics_tobinwarehousejournalline_get.md)
