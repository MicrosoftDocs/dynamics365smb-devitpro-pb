---
title: generalProductPostingGroup resource type
description: A general product posting group object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/09/2024
ms.author: solsen
ms.reviewer: solsen
---

# generalProductPostingGroup resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a general product posting group in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET generalProductPostingGroup](../api/dynamics_generalproductpostinggroup_get.md)|generalProductPostingGroup|Gets a general product posting group object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the general product posting group. Non-editable.|
|code|string|The code of the general product posting group.|
|description|string|Specifies the description of the general product posting group.|
|defaultVATProductPostingGroup|string||
|autoInsertDefault|boolean||
|lastModifiedDateTime|datetime|The last datetime the general product posting group was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the generalProductPostingGroup resource.


```json
{
    "id": "GUID",
    "code": "string",
    "description": "string",
    "defaultVATProductPostingGroup": "string",
    "autoInsertDefault": "boolean",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## Related information
[GET generalProductPostingGroup](../api/dynamics_generalproductpostinggroup_get.md)
