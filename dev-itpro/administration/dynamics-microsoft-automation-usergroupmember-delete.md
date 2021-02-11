---
title: Delete userGroupMember | Microsoft Docs
description: Delete  userGroupMember objects in Dynamics 365 Business Central.
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

# delete userGroupMembers
Removes a user from userGroupMembers object for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

## HTTP request

```json
DELETE /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userGroupMembers('{code}',{userSecurityID},'{companyName}')

```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match|Required. When this request header is included and the eTag provided does not match the current tag on the **userGroupMember**, the **userGroupMember** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({{companyId}})/users({{securityId}})/userGroupMembers('D365%20EXT.%20ACCOUNTANT',{{userSecurityId}},'CRONUS USA, Inc.')
If-Match:*
```
## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[UserGroupMembers Resource Type](dynamics-microsoft-automation-usergroupmember.md)  
