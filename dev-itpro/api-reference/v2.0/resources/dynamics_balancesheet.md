---
title: balanceSheet resource type  
description: A balance sheet object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

# balanceSheet resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
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

Here is a JSON representation of the balanceSheet resource.


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
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET balanceSheet](../api/dynamics_balanceSheet_Get.md)
