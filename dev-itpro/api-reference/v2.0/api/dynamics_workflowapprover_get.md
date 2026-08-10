---
title: Get Workflow Approvers with the Business Central API
description: Use the Business Central API to retrieve workflow approvers, including workflow details, approver types, approval limit types, users, and sequences.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/05/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get workflow approvers

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties of a workflowApprover object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] based on the environment. For more information, see [API endpoints](../endpoints-apis-for-dynamics.md).

```http
GET businesscentralPrefix/companies({companyId})/workflowApprovers({workflowApproverId})
```

To retrieve all workflow approvers, omit `({workflowApproverId})` from the request URL.

## Request headers

| Header | Value |
|:-------|:------|
| Authorization | Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a **workflowApprover** object in the response body.

## Example

**Request**

Here's an example of the request.

```http
GET https://{businesscentralPrefix}/api/v2.0/companies({companyId})/workflowApprovers({workflowApproverId})
```

**Response**

Here's an example of the response.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "workflowCode": "PURCH-ORDER",
    "workflowDescription": "Purchase Order Approval Workflow",
    "category": "PURCHASE",
    "enabled": true,
    "workflowStepId": 10,
    "argumentId": "bbbbbbbb-1111-2222-3333-cccccccccccc",
    "approverType": "Approver",
    "approverLimitType": "Direct Approver",
    "userGroupCode": "",
    "userGroupDescription": "",
    "userId": "00aa00aa-bb11-cc22-dd33-44ee44ee44ee",
    "userName": "sara@contoso.com",
    "sequence": 1,
    "lastModifiedDateTime": "2026-08-04T11:15:00Z"
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[workflowApprover](../resources/dynamics_workflowapprover.md)
