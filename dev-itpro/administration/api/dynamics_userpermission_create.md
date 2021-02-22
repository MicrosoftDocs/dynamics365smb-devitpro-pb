---
title: Create userPermission | Microsoft Docs
description: Creates an user permission object in Dynamics 365 Business Central.
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
# Create userPermission

Creates an user permission in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```json
POST /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userPermissions({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **userPermission**, the **userPermission** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **userPermission** object.

## Response

If successful, this method returns ```201 Created``` response code and a **userPermission** object in the response body.


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

<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[userPermission](../resources/dynamics_userPermission.md)  
