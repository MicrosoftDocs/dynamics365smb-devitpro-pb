---
title: company resource type
description: A company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/25/2022
ms.author: solsen
---

# company resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a company in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET company](../api/dynamics_company_get.md)|company|Gets a company object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[cloudMigrationCompanies](dynamics_cloudmigrationcompany.md)|cloudMigrationCompanies |Gets the cloudmigrationcompanies of the company.|
|[cloudMigrationStatus](dynamics_cloudmigrationstatus.md)|cloudMigrationStatus |Gets the cloudmigrationstatus of the company.|
|[cloudMigrationStatusDetails](dynamics_cloudmigrationstatusdetail.md)|cloudMigrationStatusDetails |Gets the cloudmigrationstatusdetails of the company.|
|[tableMappings](dynamics_tablemapping.md)|tableMappings |Gets the tablemappings of the company.|
|[setupCloudMigration](dynamics_setupcloudmigration.md)|setupCloudMigration |Gets the setupcloudmigration of the company.|
|[sourceProductTypes](dynamics_sourceproducttype.md)|sourceProductTypes |Gets the sourceproducttypes of the company.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the company. Non-editable.|
|systemVersion|string|Specifies the internal version of the company.|
|name|string|Represents the company's name.|
|displayName|string|Specifies the company's name. This name will appear on all sales documents for the company.|
|businessProfileId|string|Specifies the Business Profile ID linked to the company.|
|systemCreatedAt|datetime|The datetime the company was created.|
|systemCreatedBy|GUID|The ID of the user who created the company.|
|systemModifiedAt|datetime|The last datetime the company was modified.|
|systemModifiedBy|GUID|The ID of the user who last modified the company.|
|estimatedSize|decimal|Read-Only property representing the approximate size of the On-Prem company. The data migrated will be smaller, since the data will be compressed and not all tables will be included.|
|created|boolean|Specifies if the company was created. It will not reflect if the setup of the company was correct or not. For this you should check the status property. If the company has been created, however status is different.|


## JSON representation

Here is a JSON representation of the company resource.


```json
{
    "id": "GUID",
    "systemVersion": "string",
    "name": "string",
    "displayName": "string",
    "businessProfileId": "string",
    "systemCreatedAt": "datetime",
    "systemCreatedBy": "GUID",
    "systemModifiedAt": "datetime",
    "systemModifiedBy": "GUID"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET company](../api/dynamics_company_get.md)
