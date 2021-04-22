---
title: Create vendors  
description: Creates a vendor object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create vendors

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a vendor object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/vendors
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json   |

## Request body
In the request body, supply a JSON representation of a **vendors** object.

## Response
If successful, this method returns ```201 Created``` response code and a **vendors** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/vendors
Content-type: application/json

{
    "id": "f7a5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "10000",
    "displayName": "Fabrikam, Inc.",
    "addressLine1": "10 North Lake Avenue",
    "addressLine2": "",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "4255550101",
    "email": "krystal.york@contoso.com",
    "website": "www.royalmail.co.uk",
    "taxRegistrationNumber": "",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "irs1099Code": "",
    "paymentTermsId": "0aa5738a-44e3-ea11-bb43-000d3a2feca1",
    "paymentMethodId": "3b196a90-44e3-ea11-bb43-000d3a2feca1",
    "taxLiable": true,
    "blocked": " ",
    "balance": 2071.13,
    "lastModifiedDateTime": "2020-08-21T07:38:46.53Z"
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
  "number": "40000",
  "displayName": "Wide World Importers",
  "lastModifiedDateTime": "2015-11-09T02:14:32Z"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[vendor](../resources/dynamics_vendor.md)    
[Get vendor](dynamics_vendor_Get.md)    
[Delete vendor](dynamics_vendor_Delete.md)    
[Update vendor](dynamics_vendor_Update.md)    
