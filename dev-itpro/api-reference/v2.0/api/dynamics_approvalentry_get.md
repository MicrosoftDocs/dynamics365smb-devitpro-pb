---
title: Get Approval Entries with the Business Central API
description: Use the Business Central API to retrieve current approval entries, including document details, approvers, status, amounts, and due dates.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/05/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get approval entries

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties of an approvalEntry object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] based on the environment. For more information, see [API endpoints](../endpoints-apis-for-dynamics.md).

```http
GET businesscentralPrefix/companies({companyId})/approvalEntries({approvalEntryId})
```

To retrieve all approval entries, omit `({approvalEntryId})` from the request URL.

## Request headers

| Header | Value |
|:-------|:------|
| Authorization | Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and an **approvalEntry** object in the response body.

## Example

**Request**

Here's an example of the request.

```http
GET https://{businesscentralPrefix}/api/v2.0/companies({companyId})/approvalEntries({approvalEntryId})
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object is truncated for brevity. The actual response includes all properties.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "entryNumber": 42,
    "documentType": "Order",
    "documentNumber": "101001",
    "senderId": "ALEX",
    "senderName": "Alex Wilber",
    "approverId": "SARA",
    "approverName": "Sara Davis",
    "status": "Open",
    "dateTimeSentForApproval": "2026-08-04T09:30:00Z",
    "dueDate": "2026-08-11",
    "amount": 1250.00,
    "currencyCode": "USD",
    "lastModifiedDateTime": "2026-08-04T09:30:00Z"
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[approvalEntry](../resources/dynamics_approvalentry.md)
