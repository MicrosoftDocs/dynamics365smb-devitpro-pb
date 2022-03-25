---
title: setupCloudMigration resource type
description: A setup cloud migration object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/25/2022
ms.author: solsen
---

# setupCloudMigration resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a setup cloud migration in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET setupCloudMigration](../api/dynamics_setupcloudmigration_get.md)|setupCloudMigration|Gets a setup cloud migration object.|
|[POST setupCloudMigration](../api/dynamics_setupcloudmigration_create.md)|setupCloudMigration|Creates a setup cloud migration object.|
|[PATCH setupCloudMigration](../api/dynamics_setupcloudmigration_update.md)|setupCloudMigration|Updates a setup cloud migration object.|

## Bound Actions

The setupCloudMigration resource type offers a bound action called `completeSetup` which complete setups the corresponding setupCloudMigration batch.
This is illustrated in the following example:
`COMPLETESETUP https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/setupCloudMigrations({id})/Microsoft.NAV.completeSetup`

The response has no content; the response code is 204.

The setupCloudMigration resource type offers a bound action called `installedIntegrationRuntime` which installed integration runtimes the corresponding setupCloudMigration batch.
This is illustrated in the following example:
`INSTALLEDINTEGRATIONRUNTIME https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/setupCloudMigrations({id})/Microsoft.NAV.installedIntegrationRuntime`

The response has no content; the response code is 204.


## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the setup cloud migration. Non-editable.|
|productId|string||
|sqlServerType|string||
|sqlConnectionString|string||
|runtimeName|string||
|runtimeKey|string||

## JSON representation

Here is a JSON representation of the setupCloudMigration resource.


```json
{
    "id": "GUID",
    "productId": "string",
    "sqlServerType": "string",
    "sqlConnectionString": "string",
    "runtimeName": "string",
    "runtimeKey": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET setupCloudMigration](../api/dynamics_setupcloudmigration_get.md)  
[POST setupCloudMigration](../api/dynamics_setupcloudmigration_create.md)  
[PATCH setupCloudMigration](../api/dynamics_setupcloudmigration_update.md)  
