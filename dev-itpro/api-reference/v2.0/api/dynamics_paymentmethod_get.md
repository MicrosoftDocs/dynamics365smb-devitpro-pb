---
title: GET paymentMethods  
description: Gets a paymentMethod object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get paymentMethods

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a payment method object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/paymentMethods({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **paymentMethods** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/paymentMethods({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{

    "id": "3a196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "ACCOUNT",
    "displayName": "Payment on account",
    "lastModifiedDateTime": "2020-08-21T00:48:51.487Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[paymentmethod](../resources/dynamics_paymentmethod.md)    
[Delete paymentmethod](dynamics_paymentmethod_Delete.md)    
[Create paymentmethod](dynamics_paymentmethod_Create.md)    
[Update paymentmethod](dynamics_paymentmethod_Update.md)    
