---
title: Get balanceSheet | Microsoft Docs
description: Gets a balance sheet object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/02/2018
ms.author: solsen
---

# Get balanceSheet
Retrieve the properties and relationships of a balance sheet report object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
```
GET /financials/companies({id})/balanceSheet
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
GET https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/balanceSheet?$orderby=lineNumber&$filter=dateFilter eq 2020-12-30
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Balance sheet](../resources/dynamics_balancesheet.md)  
[Get cash flow statement](dynamics_cashflowstatement_get.md)  
[Get account](dynamics_account_get.md)  
[Working with Dynamics 365 for Financials in Microsoft Graph](../resources/dynamics_overview.md) 