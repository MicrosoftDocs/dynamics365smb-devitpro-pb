---
title: Update purchaseInvoices | Microsoft Docs
description: Updates a purchase invoice object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update purchaseInvoices

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a purchase invoices object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/purchaseInvoices({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **purchaseInvoices**, the **purchaseInvoices** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **purchaseInvoices** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices({id})
Content-type: application/json

{
  "paymentTermsId": "3bb5b4b6-ea4c-43ca-ba1c-3b69e29a6668"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
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
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[purchaseinvoice](../resources/dynamics_purchaseinvoice.md)    
[Get purchaseinvoice](dynamics_purchaseinvoice_Get.md)    
[Delete purchaseinvoice](dynamics_purchaseinvoice_Delete.md)    
[Create purchaseinvoice](dynamics_purchaseinvoice_Create.md)    
