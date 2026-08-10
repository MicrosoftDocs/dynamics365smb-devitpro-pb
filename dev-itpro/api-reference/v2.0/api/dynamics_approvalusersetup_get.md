---
title: Get Approval User Setups with the Business Central API
description: Use the Business Central API to retrieve approval user setups, including approvers, substitutes, approval limits, and administrator status.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/05/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get approval user setups

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties of an approvalUserSetup object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] based on the environment. For more information, see [API endpoints](../endpoints-apis-for-dynamics.md).

```http
GET businesscentralPrefix/companies({companyId})/approvalUserSetups({approvalUserSetupId})
```

To retrieve all approval user setups, omit `({approvalUserSetupId})` from the request URL.

## Request headers

| Header | Value |
|:-------|:------|
| Authorization | Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and an **approvalUserSetup** object in the response body.

## Example

**Request**

Here's an example of the request.

```http
GET https://{businesscentralPrefix}/api/v2.0/companies({companyId})/approvalUserSetups({approvalUserSetupId})
```

**Response**

Here's an example of the response.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "userId": "SARA",
    "userFullName": "Sara Davis",
    "salesPersonPurchaser": "SD",
    "approverId": "ADMIN",
    "salesAmountApprovalLimit": 10000,
    "unlimitedSalesApproval": false,
    "purchaseAmountApprovalLimit": 15000,
    "unlimitedPurchaseApproval": false,
    "requestApprovalAmountLimit": 5000,
    "unlimitedRequestApprovalAmount": false,
    "substitute": "ALEX",
    "email": "sara@contoso.com",
    "phoneNumber": "555-0100",
    "approvalAdmin": false,
    "lastModifiedDateTime": "2026-08-04T11:00:00Z"
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[approvalUserSetup](../resources/dynamics_approvalusersetup.md)
