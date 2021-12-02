---
title: (v1.0) Get accounts
description: (v1.0) Gets an account object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/14/2019
ms.author: solsen
---

# Get accounts (v1.0)
Retrieve the properties and relationships of an account object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

> [!NOTE]  
> Only accounts with the account type set to **Posting** and the **Direct Posting** flag set to **true** are returned.

## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/accounts({id})
```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body (v1.0)
Do not supply a request body for this method.
## Response (v1.0)
If successful, this method returns a ```200 OK``` response code and an **accounts** object in the response body.

## Example (v1.0)

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/accounts({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "id-value",
    "number": "10700",
    "displayName": "Inventory",
    "category": "Assets",
    "subCategory": "Inventory",
    "blocked": false,
    "lastModifiedDateTime": "2017-03-15T02:20:58.747Z"
}
```


## See also

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Account](../resources/dynamics_account.md)  
[Get Aged Accounts Payable](dynamics_agedaccountspayable_get.md)  
[Get Aged Accounts Receivable](dynamics_agedaccountsreceivable_get.md)  
