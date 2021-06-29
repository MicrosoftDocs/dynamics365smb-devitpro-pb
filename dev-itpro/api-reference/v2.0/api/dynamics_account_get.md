---
title: Get accounts  
description: Gets an account object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
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
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **accounts** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/accounts({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "a2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "10000",
    "displayName": "BALANCE SHEET",
    "category": "Assets",
    "subCategory": "Assets",
    "blocked": false,
    "accountType": "Heading",
    "directPosting": false,
    "lastModifiedDateTime": "2020-08-21T00:24:15.327Z"
}
```


## See also

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[account](../resources/dynamics_account.md)    
