
---
title: extensionUpload resource type | Microsoft Docs
description: An extension upload object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# extensionUpload resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an extension upload in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET extensionUpload](../api/dynamics_extensionupload_get.md)|extensionUpload|Gets a extension upload object.|
|[POST extensionUpload](../api/dynamics_extensionupload_create.md)|extensionUpload|Creates a extension upload object.|
|[PATCH extensionUpload](../api/dynamics_extensionupload_update.md)|extensionUpload|Updates a extension upload object.|

## Bound Actions

The extensionUpload resource type offers a bound action called `upload` which uploads the corresponding extensionUpload batch.
This is illustrated in the following example:
`UPLOAD https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/extensionUploads({id})/Microsoft.NAV.upload`

The response has no content; the response code is 204.


## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|systemId|GUID|The unique ID of the system.|
|schedule|string|Specifies the schedule for installation.|
|extensionContent|stream|The content of the extension.|

## JSON representation

Here is a JSON representation of the extensionUpload resource.


```json
{
    "systemId": "GUID",
    "schedule": "string",
    "extensionContent": "stream"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET extensionUpload](../api/dynamics_extensionupload_get.md)  
[POST extensionUpload](../api/dynamics_extensionupload_create.md)  
[PATCH extensionUpload](../api/dynamics_extensionupload_update.md)  
