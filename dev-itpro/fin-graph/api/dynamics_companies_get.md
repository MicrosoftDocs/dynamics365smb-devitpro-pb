---
title: Get companies | Microsoft Docs
description: Gets a company object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/11/2017
ms.author: solsen
---

# Get companies
Retrieve the properties and relationships of a companies object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
```
GET /financials/companies
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **companies** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.financials.dynamics.com/v1.0/api/beta/companies
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "id-value",
    "systemVersion": "17806",
    "name": "CRONUS US",
    "displayName": "CRONUS USA, Inc.",
    "businessProfileId": ""
}
```


## See Also
[Working with Dynamics 365 for Financials in Microsoft Graph](../api/dynamics_graph_reference.md)  
