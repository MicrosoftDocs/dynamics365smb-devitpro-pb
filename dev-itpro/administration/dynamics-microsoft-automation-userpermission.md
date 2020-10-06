---
title: userPermissions resource type | Microsoft Docs
description: A userPermission in Dynamics 365 Business Central.
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

# userPermissions Resource Type
Represents a userPermissions resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET userPermissions](dynamics-microsoft-automation-userpermission-get.md)|userPermission|Gets all userPermissions.|
|[POST userPermissions](dynamics-microsoft-automation-userpermission-post.md)|userGroup|Adds to userPermissions.|
|[DELETE userPermissions](dynamics-microsoft-automation-userpermission-delete.md)|userGroup|Removes from userPermissions.|

## Properties

| Property | Type |Description                             |
|:----------------|:-----|:--------------------------------|
|code             |string  |code of the userGroup.|
|displayName      |string|Display of the userGroup.|
|defaultProfileID |string|ID of the defaultProfile.|
|assignToAllNewUsers|boolean|If true, all new users are assigned to userGroup.|

## Relationships / Navigation properties
None

## JSON representation

Here is a JSON representation of the userPermissions.

```json
{
    "userSecurityID": "82ae94d5-3445-47de-8668-714b5113a9c2",
    "id": "D365 READ",
    "company": "CRONUS Danmark A/S",
    "scope": "System",
    "appID": "00000000-0000-0000-0000-000000000000",
    "displayName": "Dyn. 365-læseadgang, alle",
    "extensionName": ""
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
[userPermission Resource Type](dynamics-microsoft-automation-userpermission.md)  