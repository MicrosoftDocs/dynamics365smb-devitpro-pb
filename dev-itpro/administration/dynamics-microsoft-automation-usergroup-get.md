---
title: Get userGroup  | Microsoft Docs
description: Gets userGroup in Dynamics 365 Business Central.
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

# Get userGroup
Retrieves the properties and relationships of a userGroup object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
GET /microsoft/automation/{apiVersion}/companies({companyId})/userGroups
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## JSON representation

Here is a JSON representation of the userGroup.

```json
{
    "code": "D365 ACCOUNTANTS",
    "displayName": "Dynamics 365 for Accountants",
    "defaultProfileID": "ACCOUNTANT PORTAL",
    "assignToAllNewUsers": false
}

```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
