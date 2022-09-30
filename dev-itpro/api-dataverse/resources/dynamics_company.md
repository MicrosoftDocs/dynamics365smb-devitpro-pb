---
title: company resource type
description: A company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/25/2022
ms.author: solsen
---

# company resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a company in [!INCLUDE [prod_short](../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET company](../api/dynamics_company_get.md)|company|Gets a company object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[dataverseEntityChanges](dynamics_dataverseentitychange.md)|dataverseEntityChanges |Gets the dataverseentitychanges of the company.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the company. Non-editable.|
|systemVersion|string|Specifies the internal version of the company.|
|timestamp|int64||
|name|string|Represents the company's name.|
|displayName|string|Specifies the company's name. This name will appear on all sales documents for the company.|
|businessProfileId|string|Specifies the Business Profile ID linked to the company.|
|systemCreatedAt|datetime|The datetime the company was created.|
|systemCreatedBy|GUID|The ID of the user who created the company.|
|systemModifiedAt|datetime|The last datetime the company was modified.|
|systemModifiedBy|GUID|The ID of the user who last modified the company.|

## JSON representation

Here is a JSON representation of the company resource.


```json
{
    "id": "GUID",
    "systemVersion": "string",
    "timestamp": "int64",
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
[Business Central Dataverse API](../dynamics-dataverse-api.md)  
