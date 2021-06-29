---
title: userGroupPermission resource type | Microsoft Docs
description: A user group permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/05/2021
ms.author: solsen
---

# userGroupPermission resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a user group permission in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET userGroupPermission](../api/dynamics_usergrouppermission_get.md)|userGroupPermission|Gets a user group permission object.|
|[DELETE userGroupPermission](../api/dynamics_usergrouppermission_delete.md)|none|Deletes a user group permission object.|
|[POST userGroupPermission](../api/dynamics_usergrouppermission_create.md)|userGroupPermission|Creates a user group permission object.|
|[PATCH userGroupPermission](../api/dynamics_usergrouppermission_update.md)|userGroupPermission|Updates a user group permission object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[userGroup](dynamics_usergroup.md)|userGroup |Gets the user group of the userGroupPermission.|
|[permissionSet](dynamics_permissionset.md)|permissionSet |Gets the permission set of the userGroupPermission.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the user group permission. Read-Only.|
|userGroupCode|string|The user group code.|
|roleId|string|The unique ID of the user group permission role.|
|displayName|string|Specifies the user group permission's name.|
|appId|GUID|The ID of the App.|
|extensionName|string|The name of the extension.|
|scope|string|Scope of the user group permission.|

## JSON representation

Here is a JSON representation of the userGroupPermission resource.


```json
{
    "id": "GUID",
    "userGroupCode": "string",
    "roleId": "string",
    "displayName": "string",
    "appId": "GUID",
    "extensionName": "string",
    "scope": "string"
}
```

<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET userGroupPermission](../api/dynamics_usergrouppermission_get.md)  
[DELETE userGroupPermission](../api/dynamics_usergrouppermission_delete.md)  
[POST userGroupPermission](../api/dynamics_usergrouppermission_create.md)  
[PATCH userGroupPermission](../api/dynamics_usergrouppermission_update.md)  
