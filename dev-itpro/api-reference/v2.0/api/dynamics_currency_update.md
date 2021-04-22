---
title: UPDATE currencies  | Microsoft Docs
description: Updates a currency object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update currencies

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a currency object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/currencies({id})
```

## Request headers

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|
|Content-Type |application/json         |
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **currencies**, the **currencies** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **currencies** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/currencies({id})
Content-type: application/json

{
    "displayName": "Canadian dollar"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
Content-type: application/json

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
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[currency](../resources/dynamics_currency.md)    
[Get currency](dynamics_currency_Get.md)    
[Delete currency](dynamics_currency_Delete.md)    
[Create currency](dynamics_currency_Create.md)    
