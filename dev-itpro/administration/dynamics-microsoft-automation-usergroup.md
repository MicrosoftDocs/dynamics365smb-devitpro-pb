---
title: userGroup resource type | Microsoft Docs
description: A userGroup in Dynamics 365 Business Central.
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

# userGroup Resource Type
Represents a userGroup resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## Methods
| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET userGroups](dynamics-microsoft-automation-usergroup-get.md)|userGroup|Gets userGroups.|

## Properties

| Property | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|code             |string  |code of the userGroup.|
|displayName      |string  |Display of the useGroup.     |
|defaultProfileID|string   |ID of the defaultProfile.|
|assignToAllNewUsers|boolean|If true, all new users are assigned to userGroup.|

## Relationships / Navigation properties

None

## JSON representation

Here is a JSON representation of the userGroup.

```json
{
    "code": "D365 EXT. ACCOUNTANT",
    "displayName": "External Accountant",
    "defaultProfileID": "ACCOUNTANT",
    "assignToAllNewUsers": false
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
