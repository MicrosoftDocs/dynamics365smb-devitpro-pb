---
title: userGroupMember resource type | Microsoft Docs
description: An user group member object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# userGroupMember resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an user group member in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET userGroupMember](../api/dynamics_usergroupmember_get.md)|userGroupMember|Gets a user group member object.|
|[DELETE userGroupMember](../api/dynamics_usergroupmember_delete.md)|none|Deletes a user group member object.|
|[POST userGroupMember](../api/dynamics_usergroupmember_create.md)|userGroupMember|Creates a user group member object.|
|[PATCH userGroupMember](../api/dynamics_usergroupmember_update.md)|userGroupMember|Updates a user group member object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[user](dynamics_user.md)|user |Gets the user of the userGroupMember.|
|[userGroup](dynamics_usergroup.md)|userGroup |Gets the usergroup of the userGroupMember.|
|[automationCompany](dynamics_automationcompany.md)|automationCompany |Gets the automationcompany of the userGroupMember.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the user group member.|
|userSecurityId|GUID|The unique ID of the user security.|
|code|string|The code of the user group member.|
|displayName|string|Specifies the user group member's name. This name will appear on all sales documents for the user group member.|
|companyName|string|The name of the company.|

## JSON representation

Here is a JSON representation of the userGroupMember resource.


```json
{
    "id": "GUID",
    "userSecurityId": "GUID",
    "code": "string",
    "displayName": "string",
    "companyName": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET userGroupMember](../api/dynamics_usergroupmember_get.md)  
[DELETE userGroupMember](../api/dynamics_usergroupmember_delete.md)  
[POST userGroupMember](../api/dynamics_usergroupmember_create.md)  
[PATCH userGroupMember](../api/dynamics_usergroupmember_update.md)  
