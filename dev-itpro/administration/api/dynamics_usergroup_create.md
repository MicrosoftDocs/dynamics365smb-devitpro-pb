---
title: Create userGroup | Microsoft Docs
description: Creates a user group object in Dynamics 365 Business Central.
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
# Create userGroup

Creates a user group in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


```
POST /microsoft/automation/v2.0/companies({companyId})/userGroups
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **userGroup** object.

## Response

If successful, this method returns ```201 Created``` response code and a **userGroup** object in the response body.


## Example

**Request**

Here is an example of the request.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/userGroups
Content-type: application/json
{
    "code": "NEW USER GROUP",
    "displayName": "New User Group",
    "defaultProfileID": "ACCOUNTANT"
}
```

**Response**
Here is an example of the response.
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id": "90814d0b-caad-eb11-9b52-000d3ab03e45",
    "code": "NEW USER GROUP",
    "displayName": "New User Group",
    "defaultProfileID": "ACCOUNTANT",
    "assignToAllNewUsers": false
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[userGroup](../resources/dynamics_usergroup.md)  
