---
title: Get userPermission | Microsoft Docs
description: Gets an user permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get userPermission

Retrieves the properties and relationships of an user permission object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```json
/microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})/userPermissions({userPermissionId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **userPermission** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})/userPermissions({userPermissionId})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "d38a92e2-9d74-eb11-bb5c-00155df3a615",
    "userSecurityId": "a0ad6d24-99b7-440e-a26d-9a86840c2056",
    "roleId": "SUPER",
    "company": "",
    "scope": "System",
    "appId": "00000000-0000-0000-0000-000000000000",
    "displayName": "This role has all permissions.",
    "extensionName": ""

}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[userPermission](../resources/dynamics_userPermission.md)
