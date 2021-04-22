---
title: Get customers | Microsoft Docs
description: Gets a customer object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get customers

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a customer object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/customers({id})
```
> [!NOTE]  
> To include the financial details of a customer, expanding on customerFinancialDetails:
>```GET businesscentralPrefix/companies({id})/customers({id})?$expand=customerFinancialDetails```



## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **customers** object in the response body.

**Requests**

Here is some example requests.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/customers({id})
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/customers({id})?$expand=customerFinancialDetails, picture, defaultDimensions, currency, paymentTerm, shipmentMethod, paymentMethod
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/customers({id})?$expand=picture, currency, paymentMethod
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
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
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[customer](../resources/dynamics_customer.md)    
[Delete customer](dynamics_customer_Delete.md)    
[Create customer](dynamics_customer_Create.md)    
[Update customer](dynamics_customer_Update.md)    
