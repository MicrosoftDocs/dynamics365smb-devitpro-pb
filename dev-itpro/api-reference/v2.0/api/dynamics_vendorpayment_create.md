---
title: CREATE vendorPayments | Microsoft Docs
description: Creates a vendorPayment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Create vendorPayments
Create a vendorPayment object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/vendorPayments
```

## Request headers

|Header         |Value                    |
|---------------|-------------------------|
|Authorization  |Bearer {token}. Required.|
|Content-Type   |application/json         |

## Request body
In the request body, supply a JSON representation of **vendorPayments** object.

## Response
If successful, this method returns ```201 Created``` response code and a **vendorPayments** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPayments
Content-type: application/json

{
PLACE CODE HERE.
}
```

**Response**

Here is an example of the response. 

```json
HTTP/1.1 201 Created
Content-type: application/json

{
PLACE CODE HERE.
}
```


## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)     
[vendorPayment](../resources/dynamics_vendorPayment.md)  
[Get vendorPayment](dynamics_vendorPayment_Get.md)   
[Delete vendorPayment](dynamics_vendorPayment_Delete.md)   
[Update vendorPayment](dynamics_vendorPayment_Update.md)   


