---
title: Delete userPermission | Microsoft Docs
description: Deletes an user permission object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Delete userPermission

Deletes an user permission from [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```json
DELETE /microsoft/automation/{apiVersion}/companies({companyId})/users({userSecurityID})/userPermissions({userSecurityID},'{id}',{companyName}','{scope}',{appId})

```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **userPermission**, the **userPermission** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the userPermission. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/users({userSecurityId})/userPermissions(781f5ae5-a5d9-4ec3-8cea-2167a8064dc6, 'SECURITY', 'CRONOS','System',00000000-0000-0000-0000-000000000000)
If-Match:*
```

**Response**

Here is an example of the response.

```json
HTTP/1.1 204 No Content
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[userPermission](../resources/dynamics_userPermission.md)
