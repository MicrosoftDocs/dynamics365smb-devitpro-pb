---
title: Update purchaseOrders  
description: Updates a  purchase order object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/24/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Update purchaseOrders

Updates the properties of a purchase order object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/purchaseOrders({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **purchaseOrder**, the **purchase order** will not be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **purchaseOrder** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseOrders({id})
Content-type: application/json
{
    "id" : "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "number" : "108001"
}
```

**Response**
Here is an example of the response.


```json
HTTP/1.1 200 OK
Content-type: application/json
{
   "id": "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
   "number": "108001",
   "orderDate": "2021-01-01",
   "postingDate": "2021-01-01",
   "dueDate": "2021-01-01",
   "vendorId" : "",
   "vendorNumber": "20000",
   "vendorName": "First Up Consultants",
   "payToName": "First Up Consultants",
   "payToVendorId": "Evan McIntosh",
   "payToVendorNumber": "20000",
   "shipToName": "First Up Consultants",
   "shipToContact": "Evan McIntosh",
   "buyFromAddressLine1": "100 Day Drive",
   "buyFromAddressLine2": "",
   "buyFromCity": "Chicago",
   "buyFromCountry": "US",
   "buyFromState": "IL",
   "buyFromPostCode": "61236",
   "shipToAddressLine1": "100 Day Drive",
   "shipToAddressLine2": "",
   "shipToCity": "Chicago",
   "shipToCountry": "US",
   "shipToState": "IL",
   "shipToPostCode": "61236",
   "payToAddressLine1": "100 Day Drive",
   "payToAddressLine2": "",
   "payToCity": "Chicago",
   "payToCountry": "US",
   "payToState": "IL",
   "payToPostCode": "61236",
   "currencyId" : "00000000-0000-0000-0000-000000000000",
   "currencyCode": "USD",
   "pricesIncludeTax" : false,
   "paymentTermsId" : "04a5738a-44e3-ea11-bb43-000d3a2feca1",
   "shipmentMethodId" : "93f5638a-55e3-jk22-aa32-211d3a2fdce5",
   "purchaser" : "First Up Consultants",
   "requestedReceiptDate" : "2021-01-01",
   "discountAmount" : 0,
   "discountAppliedBeforeTax" : true,
   "totalAmountExcludingTax": 3122.8,
   "totalTaxAmount": 187.37,
   "totalAmountIncludingTax": 3310.17,
   "fullyReceived" : true,
   "status" : "In Review",
   "lastModifiedDateTime": "2021-01-01"
}
```

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[purchaseOrder](../resources/dynamics_purchaseOrder.md)  
[GET purchaseOrder](dynamics_purchaseorder_get.md)  
[DELETE purchaseOrder](dynamics_purchaseorder_delete.md)  
[POST purchaseOrder](dynamics_purchaseorder_create.md)  
