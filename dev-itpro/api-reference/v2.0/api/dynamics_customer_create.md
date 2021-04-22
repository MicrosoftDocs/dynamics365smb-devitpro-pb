---
title: Create customers | Microsoft Docs
description: Creates a customer object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create customers

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Create a customer object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/customers
```

## Request headers

|Header         |Value                    |
|---------------|-------------------------|
|Authorization  |Bearer {token}. Required.|
|Content-Type   |application/json         |

## Request body
In the request body, supply a JSON representation of **customers** object.

## Response
If successful, this method returns ```201 Created``` response code and a **customers** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/customers
Content-type: application/json

{
    "id": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "10000",
    "displayName": "Adatum Corporation",
    "type": "Company",
    "addressLine1": "192 Market Square",
    "addressLine2": "",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "",
    "email": "robert.townes@contoso.com",
    "website": "",
    "taxLiable": true,
    "taxAreaId": "90196a90-44e3-ea11-bb43-000d3a2feca1",
    "taxAreaDisplayName": "ATLANTA, GA",
    "taxRegistrationNumber": "",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "paymentTermsId": "04a5738a-44e3-ea11-bb43-000d3a2feca1",
    "shipmentMethodId": "00000000-0000-0000-0000-000000000000",
    "paymentMethodId": "3b196a90-44e3-ea11-bb43-000d3a2feca1",
    "blocked": " ",
    "lastModifiedDateTime": "2020-08-21T07:38:44.293Z"
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
    "id": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "10000",
    "displayName": "Adatum Corporation",
    "type": "Company",
    "addressLine1": "192 Market Square",
    "addressLine2": "",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "",
    "email": "robert.townes@contoso.com",
    "website": "",
    "taxLiable": true,
    "taxAreaId": "90196a90-44e3-ea11-bb43-000d3a2feca1",
    "taxAreaDisplayName": "ATLANTA, GA",
    "taxRegistrationNumber": "",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "paymentTermsId": "04a5738a-44e3-ea11-bb43-000d3a2feca1",
    "shipmentMethodId": "00000000-0000-0000-0000-000000000000",
    "paymentMethodId": "3b196a90-44e3-ea11-bb43-000d3a2feca1",
    "blocked": " ",
    "lastModifiedDateTime": "2020-08-21T07:38:44.293Z"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[customer](../resources/dynamics_customer.md)    
[Get customer](dynamics_customer_Get.md)    
[Delete customer](dynamics_customer_Delete.md)    
[Update customer](dynamics_customer_Update.md)    
