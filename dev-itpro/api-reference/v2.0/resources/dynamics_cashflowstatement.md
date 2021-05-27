---
title: cashFlowStatement resource type  
description: A cash flow statement object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# cashFlowStatement resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a cash flow statement in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET cashFlowStatement](../api/dynamics_cashflowstatement_get.md)|cashFlowStatement|Gets a cash flow statement object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the cash flow statement. Non-editable.|
|lineNumber|integer|The cash flow statement item line number.|
|display|string|The cash flow statement item display name.|
|netChange|decimal|The cash flow statement net change. |
|lineType|string|The type of the cash flow statement.|
|indentation|integer|The cash flow statement item indentation used in report layout.|
|dateFilter|date|The date filter used to calculate the cash flow statement items.|

## JSON representation

Here is a JSON representation of the cashFlowStatement resource.


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
[GET cashFlowStatement](../api/dynamics_cashFlowStatement_Get.md)
