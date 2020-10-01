---
title: Get userGroupMember | Microsoft Docs
description: Gets userGroupMember objects in Dynamics 365 Business Central.
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

# Get userGroupMembers
Retrieves the properties and relationships of a userGroupMembers object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
GET /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userGroupMembers
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and list of  **userGroupMembers** objects in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/users({userSecurityID})/userGroupMembers
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "code": "D365 BUS PREMIUM",
    "userSecurityID": "7ae30772-481f-4895-a042-98f36e280680",
    "companyName": "CRONUS USA, Inc.",
    "displayName": "D365 Premium Business Access"
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[UserGroupMembers Resource Type](dynamics-microsoft-automation-usergroupmember.md)  
