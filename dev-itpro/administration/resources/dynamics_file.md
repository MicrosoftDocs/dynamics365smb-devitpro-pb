
---
title: file resource type | Microsoft Docs
description: A file object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# file resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a file in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET file](../api/dynamics_file_get.md)|file|Gets a file object.|
|[DELETE file](../api/dynamics_file_delete.md)|none|Deletes a file object.|
|[POST file](../api/dynamics_file_create.md)|file|Creates a file object.|
|[PATCH file](../api/dynamics_file_update.md)|file|Updates a file object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|code|string|The code of the file.|
|content|stream|The file's content.|

## JSON representation

Here is a JSON representation of the file resource.


```json
{
    "code": "string",
    "content": "stream"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET file](../api/dynamics_file_get.md)
[DELETE file](../api/dynamics_file_delete.md)
[POST file](../api/dynamics_file_create.md)
[PATCH file](../api/dynamics_file_update.md)
