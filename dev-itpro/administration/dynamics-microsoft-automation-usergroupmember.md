---
title: userGroupMember resource type | Microsoft Docs
description: A userGroupMember in Dynamics 365 Business Central.
documentationcenter: ''
author: henrikwh

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/01/2020
ms.author: solsen
---

# userGroupMember Resource Type
Represents a userGroup resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET userGroupMembers](dynamics-microsoft-automation-usergroupmember-get.md)|userGroup|Gets userGroups for a user.|
|[POST userGroupMembers](dynamics-microsoft-automation-usergroupmember-post.md)|userGroup|Add user to userGroups.|
|[DELETE userGroupMembers](dynamics-microsoft-automation-usergroupmember-delete.md)|userGroup|Remove user from userGroups.|

## Properties

| Property | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|code             |string  |code of the userGroup.|
|userSecurityID   |Guid|SecurityId of the user.  |
|companyName|string|Name of the company.|
|displayName|string|Display name of the userGroup.|

## Relationships / Navigation properties

None

## JSON representation

Here is a JSON representation of the extension.

```json
{
    "code": "D365 BUS PREMIUM",
    "userSecurityID": "7ae30772-481f-4895-a042-98f36e280680",
    "companyName": "CRONUS USA, Inc.",
    "displayName": "D365 Premium Business Access"
}
```

<!-- 
## EDM metadata

```xml
<EntityType Name="userGroupMember">
    <Key>
        <PropertyRef Name="code" />
        <PropertyRef Name="userSecurityID" />
        <PropertyRef Name="companyName" />
    </Key>
    <Property Name="code" Type="Edm.String" Nullable="false" MaxLength="20" />
    <Property Name="userSecurityID" Type="Edm.Guid" Nullable="false" />
    <Property Name="companyName" Type="Edm.String" Nullable="false" MaxLength="30" />
    <Property Name="displayName" Type="Edm.String" MaxLength="50" />
    <NavigationProperty Name="userGroup" Type="Microsoft.NAV.userGroup" ContainsTarget="true" />
    <NavigationProperty Name="user" Type="Microsoft.NAV.user" ContainsTarget="true" />
    <NavigationProperty Name="automationCompany" Type="Microsoft.NAV.automationCompany" ContainsTarget="true" />
    </EntityType>
```
 -->
## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Get userGroupMembers](dynamics-microsoft-automation-usergroupmember-get.md)  
[Post userGroupMembers](dynamics-microsoft-automation-usergroupmember-post.md)  