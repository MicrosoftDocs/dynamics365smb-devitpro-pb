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
|productId|string| Specifies the source product for the cloud migration. Available options can be received from sourceProductTypes API. Usually, values provided out of the box are: <br>- DynamicsBCLast – use for cloud migration with upgrade <br>- DynamicsBC – use for cloud migration from the same version of Dynamics Business Central <br>- DynamicsGP – use if you are setting up Dynamics GP cloud migration.|
|sqlServerType|string|Specifies the SQL Server type. Values can be:<br>- SQLServer – Use if you are migrating from the database that is hosted on the On-Prem SQL server <br>- AzureSQL – If you have uploaded the database to migrate to Azure SQL server.|
|sqlConnectionString|string|Specifies SQL connection string to the OnPrem database that should be cloud migrated|
|runtimeName|string|Represents a unique id of the Azure Data Factory pipeline that will be used to move the data. It is returned by the first POST/PATCH request, this value is not needed for AzureSQL database type.|
|runtimeKey|string|Represents the key that is used to connect the Microsoft Integration Runtime to the Azure Data Factory. It is returned by the first POST/PATCH request, this value is not needed for AzureSQL database type.|
|estimatedSize|decimal|Read-Only property representing the approximate size of the On-Prem company. The data migrated will be smaller, since the data will be compressed and not all tables will be included.|
|created|boolean|Specifies if the company was created. It will not reflect if the setup of the company was correct or not. For this you should check the status property. If the company has been created, however status is different.|

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
