---
title: Create userPermission
description: Creates an user permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create userPermission

Creates an user permission in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```json
POST /microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})/userPermissions
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **userPermission** object.

## Response

If successful, this method returns ```201 Created``` response code and a **userPermission** object in the response body.


## Example

**Request**

Here is an example of the request.
```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})/userPermissions
Content-Type:application/json
{ 
    "roleId": "SECURITY", 
    "company" : "CRONUS"
}

```

**Response**

Here is an example of the response.

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "d38a92e2-9d74-eb11-bb5c-00155df3a615",
    "userSecurityId": "82ae94d5-3445-47de-8668-714b5113a9c2",
    "roleId": "SECURITY",
    "company": "CRONUS",
    "scope": "System",
    "appID": "00000000-0000-0000-0000-000000000000",
    "displayName": "",
    "extensionName": ""
}
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[userPermission](../resources/dynamics_userPermission.md)