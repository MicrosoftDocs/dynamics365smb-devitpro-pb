---
title: fromBinWarehouseJournalLine resource type
description: Represents a fromBinWarehouseJournalLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# fromBinWarehouseJournalLine resource type

Represents a from bin warehouse journal line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET fromBinWarehouseJournalLine](../api/dynamics_frombinwarehousejournalline_get.md)|fromBinWarehouseJournalLine|Gets a fromBinWarehouseJournalLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|fromBinCode|string|The primary key of the fromBinWarehouseJournalLine.|
|itemNo|string|The primary key of the fromBinWarehouseJournalLine.|
|locationCode|string|The primary key of the fromBinWarehouseJournalLine.|
|qtyBase|decimal|Specifies the qtyBase of the fromBinWarehouseJournalLine.|
|lotNo|string|The primary key of the fromBinWarehouseJournalLine.|
|serialNo|string|The primary key of the fromBinWarehouseJournalLine.|
|fromZoneCode|string|The primary key of the fromBinWarehouseJournalLine.|
|qtyPerUnitOfMeasure|decimal|The primary key of the fromBinWarehouseJournalLine.|
|unitOfMeasureCode|string|The primary key of the fromBinWarehouseJournalLine.|

## JSON representation

Here's a JSON representation of the fromBinWarehouseJournalLine resource.

```json
{
    "fromBinCode": "B-01-0001",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "qtyBase": 10.00,
    "lotNo": "10000",
    "serialNo": "10000",
    "fromZoneCode": "PICK",
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[GET fromBinWarehouseJournalLine](../api/dynamics_frombinwarehousejournalline_get.md)
