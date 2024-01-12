---
title: Get userGroup
description: Gets an user group object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/03/2023
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get userGroup

> [!NOTE]  
> User groups are replaced with [security groups](../../upgrade/deprecated-features-user-groups.md) and will be deprecated in version 25. For more information, see [security group APIs](../resources/dynamics_securitygroup.md) and [Control Access to Business Central Using Security Groups](/dynamics365/business-central/ui-security-groups).

Retrieves the properties and relationships of an user group object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

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