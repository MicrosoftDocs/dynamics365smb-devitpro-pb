---
title: Update customers  
description: Updates a customer object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update customers

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Update the properties of a customer object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/customers({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|Content-Type   |application/json.         |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **customers**, the **customers** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **customers** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/customers({id})
Content-type: application/json

{
  "displayName": "Coho Winery Inc.",
  "phoneNumber": "(555) 555-1234"
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
    "id": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "number": "10000",
    "displayName": "Coho Winery Inc.",
    "type": "Company",
    "addressLine1": "192 Market Square",
    "addressLine2": "",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "(555) 555-1234",
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
[Create customer](dynamics_customer_Create.md)    
