---
title: Create salesInvoices  
description: Create a sales invoice object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create salesInvoices

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales invoice object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesInvoices
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|Content-Type   |application/json          |

## Request body
In the request body, supply a JSON representation of a **salesInvoices** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesInvoices** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices
Content-type: application/json

{
    "id": "9e0f5c9c-44e3-ea11-bb43-000d3a2feca1",
    "number": "PS-INV103001",
    "externalDocumentNumber": "",
    "invoiceDate": "2019-01-15",
    "postingDate": "2019-01-15",
    "dueDate": "2019-01-15",
    "customerPurchaseOrderReference": "",
    "customerId": "f3a5738a-44e3-ea11-bb43-000d3a2feca1",
    "customerNumber": "20000",
    "customerName": "Trey Research",
    "billToName": "Trey Research",
    "billToCustomerId": "f3a5738a-44e3-ea11-bb43-000d3a2feca1",
    "billToCustomerNumber": "20000",
    "shipToName": "Trey Research",
    "shipToContact": "Helen Ray",
    "sellToAddressLine1": "153 Thomas Drive",
    "sellToAddressLine2": "",
    "sellToCity": "Chicago",
    "sellToCountry": "US",
    "sellToState": "IL",
    "sellToPostCode": "61236",
    "billToAddressLine1": "153 Thomas Drive",
    "billToAddressLine2": "",
    "billToCity": "Chicago",
    "billToCountry": "US",
    "billToState": "IL",
    "billToPostCode": "61236",
    "shipToAddressLine1": "153 Thomas Drive",
    "shipToAddressLine2": "",
    "shipToCity": "Chicago",
    "shipToCountry": "US",
    "shipToState": "IL",
    "shipToPostCode": "61236",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "orderId": "00000000-0000-0000-0000-000000000000",
    "orderNumber": "",
    "paymentTermsId": "0ba5738a-44e3-ea11-bb43-000d3a2feca1",
    "shipmentMethodId": "00000000-0000-0000-0000-000000000000",
    "salesperson": "PS",
    "pricesIncludeTax": false,
    "remainingAmount": 0,
    "discountAmount": 0,
    "discountAppliedBeforeTax": true,
    "totalAmountExcludingTax": 164.7,
    "totalTaxAmount": 8.24,
    "totalAmountIncludingTax": 172.94,
    "status": "Paid",
    "lastModifiedDateTime": "2020-08-21T00:25:58.337Z",
    "phoneNumber": "",
    "email": "helen.ray@contoso.com"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Invoice](../resources/dynamics_salesinvoice.md)  
[Get Sales Invoice](dynamics_salesinvoice_get.md)  
[Update Sales Invoice](dynamics_salesinvoice_update.md)  
[Delete Sales Invoice](dynamics_salesinvoice_delete.md)  