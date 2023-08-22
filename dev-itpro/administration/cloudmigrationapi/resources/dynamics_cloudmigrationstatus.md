---
title: cloudMigrationStatus resource type
description: A cloud migration status object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/25/2022
ms.author: solsen
---

# cloudMigrationStatus resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a status record of the cloud migration in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. It is used to start replication, start the data upgrade, disable the cloud migration, and to track the overall status.

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET cloudMigrationStatus](../api/dynamics_cloudmigrationstatus_get.md)|cloudMigrationStatus|Gets a cloud migration status object.|

## Bound Actions

The cloudMigrationStatus resource type offers a bound action called `disableReplication` which disable replications the corresponding cloudMigrationStatus batch.
This is illustrated in the following example:
`DISABLEREPLICATION https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/cloudMigrationStatus({id})/Microsoft.NAV.disableReplication`

The response has no content; the response code is 204.

The cloudMigrationStatus resource type offers a bound action called `refreshStatus` which refresh statuss the corresponding cloudMigrationStatus batch.
This is illustrated in the following example:
`REFRESHSTATUS https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/cloudMigrationStatus({id})/Microsoft.NAV.refreshStatus`

The response has no content; the response code is 204.

The cloudMigrationStatus resource type offers a bound action called `resetCloudData` which reset cloud datas the corresponding cloudMigrationStatus batch.
This is illustrated in the following example:
`RESETCLOUDDATA https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/cloudMigrationStatus({id})/Microsoft.NAV.resetCloudData`

The response has no content; the response code is 204.

The cloudMigrationStatus resource type offers a bound action called `runDataUpgrade` which run data upgrades the corresponding cloudMigrationStatus batch.
This is illustrated in the following example:
`RUNDATAUPGRADE https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/cloudMigrationStatus({id})/Microsoft.NAV.runDataUpgrade`

The response has no content; the response code is 204.

The cloudMigrationStatus resource type offers a bound action called `runReplication` which run replications the corresponding cloudMigrationStatus batch.
This is illustrated in the following example:
`RUNREPLICATION https://<server address>:<server API port>/<server instance name>/api/v1.0/companies({id})/cloudMigrationStatus({id})/Microsoft.NAV.runReplication`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[cloudMigrationStatusDetails](dynamics_cloudmigrationstatusdetail.md)|cloudMigrationStatusDetails |Gets the cloudmigrationstatusdetails of the cloudMigrationStatus.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the cloud migration status. Non-editable.|
|runId|string|Specifies the unique ID of the runID.|
|startTime|datetime|Specifies the date and time when the operation was started.|
|endTime|datetime|Specifies the date and time when the operation has ended.|
|replicationType|string|Specifies the type of the replication. Full is for full sync, Normal is usually representing the delta sync.|
|status|string|Specifies the status of the cloud migration status. Possible values are: 'Failed, In Progress, Completed,Upgrade Pending, Upgrade in Progress, Upgrade Failed, Data Repair Pending'.|
|source|string|Specifies the name of the source product.|
|details|string|Specifies the additional details about this record.|
|tablesSuccessful|integer|Specifies the number of tables that was successfully replicated.|
|tablesFailed|integer|Specifies the number of tables that has failed.|
|tablesRemaining|integer|Specifies the number of tables that is remaining.|
|estimatedSize|decimal|Read-Only property representing the approximate size of the On-Prem company. The data migrated will be smaller, since the data will be compressed and not all tables will be included.|
|created|boolean|Specifies if the company was created. It will not reflect if the setup of the company was correct or not. For this you should check the status property. If the company has been created, however status is different.|


## JSON representation

Here is a JSON representation of the cloudMigrationStatus resource.


```json
{
    "id": "GUID",
    "runId": "string",
    "startTime": "datetime",
    "endTime": "datetime",
    "replicationType": "string",
    "status": "string",
    "source": "string",
    "details": "string",
    "tablesSuccessful": "integer",
    "tablesFailed": "integer",
    "tablesRemaining": "integer"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also

[GET cloudMigrationStatus](../api/dynamics_cloudmigrationstatus_get.md)
