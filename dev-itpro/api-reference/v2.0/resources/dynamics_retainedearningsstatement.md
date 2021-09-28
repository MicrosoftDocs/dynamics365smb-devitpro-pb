---
title: retainedEarningsStatement resource type  
description: A retained earnings statement object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# retainedEarningsStatement resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a retained earnings statement in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET retainedEarningsStatement](../api/dynamics_retainedearningsstatement_get.md)|retainedEarningsStatement|Gets a retained earnings statement object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the retained earnings statement. Non-editable.|
|lineNumber|integer|The retained earnings statement item line number.|
|display|string|The retained earnings statement item display name.|
|netChange|decimal|The retained earnings statement net change. |
|lineType|string|The type of the retained earnings statement.|
|indentation|integer|The retained earnings statement item indentation used in report layout.|
|dateFilter|date|The date filter used to calculate the retained earnings statement items.|

## JSON representation

Here is a JSON representation of the retainedEarningsStatement resource.


```json
{
    "id": "GUID",
    "lineNumber": "integer",
    "display": "string",
    "netChange": "decimal",
    "lineType": "string",
    "indentation": "integer",
    "dateFilter": "date"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET retainedEarningsStatement](../api/dynamics_retainedEarningsStatement_Get.md)
