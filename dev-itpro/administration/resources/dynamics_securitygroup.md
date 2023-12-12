---
title: securityGroup resource type
description: A security group object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/04/2023
ms.author: solsen
---

# securityGroup resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a security group in [!INCLUDE[prod_short](../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET securityGroup](../api/dynamics_securitygroup_get.md)|securityGroup|Gets a security group object.|
|[DELETE securityGroup](../api/dynamics_securitygroup_delete.md)|none|Deletes a security group object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[securityGroupMembers](dynamics_securitygroupmember.md)|securityGroupMembers |Gets the securitygroupmembers of the securityGroup.|
|[userPermissions](dynamics_userpermission.md)|userPermissions |Gets the user permissions of the securityGroup.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|string|The unique ID of the security group. Read-Only.|
|code|string|The code of the security group.|
|groupName|string||

## JSON representation

Here is a JSON representation of the securityGroup resource.


```json
{
    "id": "string",
    "code": "string",
    "groupName": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET securityGroup](../api/dynamics_securitygroup_get.md)
[DELETE securityGroup](../api/dynamics_securitygroup_delete.md)
