---
title: Get User | Microsoft Docs
description: Gets a user object in Dynamics 365 Business Central.
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

# Get user
Retrieves the properties and relationships of a user object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request
```
GET /microsoft/automation/{apiVersion}/companies({{companyid}})/users
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and list of  **user** objects in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/users
```

**Response**

Here is an example of the response.

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "userSecurityId": "82ae94d5-3445-47de-8668-714b5113a9c2",
    "userName": "JOE",
    "displayName": "JOE JONES",
    "state": "Enabled",
    "expiryDate": "0001-01-01T00:00:00Z"
}
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[User Resource Type](dynamics-microsoft-automation-user.md)  