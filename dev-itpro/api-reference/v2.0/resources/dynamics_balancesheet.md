---
title: balanceSheet resource type  
description: A balance sheet object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/09/2024
ms.author: solsen
ms.reviewer: solsen
---

# balanceSheet resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a balance sheet in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET balanceSheet](../api/dynamics_balancesheet_get.md)|balanceSheet|Gets a balance sheet object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the balance sheet. Non-editable.|
|lineNumber|integer|The balance sheet item line number.|
|display|string|The balance sheet item display name.|
|balance|decimal|Specifies balance sheet's total balance.|
|lineType|string|The type of the balance sheet.|
|indentation|integer|The balance sheet item indentation used in report layout.|
|dateFilter|date|The date filter used to calculate the balance sheet items.|

## JSON representation

Here's a JSON representation of the balanceSheet resource.

```json
{
    "id": "GUID",
    "lineNumber": "integer",
    "display": "string",
    "balance": "decimal",
    "lineType": "string",
    "indentation": "integer",
    "dateFilter": "date"
}
```

## Related information

[GET balanceSheet](../api/dynamics_balanceSheet_Get.md)
