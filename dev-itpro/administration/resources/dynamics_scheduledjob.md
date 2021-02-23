
---
title: scheduledJob resource type | Microsoft Docs
description: A scheduled job object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# scheduledJob resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a scheduled job by API's in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET scheduledJob](../api/dynamics_scheduledjob_get.md)|scheduledJob|Gets a scheduled job object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item. Non-editable.|
|category|string|Specifies the category of the scheduled job.|
|status|string|Specifies the status of the scheduled job.|
|description|string|Specifies the description of the scheduled job.|
|errorMessage|string|The error message provided when a fail occurs.|

## JSON representation

Here is a JSON representation of the scheduledJob resource.


```json
{
    "id": "GUID",
    "category": "string",
    "status": "string",
    "description": "string",
    "errorMessage": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET scheduledJob](../api/dynamics_scheduledjob_get.md)  
