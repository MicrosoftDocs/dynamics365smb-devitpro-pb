---
title: (v1.0) Get balanceSheet
description: (v1.0) Gets a balance sheet object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get balanceSheet
Retrieve the properties and relationships of a balance sheet report object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/balanceSheet
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **balanceSheet** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/balanceSheet?$orderby=lineNumber&$filter=dateFilter eq 2020-12-30
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "lineNumber": 10000,
  "display": "Assets",
  "balance": 11860.69,
  "lineType": "header",
  "indentation": 0,
  "dateFilter": "2020-12-30"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
 
[Balance Sheet](../resources/dynamics_balancesheet.md)  
[Get Cash Flow Statement](dynamics_cashflowstatement_get.md)  
[Get Account](dynamics_account_get.md)  
