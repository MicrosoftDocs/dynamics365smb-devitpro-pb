---
title: user resource type | Microsoft Docs
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

# user Resource Type
Represents a user resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)]. 

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET user](dynamics-microsoft-automation-user-get.md)|user|Gets all users.|
|[PATCH user](dynamics-microsoft-automation-user-patch.md)|user|Update user properties.|

## Properties
| Property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|userSecurityId   |GUID  |The unique ID of the package. Read-Only.|
|userName         |string|Specifies the extension name.           |
|displayName      |string|Major version of the extension.     |
|state            |string|Minor version of the extension.     |
|expiryDate|DateTimeOffset|Specifies the installation status.|


## Relationships / Navigation properties

| Navigation property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|[userGroupMembers](dynamics-microsoft-automation-usergroupmember.md)|userGroupMember|Gets userGroupMembers.|
|[userPermissions](dynamics-microsoft-automation-userpermission.md)|userPermission|Gets available userPermissions.|
|[scheduledJobs](dynamics-microsoft-automation-scheduledjob.md)|scheduledJob|Gets available scheduledJobs.|

## Bound Actions

| Actions         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[Microsoft.NAV.createNewUsersFromAzureAD](dynamics-microsoft-automation-configurationpackage-post.md)|none|.|

## JSON representation
Here is a JSON representation of the user.

```json
{
    "userSecurityId": "82ae94d5-3445-47de-8668-714b5113a9c2",
    "userName": "UserName",
    "displayName": "UserName",
    "state": "Enabled",
    "expiryDate": "0001-01-01T00:00:00Z"
}

```

<!-- 
```xml
           <EntityType Name="user">
                <Key>
                    <PropertyRef Name="userSecurityId" />
                </Key>
                <Property Name="userSecurityId" Type="Edm.Guid" Nullable="false" />
                <Property Name="userName" Type="Edm.String" MaxLength="50" />
                <Property Name="displayName" Type="Edm.String" MaxLength="80" />
                <Property Name="state" Type="Edm.String" />
                <Property Name="expiryDate" Type="Edm.DateTimeOffset" />
                <NavigationProperty Name="userGroupMembers" Type="Collection(Microsoft.NAV.userGroupMember)" ContainsTarget="true" />
                <NavigationProperty Name="userPermissions" Type="Collection(Microsoft.NAV.userPermission)" ContainsTarget="true" />
            </EntityType>
```
 -->
## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Get extensions](dynamics-microsoft-automation-extension-get.md)  
[Install extension](dynamics-microsoft-automation-extension-post.md)  
[Uninstall extension](dynamics-microsoft-automation-extension-post.md)  
