---
title: Update purchaseCreditMemos
description: Updates a  purchase credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Update purchaseCreditMemos

Updates the properties of a purchase credit memo object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/purchaseCreditMemos({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **purchaseCreditMemo**, the **purchase credit memo** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **purchaseCreditMemo** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemos({id})
Content-type: application/json
{
    "id": "5d863f66-7de2-4d80-95a6-c2ec47e7b8b2",
    "number": "PCM-00103"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id": "5d863f66-7de2-4d80-95a6-c2ec47e7b8b2",
    "number": "PCM-00103",
    "creditMemoDate": "2023-08-15",
    "postingDate": "2023-08-15",
    "dueDate": "2023-09-14",
    "vendorId": "b3f1f2ac-5af6-40e5-b9ec-0155873d2768",
    "vendorNumber": "V00010",
    "vendorName": "Contoso Office Supplies",
    "payToVendorId": "b3f1f2ac-5af6-40e5-b9ec-0155873d2768",
    "payToVendorNumber": "V00010",
    "payToName": "Contoso Office Supplies",
    "buyFromAddressLine1": "123 Vendor Street",
    "buyFromAddressLine2": "Suite 400",
    "buyFromCity": "Seattle",
    "buyFromCountry": "US",
    "buyFromState": "WA",
    "buyFromPostCode": "98052",
    "payToAddressLine1": "123 Vendor Street",
    "payToAddressLine2": "Suite 400",
    "payToCity": "Seattle",
    "payToCountry": "US",
    "payToState": "WA",
    "payToPostCode": "98052",
    "shortcutDimension1Code": "SALES",
    "shortcutDimension2Code": "WEST",
    "currencyId": "1f71830e-a4ea-47d5-992a-33535c05c773",
    "currencyCode": "USD",
    "paymentTermsId": "3ae2e784-5af7-49e1-a753-6912b14c3f44",
    "shipmentMethodId": "7121d5f5-b64a-4d69-a598-1db41aeef722",
    "purchaser": "John Doe",
    "pricesIncludeTax": false,
    "discountAmount": 25.00,
    "discountAppliedBeforeTax": true,
    "totalAmountExcludingTax": 475.00,
    "totalTaxAmount": 38.00,
    "totalAmountIncludingTax": 513.00,
    "status": "Draft",
    "lastModifiedDateTime": "2023-08-15T14:22:30Z",
    "invoiceId": "a9d7ce3f-7b6e-4a8c-8c25-3daadbf6fc5d",
    "invoiceNumber": "INV-00251",
    "vendorReturnReasonId": "d8f4d778-8e9b-4c21-8af5-1b79f47fa261"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemo](../resources/dynamics_purchaseCreditMemo.md)  
[GET purchaseCreditMemo](dynamics_purchasecreditmemo_get.md)  
[DELETE purchaseCreditMemo](dynamics_purchasecreditmemo_delete.md)  
[POST purchaseCreditMemo](dynamics_purchasecreditmemo_create.md)
