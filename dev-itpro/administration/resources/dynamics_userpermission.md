
---
title: userPermission resource type | Microsoft Docs
description: An user permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# userPermission resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an user permission in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET userPermission](../api/dynamics_userpermission_get.md)|userPermission|Gets a user permission object.|
|[DELETE userPermission](../api/dynamics_userpermission_delete.md)|none|Deletes a user permission object.|
|[POST userPermission](../api/dynamics_userpermission_create.md)|userPermission|Creates a user permission object.|
|[PATCH userPermission](../api/dynamics_userpermission_update.md)|userPermission|Updates a user permission object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[user](dynamics_user.md)|user |Gets the user of the userPermission.|
|[permissionSet](dynamics_permissionset.md)|permissionSet |Gets the permissionset of the userPermission.|
|[automationCompany](dynamics_automationcompany.md)|automationCompany |Gets the automationcompany of the userPermission.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the user permission. Read-Only.|
|userSecurityId|GUID|The unique ID of the user security.|
|roleId|string|The unique ID of the user permission role.|
|displayName|string|Specifies the user permission's name. This name will appear on all sales documents for the user permission.|
|company|string|The company name.|
|appId|GUID|The ID of the App.|
|extensionName|string|The name of the extension.|
|scope|string|Scode of the user permission.|

## JSON representation

Here is a JSON representation of the userPermission resource.


```json
{
    "id": "GUID",
    "userSecurityId": "GUID",
    "roleId": "string",
    "displayName": "string",
    "company": "string",
    "appId": "GUID",
    "extensionName": "string",
    "scope": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET userPermission](../api/dynamics_userpermission_get.md)  
[DELETE userPermission](../api/dynamics_userpermission_delete.md)  
[POST userPermission](../api/dynamics_userpermission_create.md)  
[PATCH userPermission](../api/dynamics_userpermission_update.md)  
