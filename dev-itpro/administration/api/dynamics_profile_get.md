---
title: (automation API) Get profile
description: Gets a profile object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# (automation API) Get profile

Retrieves the properties and relationships of a profile object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


```json
/microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})/profile
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **profile** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})/profile
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "scope": "Tenant",
    "applicationId": "00001111-aaaa-2222-bbbb-3333cccc4444",
    "profileId": "BUSINESS MANAGER",
    "source": "Base Application",
    "displayName": "Business Manager",
    "enabled": true
}
```

## Related information

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[profile](../resources/dynamics_profile.md)  
