---
title: Delete userGroupPermission
description: Deletes a user group permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/05/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Delete userGroupPermission

Deletes a user group permission from [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).

<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```json
DELETE /microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})/userGroupPermission({userGroupPermissionId})

```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **userGroupPermission**, the **userGroupPermission** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the userGroupPermission. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/userGroups({userGroupId})/userGroupPermission({userGroupPermissionId})
If-Match:*
```

**Response**

Here is an example of the response.

```json
HTTP/1.1 204 No Content
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[userGroupPermission](../resources/dynamics_usergrouppermission.md)  
