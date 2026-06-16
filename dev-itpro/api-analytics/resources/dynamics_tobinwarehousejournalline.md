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
    "toBinCode": "B-01-0001",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "qtyBase": 10.00,
    "lotNo": "10000",
    "serialNo": "10000",
    "toZoneCode": "PICK",
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET toBinWarehouseJournalLine](../api/dynamics_tobinwarehousejournalline_get.md)
