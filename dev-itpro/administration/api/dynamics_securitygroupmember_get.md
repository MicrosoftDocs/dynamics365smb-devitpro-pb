---
title: Get Security Group Members with the Automation API
description: Use the Business Central automation API to get a security group member, including the user's security ID, name, and full name.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/05/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get a security group member with the automation API

Get the properties and relationships of a security group member in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

```http
GET /microsoft/automation/v2.0/companies({companyId})/securityGroupMembers(securityGroupCode='{securityGroupCode}',userSecurityId={userSecurityId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a **securityGroupMember** object in the response body.

## Example

**Request**

Here's an example of the request.

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/securityGroupMembers(securityGroupCode='{securityGroupCode}',userSecurityId={userSecurityId})
```

**Response**

Here's an example of the response.

```json
{
    "securityGroupCode": "FINANCE",
    "userSecurityId": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "securityGroupName": "Finance",
    "userName": "alex@contoso.com",
    "userFullName": "Alex Wilber"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Security group member](../resources/dynamics_securitygroupmember.md)
