---
title: requisitionLine resource type
description: Represents a requisitionLine entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# requisitionLine resource type

Represents a requisition line in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET requisitionLine](../api/dynamics_requisitionline_get.md)|requisitionLine|Gets a requisitionLine object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|worksheetTemplateName|string|The primary key of the requisitionLine.|
|journalBatchName|string|The primary key of the requisitionLine.|
|planningLineOrigin|string|Specifies the planningLineOrigin of the requisitionLine.|
|replenishmentSystem|string|Specifies the replenishmentSystem of the requisitionLine.|
|itemNo|string|Specifies the itemNo of the requisitionLine.|
|transferFromCode|string|Specifies the transferFromCode of the requisitionLine.|
|locationCode|string|Specifies the locationCode of the requisitionLine.|
|dueDate|Date|Specifies the dueDate of the requisitionLine.|
|startingDate|Date|Specifies the startingDate of the requisitionLine.|
|orderDate|Date|Specifies the orderDate of the requisitionLine.|
|transferShipmentDate|Date|Specifies the transferShipmentDate of the requisitionLine.|
|quantityBase|decimal|Specifies the quantityBase of the requisitionLine.|
|dimensionSetID|integer|Specifies the dimensionSetID of the requisitionLine.|
|qtyPerUnitOfMeasure|decimal|Specifies the qtyPerUnitOfMeasure of the requisitionLine.|
|unitOfMeasureCode|string|Specifies the unitOfMeasureCode of the requisitionLine.|
|auxiliaryIndex1|integer|The primary key of the requisitionLine.|

## JSON representation

Here's a JSON representation of the requisitionLine resource.

```json
{
    "worksheetTemplateName": "Adatum Corporation",
    "journalBatchName": "Adatum Corporation",
    "planningLineOrigin": "",
    "replenishmentSystem": "Purchase",
    "itemNo": "1896-S",
    "transferFromCode": "10000",
    "locationCode": "BLUE",
    "dueDate": "2026-02-28",
    "startingDate": "2026-01-01",
    "orderDate": "2026-01-12",
    "transferShipmentDate": "2026-01-20",
    "quantityBase": 10.00,
    "dimensionSetID": 102,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS",
    "auxiliaryIndex1": 1
}
```

## Related information

[GET requisitionLine](../api/dynamics_requisitionline_get.md)
