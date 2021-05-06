---
title: Get userGroup
description: Gets an user group object in Dynamics 365 Business Central.
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
# Get userGroup

Retrieves the properties and relationships of an user group object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).

```
GET /microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **userGroup** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})
```

**Response**
Here is an example of the response.

```json
{
    "id": "d38a92e2-9d74-eb11-bb5c-00155df3a615",
    "code": "D365 ACCOUNTANTS",
    "displayName": "Dynamics 365 for Accountants",
    "defaultProfileID": "ACCOUNTANT PORTAL",
    "assignToAllNewUsers": false
}
```
## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[userGroup](../resources/dynamics_userGroup.md)