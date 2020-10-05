---
title: Post userPermission | Microsoft Docs
description: Post userGroupMember objects in Dynamics 365 Business Central.
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
Adds user to a userPermission object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request

```json
POST /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userPermissions
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type   |application/json.|

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```201 Created``` response code and a  **userPermission** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/users({userSecurityID})/userPermissions
Content-Type:application/json
{ 
    "id": "SECURITY", 
    "company" : "CRONUS"
}

```

**Response**

Here is an example of the response.

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "userSecurityID": "82ae94d5-3445-47de-8668-714b5113a9c2",
    "id": "SECURITY",
    "company": "",
    "scope": "System",
    "appID": "00000000-0000-0000-0000-000000000000",
    "displayName": "",
    "extensionName": ""
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[UserPermission Resource Type](dynamics-microsoft-automation-userpermission.md)  
