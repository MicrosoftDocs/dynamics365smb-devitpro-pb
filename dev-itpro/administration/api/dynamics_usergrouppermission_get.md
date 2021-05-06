---
title: Get userGroupPermission
description: Gets a user group permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/05/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get userGroupPermission

Retrieves the properties and relationships of a user group permission object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```json
/microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})/userGroupPermission({userGroupPermissionId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **userGroupPermission** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})/userGroupPermission({userGroupPermissionId})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "d38a92e2-9d74-eb11-bb5c-00155df3a615",
    "userGroupCode": "D365 COMPANY HUB",
    "roleId": "D365 COMPANY HUB",
    "displayName": "D365 COMPANY HUB",
    "appID": "00000000-0000-0000-0000-000000000000",
    "scope": "System",
    "extensionName": ""
}
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[userGroupPermission](../resources/dynamics_usergrouppermission.md)  
