---
title: Create purchaseCreditMemos
description: Creates a purchase credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create purchaseCreditMemos

Creates a purchase credit memo in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST businesscentralPrefix/companies({id})/purchaseCreditMemos({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **purchaseCreditMemo**, the **purchaseCreditMemo** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **purchaseCreditMemo** object.

## Response

If successful, this method returns ```201 Created``` response code and a **purchaseCreditMemo** object in the response body.


## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemos({id})
Content-type: application/json
{
    "creditMemoDate": "2024-01-08",
    "postingDate": "2024-01-08",
    "dueDate": "2024-01-08",
    "vendorId": "60748e9f-8401-ef11-9f8f-6045bde9b6de",
    "vendorNumber": "20000",
    "payToVendorId": "60748e9f-8401-ef11-9f8f-6045bde9b6de",
    "payToVendorNumber": "20000",
    "buyFromAddressLine1": "100 Day Drive",
    "buyFromAddressLine2": "",
    "buyFromCity": "Chicago",
    "buyFromCountry": "US",
    "buyFromState": "IL",
    "buyFromPostCode": "61236",
    "payToAddressLine1": "100 Day Drive",
    "payToAddressLine2": "",
    "payToCity": "Chicago",
    "payToCountry": "US",
    "payToState": "IL",
    "payToPostCode": "61236",
    "shortcutDimension1Code": "",
    "shortcutDimension2Code": "",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "paymentTermsId": "62728e9f-8401-ef11-9f8f-6045bde9b6de",
    "shipmentMethodId": "00000000-0000-0000-0000-000000000000",
    "purchaser": "",
    "discountAmount": 0,
    "invoiceId": "00000000-0000-0000-0000-000000000000",
    "invoiceNumber": "",
    "vendorReturnReasonId": "00000000-0000-0000-0000-000000000000"
}
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.
<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id": "b5fcbb14-7402-ef11-b3c3-83fe9ccecec3",
    "number": "1004",
    "creditMemoDate": "2024-01-08",
    "postingDate": "2024-01-08",
    "dueDate": "2024-01-08",
    "vendorId": "60748e9f-8401-ef11-9f8f-6045bde9b6de",
    "vendorNumber": "20000",
    "vendorName": "First Up Consultants",
    "payToVendorId": "60748e9f-8401-ef11-9f8f-6045bde9b6de",
    "payToVendorNumber": "20000",
    "payToName": "First Up Consultants",
    "buyFromAddressLine1": "100 Day Drive",
    "buyFromAddressLine2": "",
    "buyFromCity": "Chicago",
    "buyFromCountry": "US",
    "buyFromState": "IL",
    "buyFromPostCode": "61236",
    "payToAddressLine1": "100 Day Drive",
    "payToAddressLine2": "",
    "payToCity": "Chicago",
    "payToCountry": "US",
    "payToState": "IL",
    "payToPostCode": "61236",
    "shortcutDimension1Code": "",
    "shortcutDimension2Code": "",
    "currencyId": "00000000-0000-0000-0000-000000000000",
    "currencyCode": "USD",
    "paymentTermsId": "62728e9f-8401-ef11-9f8f-6045bde9b6de",
    "shipmentMethodId": "00000000-0000-0000-0000-000000000000",
    "purchaser": "",
    "pricesIncludeTax": false,
    "discountAmount": 0,
    "discountAppliedBeforeTax": false,
    "totalAmountExcludingTax": 0,
    "totalTaxAmount": 0,
    "totalAmountIncludingTax": 0,
    "status": "Draft",
    "lastModifiedDateTime": "2024-04-24T19:51:46.917Z",
    "invoiceId": "00000000-0000-0000-0000-000000000000",
    "invoiceNumber": "",
    "vendorReturnReasonId": "00000000-0000-0000-0000-000000000000"
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemo](../resources/dynamics_purchaseCreditMemo.md)  
[GET purchaseCreditMemo](dynamics_purchasecreditmemo_get.md)  
[DELETE purchaseCreditMemo](dynamics_purchasecreditmemo_delete.md)  
[PATCH purchaseCreditMemo](dynamics_purchasecreditmemo_update.md)  
