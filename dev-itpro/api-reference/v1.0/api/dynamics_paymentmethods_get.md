---
title: (v1.0) Get paymentMethods
description: (v1.0) Gets a payment method object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get paymentMethods (v1.0)
Retrieve the properties and relationships of a payment method object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

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

  "id": "id-value",
  "code": "CHECK",
  "displayName": "Check payment",
  "lastModifiedDateTime": "2017-03-22T08:35:48.33Z"
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Payment Methods](../resources/dynamics_paymentmethods.md)  
[Create Payment Methods](../api/dynamics_create_paymentmethods.md)  
[Update Payment Methods](../api/dynamics_paymentmethods_update.md)  
[Delete Payment Methods](../api/dynamics_paymentmethods_delete.md)  