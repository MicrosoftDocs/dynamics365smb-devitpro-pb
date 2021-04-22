---
title: GET vendorPayments | Microsoft Docs
description: Gets a vendorPayment object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Get vendorPayments
Retrieve the properties and relationships of a vendorPayment object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/vendorPayments({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **vendorPayments** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPayments({id})
```

**Response**

Here is an example of the response. 

```json
{
PLACE CODE HERE.
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[vendorPayment](../resources/dynamics_vendorPayment.md)  
[Delete vendorPayment](dynamics_vendorPayment_Delete.md)   
[Create vendorPayment](dynamics_vendorPayment_Create.md)   
[Update vendorPayment](dynamics_vendorPayment_Update.md)   

