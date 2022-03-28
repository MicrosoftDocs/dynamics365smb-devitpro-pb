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
Represents a cloud migration status detail in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET cloudMigrationStatusDetail](../api/dynamics_cloudmigrationstatusdetail_get.md)|cloudMigrationStatusDetail|Gets a cloud migration status detail object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[cloudMigrationStatus](dynamics_cloudmigrationstatu.md)|cloudMigrationStatus |Gets the cloudmigrationstatus of the cloudMigrationStatusDetail.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the cloud migration status detail. Non-editable.|
|runId|string||
|companyName|string|The name of the company.|
|tableName|string||
|status|string|Specifies the status of the cloud migration status detail.|
|recordsCopied|integer||
|totalRecords|integer||
|errors|string||
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
