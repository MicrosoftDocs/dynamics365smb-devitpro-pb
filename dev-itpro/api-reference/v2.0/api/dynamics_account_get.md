---
title: Get accounts  
description: Gets an account object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get accounts

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of an account object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/accounts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Don't supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **accounts** object in the response body.

## Example

**Request**

Here's an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/accounts({id})
```

**Response**

Here's an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "a2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "10100",
    "displayName": "Bank Account - Operating",
    "category": "Assets",
    "subCategory": "Current Assets",
    "blocked": false,
    "accountType": "Posting",
    "directPosting": true,
    "incomeBalance": "Balance Sheet",
    "debitCreditBalance": "Debit",
    "netChange": 125476.82,
    "totalBalance": 125476.82,
    "balance": 125476.82,
    "lastModifiedDateTime": "2025-04-15T14:32:18Z"
}
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[account](../resources/dynamics_account.md)
