---
title: (v1.0) Get cashFlowStatement
description: (v1.0) Gets a cash flow statement object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get cashFlowStatement (v1.0)
Retrieve the properties and relationships of a cash flow statement report object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request (v1.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/cashFlowStatement
```

## Request headers (v1.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body (v1.0)
Do not supply a request body for this method.
## Response (v1.0)
If successful, this method returns a ```200 OK``` response code and a **cashFlowStatement** object in the response body.

## Example (v1.0)

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/cashFlowStatement?$orderby=lineNumber&$filter=dateFilter ge 2019-01-01 and dateFilter le 2020-12-31
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "lineNumber": 90000,
  "display": "Net Cash Provided by Operating Activities",
  "netChange": 39133.89,
  "lineType": "total",
  "indentation": 1,
  "dateFilter": "2016-12-31"   
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
   
[Cash Flow Statement](../resources/dynamics_cashflowstatement.md)  
[Get Balance Sheet](dynamics_balancesheet_get.md)  