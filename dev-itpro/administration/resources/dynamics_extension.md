
---
title: extension resource type | Microsoft Docs
description: An extension object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# extension resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an extension in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET extension](../api/dynamics_extension_get.md)|extension|Gets a extension object.|

## Bound Actions

The extension resource type offers a bound action called `install` which installs the corresponding extension batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/extensions({id})/Microsoft.NAV.install`

The response has no content; the response code is 204.

The extension resource type offers a bound action called `uninstall` which uninstalls the corresponding extension batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/extensions({id})/Microsoft.NAV.uninstall`
The response has no content; the response code is 204.

The extension resource type offers a bound action called `uninstallAndDeleteExtensionData` which uninstall and delete extension datas the corresponding extension batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/extensions({id})/Microsoft.NAV.uninstallAndDeleteExtensionData`


The response has no content; the response code is 204.


## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|packageId|GUID|The unique ID of the package. Read-Only.|
|id|GUID|The unique ID of the item. Non-editable.|
|displayName|string|Specifies the extension's name. This name will appear on all sales documents for the extension.|
|publisher|string|Specifies the publisher of the extension.|
|versionMajor|integer|Major version of the extension.|
|versionMinor|integer|Minor version of the extension.|
|versionBuild|integer|The version of the build.|
|versionRevision|integer|The version revision of the extension.|
|isInstalled|boolean|Specifies the installation status.|
|publishedAs|string|Specifies how the compiled extension was published.|

## JSON representation

Here is a JSON representation of the extension resource.


```json
{
    "packageId": "GUID",
    "id": "GUID",
    "displayName": "string",
    "publisher": "string",
    "versionMajor": "integer",
    "versionMinor": "integer",
    "versionBuild": "integer",
    "versionRevision": "integer",
    "isInstalled": "boolean",
    "publishedAs": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET extension](../api/dynamics_extension_get.md)  
