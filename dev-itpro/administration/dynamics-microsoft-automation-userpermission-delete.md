---
title: Delete userPermission | Microsoft Docs
description: Delete userPermission objects in Dynamics 365 Business Central.
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

# Delete userPermission
Removes a user from userPermission object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request

```json
DELETE /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userPermissions({userSecurityID},'{id}',{companyName}','{scope}',{appId})

```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match|Required. When this request header is included and the eTag provided does not match the current tag on the **userPermission**, the **userPermission** will not be deleted. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/users({userSecurityId})/userPermissions(781f5ae5-a5d9-4ec3-8cea-2167a8064dc6, 'SECURITY', 'CRONOS','System',00000000-0000-0000-0000-000000000000)
If-Match:*
```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[UserPermission Resource Type](dynamics-microsoft-automation-userpermission.md)  
