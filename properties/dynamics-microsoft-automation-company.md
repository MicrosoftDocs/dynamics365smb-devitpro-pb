---
title: company resource type | Microsoft Docs
description: A user in Dynamics 365 Business Central.
documentationcenter: ''
author: henrikwh

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/01/2020
ms.author: solsen
---

# company Resource Type
Represents a user resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)]. 

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET companies](dynamics-microsoft-automation-company-get.md)|company|Gets all companies.|


## Properties

| Property | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|id               |GUID  |The unique ID of the company. Read-Only.|
|systemVersion    |string|The systemVersion.             |
|displayName      |string|diplayName of the company.     |
|name      |string|Name of the company.     |
|businessProfileId|string|ID of the businessProfile.|

## Relationships / Navigation properties
| Navigation property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|[automationCompanies](dynamics-microsoft-automation-automationcompany.md)               | automationCompany|Gets the automationCompanies. |
|[extensions](dynamics-microsoft-automation-extension.md)             |extension|Gets published extensions. |
|[userGroups](dynamics-microsoft-automation-usergroup.md)      |userGroup|Gets userGroups. |
|[users](dynamics-microsoft-automation-user.md)      |user|Gets the users. |
|[userGroupMembers](dynamics-microsoft-automation-usergroupmember.md)|userGroupMember|Gets userGroupMembers.|
|[userPermissions](dynamics-microsoft-automation-userpermission.md)|userPermission|Gets available userPermissions.|
|[permissionSets](dynamics-microsoft-automation-permissionset.md)|permissionSet|Gets available permissionSets.|

## JSON representation
Here is a JSON representation of the **company**.

```json
{
    "id": "3496bbf8-fcae-4e48-a4f8-cb17c27de0b3",
    "systemVersion": "24012",
    "name": "CRONUS USA, Inc.",
    "displayName": "CRONUS USA, Inc.",
    "businessProfileId": ""
}

```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Get Company](dynamics-microsoft-automation-company-get.md)   
