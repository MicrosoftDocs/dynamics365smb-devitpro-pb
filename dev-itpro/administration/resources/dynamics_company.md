
---
title: company resource type | Microsoft Docs
description: A company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

# company resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a company in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET company](../api/dynamics_company_get.md)|company|Gets a company object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[configurationPackages](dynamics_configurationpackage.md)|configurationPackages |Gets the configurationpackages of the company.|
|[automationCompanies](dynamics_automationcompany.md)|automationCompanies |Gets the automationcompanies of the company.|
|[extensions](dynamics_extension.md)|extensions |Gets the extensions of the company.|
|[userGroups](dynamics_usergroup.md)|userGroups |Gets the usergroups of the company.|
|[users](dynamics_user.md)|users |Gets the users of the company.|
|[userGroupMembers](dynamics_usergroupmember.md)|userGroupMembers |Gets the usergroupmembers of the company.|
|[userPermissions](dynamics_userpermission.md)|userPermissions |Gets the userpermissions of the company.|
|[scheduledJobs](dynamics_scheduledjob.md)|scheduledJobs |Gets the scheduledjobs of the company.|
|[permissionSets](dynamics_permissionset.md)|permissionSets |Gets the permissionsets of the company.|
|[extensionUpload](dynamics_extensionupload.md)|extensionUpload |Gets the extensionupload of the company.|
|[extensionDeploymentStatus](dynamics_extensiondeploymentstatu.md)|extensionDeploymentStatus |Gets the extensiondeploymentstatus of the company.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item. Non-editable.|
|systemVersion|string|Specifies the internal version of the company.|
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
