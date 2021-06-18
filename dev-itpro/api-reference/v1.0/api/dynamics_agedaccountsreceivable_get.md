--- 
title: (v1.0) Get agedAccountsReceivable
description: (v1.0) Gets an aged accounts receivable object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get agedAccountsReceivable (v1.0)
Retrieve the properties and relationships of an aged accounts receivable report object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/agedAccountsReceivable
```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body (v1.0)
Do not supply a request body for this method.
## Response (v1.0)
If successful, this method returns a ```200 OK``` response code and an **agedAccountsReceivable** object in the response body.

## Example (v1.0)

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/agedAccountsReceivable
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "customerId": "id-value",
  "customerNumber": "30000",
  "name": "Relecloud",
  "currencyCode": "USD",
  "balanceDue": 349615.45,
  "currentAmount": 0,
  "period1Amount": 349615.45,
  "period2Amount": 0,
  "period3Amount": 0,
  "agedAsOfDate": "2017-04-25",
  "periodLengthFilter": "3M"   
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Aged Accounts Receivable](../resources/dynamics_agedaccountsreceivable.md)  
[Get Aged Accounts Payable](../api/dynamics_agedaccountspayable_get.md)  
[Account](../resources/dynamics_account.md)  
