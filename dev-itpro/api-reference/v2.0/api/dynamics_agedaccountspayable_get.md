---
title: Get agedAccountsPayable  
description: Gets an aged accounts payable object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get agedAccountsPayable

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of an aged accounts payable report object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/agedAccountsPayable
```

## Request headers

|Header        |Value                     |
|--------------|--------------------------|
|Authorization |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **agedAccountsPayable** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/agedAccountsPayable
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "vendorId": "f7a5738a-44e3-ea11-bb43-000d3a2feca1",
    "vendorNumber": "10000",
    "name": "Fabrikam, Inc.",
    "currencyCode": "",
    "balanceDue": 2071.13,
    "currentAmount": 0,
    "period1Amount": 0,
    "period2Amount": 0,
    "period3Amount": 2071.13,
    "agedAsOfDate": "2020-08-21",
    "periodLengthFilter": "30D"
}
```


## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[agedaccountspayable](../resources/dynamics_agedaccountspayable.md)    
