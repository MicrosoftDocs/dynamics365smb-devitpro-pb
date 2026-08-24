---
title: Get Posted Approval Entries with the Business Central API
description: Use the Business Central API to retrieve posted approval entries, including document details, approvers, final status, amounts, and history.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/21/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get posted approval entries

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties of a postedApprovalEntry object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] based on the environment. For more information, see [API endpoints](../endpoints-apis-for-dynamics.md).

```http
GET businesscentralPrefix/companies({companyId})/postedApprovalEntries({postedApprovalEntryId})
```

To retrieve all posted approval entries, omit `({postedApprovalEntryId})` from the request URL.

## Request headers

| Header | Value |
|:-------|:------|
| Authorization | Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a **postedApprovalEntry** object in the response body.

## Example

**Request**

Here's an example of the request.

```http
GET https://{businesscentralPrefix}/api/v2.0/companies({companyId})/postedApprovalEntries({postedApprovalEntryId})
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object is truncated for brevity. The actual response includes all properties.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "entryNumber": 41,
    "documentNumber": "PSI-103021",
    "senderId": "ALEX",
    "senderName": "Alex Wilber",
    "approverId": "SARA",
    "approverName": "Sara Davis",
    "status": "Approved",
    "dateTimeSentForApproval": "2026-08-01T08:15:00Z",
    "lastDateTimeModified": "2026-08-01T10:20:00Z",
    "amount": 2450.00,
    "currencyCode": "USD",
    "iterationNumber": 1,
    "lastModifiedDateTime": "2026-08-01T10:20:00Z"
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[postedApprovalEntry](../resources/dynamics_postedapprovalentry.md)
