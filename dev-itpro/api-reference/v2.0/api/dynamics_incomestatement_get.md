---
title: Get incomeStatement | Microsoft Docs
description: Gets an income statement object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get incomeStatement

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of an income statement report object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/incomeStatement
```

## Request headers

|Header       |Value                     |
|-------------|--------------------------|
|Authorization|Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **incomeStatement** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/incomeStatement?$orderby=lineNumber&$filter=dateFilter ge 2019-01-01 and dateFilter le 2020-12-31
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "bafbf171-44e3-ea11-bb43-000d3a2feca1",
    "lineNumber": 10000,
    "display": "Income",
    "netChange": 0,
    "lineType": "header",
    "indentation": 0,
    "dateFilter": "2020-08-21"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[incomestatement](../resources/dynamics_incomestatement.md)    
