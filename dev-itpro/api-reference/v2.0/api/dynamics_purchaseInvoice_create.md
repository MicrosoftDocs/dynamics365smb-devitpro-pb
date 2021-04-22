---
title: Create purchaseInvoices  
description: Creates a purchase invoice object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create purchaseInvoices

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a purchase invoice report object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/purchaseInvoices
```

## Request headers

|Header         |Value                        |
|---------------|-----------------------------|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json             |

## Request body
In the request body, supply a JSON representation of a **purchaseInvoices** object.

## Response
If successful, this method returns ```201 Created``` response code and a **purchaseInvoices** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices
Content-type: application/json

{
    "id": "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "number": "108001",
    "invoiceDate": "2019-01-01",
    "postingDate": "2019-01-01",
    "dueDate": "2019-01-01",
    "vendorInvoiceNumber": "107001",
    "vendorId": "f8a5738a-44e3-ea11-bb43-000d3a2feca1",
    "vendorNumber": "20000",
    "vendorName": "First Up Consultants",
    "payToName": "First Up Consultants",
    "payToContact": "Evan McIntosh",
    "payToVendorId": "f8a5738a-44e3-ea11-bb43-000d3a2feca1",
    "payToVendorNumber": "20000",
    "shipToName": "",
    "shipToContact": "",
    "buyFromAddressLine1": "100 Day Drive",
    "buyFromAddressLine2": "",
    "buyFromCity": "Chicago",
    "buyFromCountry": "US",
    "buyFromState": "IL",
    "buyFromPostCode": "61236",
    "shipToAddressLine1": "7122 South Ashford Street",
    "shipToAddressLine2": "Westminster",
    "shipToCity": "Atlanta",
    "shipToCountry": "US",
    "shipToState": "",
    "shipToPostCode": "31772",
    "payToAddressLine1": "100 Day Drive",
    "payToAddressLine2": "",
    "payToCity": "Chicago",
    "payToCountry": "US",
    "payToState": "IL",
    "payToPostCode": "61236",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "pricesIncludeTax": false,
    "discountAmount": 0,
    "discountAppliedBeforeTax": true,
    "totalAmountExcludingTax": 3122.8,
    "totalTaxAmount": 187.37,
    "totalAmountIncludingTax": 3310.17,
    "status": "Paid",
    "lastModifiedDateTime": "2020-08-21T00:26:53.793Z"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  

[Purchase Invoice](../resources/dynamics_purchaseinvoice.md)  
[Get Purchase Invoice](dynamics_purchaseinvoice_get.md)  
[Update Purchase Invoice](dynamics_purchaseinvoice_update.md)  
[Delete Purchase Invoice](dynamics_purchaseinvoice_delete.md)  