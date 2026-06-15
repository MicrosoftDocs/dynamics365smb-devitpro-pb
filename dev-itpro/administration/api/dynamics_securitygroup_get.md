---
title: (automation API) Get securityGroups
description: Gets a security group object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# (automation API) Get securityGroups

Retrieves the properties and relationships of a security group object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

```
GET /microsoft/automation/v2.0/companies({companyId})/securityGroups({securityGroupId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **securityGroup** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/securityGroups({securityGroupId})
```
**Response**

Here is an example of the response.

```json
{
    "id" : "",
    "code" : "",
    "groupName" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[securityGroup](../resources/dynamics_securityGroup.md)  
[DELETE securityGroup](dynamics_securitygroup_delete.md)  
