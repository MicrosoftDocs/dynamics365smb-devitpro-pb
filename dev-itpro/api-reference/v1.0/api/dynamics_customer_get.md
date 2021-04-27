---
title: Get customers | Microsoft Docs
description: Gets a customer object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get customers
Retrieve the properties and relationships of a customer object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
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
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/customers({id})
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/customers({id})?$expand=customerFinancialDetails, picture, defaultDimensions, currency, paymentTerm, shipmentMethod, paymentMethod
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/customers({id})?$expand=picture, currency, paymentMethod
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "id": "id-value",
  "number": "10000",
  "displayName": "Coho Winery",
  "type": "Company",
  "address": {
    "street": "192 Market Square",
    "city": "Atlanta",
    "state": "GA",
    "countryLetterCode": "US",
    "postalCode": "31772"
  },
  "phoneNumber": "",
  "email": "jim.glynn@cronuscorp.net",
  "website": "",
  "taxLiable": true,
  "taxAreaId": "taxAreaId-value",
  "taxAreaDisplayName": "tax area",
  "taxRegistrationNumber": "28012001T",
  "currencyId": "currencyId-value",
  "currencyCode": "USD",
  "paymentTermsId": "3bb5b4b6-ea4c-43ca-ba1c-3b69e29a6668",
  "shipmentMethodId": "shipmentMethodId-value",
  "shipmentMethod": null,
  "paymentMethodId": "paymentMethodId-value",
  "blocked": " ",
  "lastModifiedDateTime": "2017-03-07T00:35:28.983Z"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  



[Error Codes](../dynamics_error_codes.md)  
[Customer](../resources/dynamics_customer.md)  
[Post Customers](dynamics_create_customer.md)  
[Patch Customers](dynamics_customer_update.md)  
[Delete Customers](dynamics_customer_delete.md)  
