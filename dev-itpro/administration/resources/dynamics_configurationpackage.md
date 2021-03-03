---
title: configurationPackage resource type | Microsoft Docs
description: A configuration package object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# configurationPackage resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a configuration package in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET configurationPackage](../api/dynamics_configurationpackage_get.md)|configurationPackage|Gets a configuration package object.|
|[DELETE configurationPackage](../api/dynamics_configurationpackage_delete.md)|none|Deletes a configuration package object.|
|[POST configurationPackage](../api/dynamics_configurationpackage_create.md)|configurationPackage|Creates a configuration package object.|
|[PATCH configurationPackage](../api/dynamics_configurationpackage_update.md)|configurationPackage|Updates a configuration package object.|

## Bound Actions

The configurationPackage resource type offers a bound action called `import` which imports the corresponding configurationPackage batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/microsoft/automation/v2.0/companies({id})/configurationPackages({id})/Microsoft.NAV.import`

The response has no content; the response code is 204.

The configurationPackage resource type offers a bound action called `apply` which applys the corresponding configurationPackage batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/microsoft/automation/v2.0/companies({id})/configurationPackages({id})/Microsoft.NAV.apply`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[file](dynamics_file.md)|file |Gets the file of the configurationPackage.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item. Non-editable.|
|code|string|The code of the configuration package.|
|packageName|string|Name of the configuration package.|
|languageId|integer|Id of the language.|
|productVersion|string|Version of the product.|
|processingOrder|integer|Specifies the order of processing.|
|excludeConfigurationTables|boolean|Specifies whether to exclude configuration tables.|
|numberOfTables|integer|Number of tables.|
|numberOfRecords|integer|Number of records.|
|numberOfErrors|integer|Number of errors.|
|importStatus|string|The status of the import.|
|importError|string|The error of an import failure.|
|applyStatus|string|Status of configuration package to apply.|
|applyError|string|Error to apply.|

## JSON representation

Here is a JSON representation of the configurationPackage resource.


```json
{
    "id": "GUID",
    "code": "string",
    "packageName": "string",
    "languageId": "integer",
    "productVersion": "string",
    "processingOrder": "integer",
    "excludeConfigurationTables": "boolean",
    "numberOfTables": "integer",
    "numberOfRecords": "integer",
    "numberOfErrors": "integer",
    "importStatus": "string",
    "importError": "string",
    "applyStatus": "string",
    "applyError": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET configurationPackage](../api/dynamics_configurationpackage_get.md)  
[DELETE configurationPackage](../api/dynamics_configurationpackage_delete.md)  
[POST configurationPackage](../api/dynamics_configurationpackage_create.md)  
[PATCH configurationPackage](../api/dynamics_configurationpackage_update.md)  
