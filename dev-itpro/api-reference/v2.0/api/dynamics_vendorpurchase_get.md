---
title: GET vendorPurchases | Microsoft Docs
description: Gets a vendorPurchase object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/24/2020
ms.author: solsen
---

# Get vendorPurchases

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a vendorPurchase object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/vendorPurchases({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **vendorPurchases** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPurchases({id})
```

**Response**

Here is an example of the response. 

```json
{
    "vendorId": "f7a5738a-44e3-ea11-bb43-000d3a2feca1",
    "vendorNumber": "10000",
    "name": "Fabrikam, Inc.",
   "totalPurchaseAmount": "32.0",
   "dateFilter_FilterOnly": "2020-08-21"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[vendorpurchase](../resources/dynamics_vendorpurchase.md)    
