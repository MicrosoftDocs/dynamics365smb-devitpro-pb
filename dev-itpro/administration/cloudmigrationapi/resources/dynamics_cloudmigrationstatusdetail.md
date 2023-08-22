---
title: cloudMigrationStatusDetail resource type
description: A cloud migration status detail object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/25/2022
ms.author: solsen
---

# cloudMigrationStatusDetail resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a cloud migration status detail in [!INCLUDE[prod_short](../../../includes/prod_short.md)] that is giving more information about the status of the table that is under cloud migration.

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET cloudMigrationStatusDetail](../api/dynamics_cloudmigrationstatusdetail_get.md)|cloudMigrationStatusDetail|Gets a cloud migration status detail object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[cloudMigrationStatus](dynamics_cloudmigrationstatus.md)|cloudMigrationStatus |Gets the cloudmigrationstatus of the cloudMigrationStatusDetail.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|Specifies the unique ID of the cloud migration status detail. Non-editable.|
|runId|string|Specifies the unique ID of the runID. You can use this value to filter the details.|
|companyName|string|Specifies the company name that owns the table that is cloud migrated.|
|tableName|string|Specifies the name of the table that is cloud migrated.|
|status|string|Specifies the status of the table. Possible values are: 'Failed, In Progress, Successful, Warning, Not Started'.|
|recordsCopied|integer|Specifies the number of records that were copied for this table.|
|totalRecords|integer|Specifies the total number of records in the source table.|
|errors|string|Specifies any errors that occurred during the replication.|
|estimatedSize|decimal|Read-Only property representing the approximate size of the On-Prem company. The data migrated will be smaller, since the data will be compressed and not all tables will be included.|
|created|boolean|Specifies if the company was created. It will not reflect if the setup of the company was correct or not. For this you should check the status property. If the company has been created, however status is different.|


## JSON representation

Here is a JSON representation of the cloudMigrationStatusDetail resource.


```json
{
    "id": "GUID",
    "runId": "string",
    "companyName": "string",
    "tableName": "string",
    "status": "string",
    "recordsCopied": "integer",
    "totalRecords": "integer",
    "errors": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also

[GET cloudMigrationStatusDetail](../api/dynamics_cloudmigrationstatusdetail_get.md)
