---
title: Get Security Groups with the Automation API
description: Use the Business Central automation API to get a security group, including its identifiers, retrieval status, and related security data.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/05/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get a security group with the automation API

Get the properties and relationships of a security group in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

```http
GET /microsoft/automation/v2.0/companies({companyId})/securityGroups('{securityGroupId}')
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a **securityGroup** object in the response body.

## Example

**Request**

Here's an example of the request.

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/securityGroups('{securityGroupId}')
```

**Response**

Here's an example of the response.

```json
{
    "id": "00aa00aa-bb11-cc22-dd33-44ee44ee44ee",
    "code": "FINANCE",
    "groupName": "Finance",
    "groupUserSecurityId": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "groupId": "00aa00aa-bb11-cc22-dd33-44ee44ee44ee",
    "retrievedSuccessfully": true
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Security group](../resources/dynamics_securitygroup.md)
[DELETE securityGroup](dynamics_securitygroup_delete.md)  
