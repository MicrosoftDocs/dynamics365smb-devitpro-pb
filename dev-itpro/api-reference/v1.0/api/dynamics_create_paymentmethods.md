---
title: (v1.0) Create paymentMethods
description: (v1.0) Creates a payment method object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create paymentMethods
Create a payment method object in D[!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/paymentMethods
```

## Request headers

|Header         |Value                        |
|---------------|-----------------------------|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json             |

## Request body
In the request body, supply a JSON representation of a **paymentMethods** object.

## Response
If successful, this method returns ```201 Created``` response code and a **paymentMethods** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/paymentMethods
Content-type: application/json

{
  "code": "CHECK",
  "displayName": "Check payment"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "code": "CHECK",
  "displayName": "Check payment",
  "lastModifiedDateTime": "2017-03-22T08:35:48.33Z"
}
```



## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Graph Reference](../api/dynamics_graph_reference.md)  
  
[Payment Methods](../resources/dynamics_paymentmethods.md)  
[Get Payment Methods](../api/dynamics_paymentmethods_get.md)  
[Update Payment Methods](../api/dynamics_paymentmethods_update.md)  
[Delete Payment Methods](../api/dynamics_paymentmethods_delete.md)  