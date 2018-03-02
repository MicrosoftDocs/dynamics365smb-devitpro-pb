---
title: Get salesOrders | Microsoft Docs
description: Gets a sales order object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# Get salesOrders
Retrieve the properties and relationships of a sales order object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

```
GET /financials/companies({id})/salesOrders({id})
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **salesOrders** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/salesOrders({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "id": "id-value",
  "number": "1006",
  "orderDate": "2019-01-24",
  "customerId": "customerId-value",
  "contactId": "",
  "customerNumber": "GL000090",
  "customerName": "GL000090",
  "billingPostalAddress": {
    "street": "",
    "city": "",
    "state": "",
    "countryLetterCode": "",
    "postalCode": ""
  },
  "currencyId": "id-value",
  "currencyCode": "GBP",
  "pricesIncludeTax": false,
  "paymentTermsId": "id-value",
  "paymentTerms": "COD",
  "salesperson": "",
  "partialShipping": true,
  "requestedDeliveryDate": "2015-06-01",
  "discountAmount": 0,
  "discountAppliedBeforeTax": true,
  "totalAmountExcludingTax": 6825.6,
  "totalTaxAmount": 682.56,
  "totalAmountIncludingTax": 7508.16,
  "fullyShipped": true,
  "status": "Draft",
  "lastModifiedDateTime": "2017-03-17T19:02:22.043Z"
}
```

## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Sales order](../resources/dynamics_salesorder.md)  
[Create sales order](../api/dynamics_create_salesorder.md)  
[Update sales order](../api/dynamics_salesorder_update.md)  
[Delete sales order](../api/dynamics_salesorder_delete.md)  