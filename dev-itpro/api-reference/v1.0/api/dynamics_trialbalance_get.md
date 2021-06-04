---
title: (v1.0) Get trialBalance
description: (v1.0) Gets a trial balance object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get trialBalance
Retrieve the properties and relationships of a trial balance report object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/trialBalance
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **trialBalance** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/trialBalance?$orderby number&$filter=dateFilter ge 2019-01-01 and dateFilter le 2019-12-31
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "number": "1110",
  "display": "Accounts Receivable",
  "totalDebit": "0.00",
  "totalCredit": "0.00",
  "balanceAtDateDebit": "72,893.84",
  "balanceAtDateCredit": "0.00",
  "dateFilter": "2019-12-31"    
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Trial Balance](../resources/dynamics_trialbalance.md)  
