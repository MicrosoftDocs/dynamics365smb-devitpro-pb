---
title: Post userGroupMembers | Microsoft Docs
description: Adds a user to userGroupMember objects in Dynamics 365 Business Central.
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

# Post userGroupMembers
Adds user to a userGroupMembers object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request

```json
POST /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userGroupMembers
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```201 Created``` response code and a  **userGroupMembers** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/users({userSecurityID})/userGroupMembers
Content-Type:application/json
{
    "code": "D365 EXT. ACCOUNTANT",
    "companyName" :"CRONUS USA, Inc."
}
```

**Response**

Here is an example of the response.

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "code": "D365 EXT. ACCOUNTANT",
    "userSecurityID": "7ae30772-481f-4895-a042-98f36e280680",
    "companyName": "CRONUS USA, Inc.",
    "displayName": ""
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[UserGroupMembers Resource Type](dynamics-microsoft-automation-usergroupmember.md)  
