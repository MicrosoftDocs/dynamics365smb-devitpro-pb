---
title: GET currencies  
description: Gets a currency object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Get currencies

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a currency object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/currencies({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **currencies** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/currencies({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "0ca5738a-44e3-ea11-bb43-000d3a2feca1",
    "code": "CAD",
    "displayName": "Canadian dollar",
    "symbol": "$",
    "amountDecimalPlaces": "2:2",
    "amountRoundingPrecision": 0.01,
    "lastModifiedDateTime": "2020-08-21T00:24:12.793Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[currency](../resources/dynamics_currency.md)    
[Delete currency](dynamics_currency_Delete.md)    
[Create currency](dynamics_currency_Create.md)    
[Update currency](dynamics_currency_Update.md)    
