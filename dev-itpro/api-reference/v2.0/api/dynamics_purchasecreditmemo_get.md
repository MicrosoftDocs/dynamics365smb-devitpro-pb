---
title: Get purchaseCreditMemos
description: Gets a purchase credit memo object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get purchaseCreditMemos

Retrieves the properties and relationships of a purchase credit memo object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/purchaseCreditMemos({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseCreditMemo** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemos({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "a6c93b42-89a1-ed11-94cc-000d3a2feca1",
    "number": "PCM-00428",
    "creditMemoDate": "2025-04-15",
    "postingDate": "2025-04-15",
    "dueDate": "2025-05-15",
    "vendorId": "e8d93b42-89a1-ed11-94cc-000d3a2feca1",
    "vendorNumber": "V-0452",
    "vendorName": "Woodgrove Distribution",
    "payToVendorId": "e8d93b42-89a1-ed11-94cc-000d3a2feca1",
    "payToVendorNumber": "V-0452",
    "payToName": "Woodgrove Distribution",
    "buyFromAddressLine1": "7890 Commercial Way",
    "buyFromAddressLine2": "Building 3",
    "buyFromCity": "Seattle",
    "buyFromCountry": "US",
    "buyFromState": "WA",
    "buyFromPostCode": "98052",
    "payToAddressLine1": "PO Box 1234",
    "payToAddressLine2": "",
    "payToCity": "Seattle",
    "payToCountry": "US",
    "payToState": "WA",
    "payToPostCode": "98055",
    "shortcutDimension1Code": "SALES",
    "shortcutDimension2Code": "WEST",
    "currencyId": "d8d93b42-89a1-ed11-94cc-000d3a2feca1",
    "currencyCode": "USD",
    "paymentTermsId": "c8d93b42-89a1-ed11-94cc-000d3a2feca1",
    "shipmentMethodId": "b8d93b42-89a1-ed11-94cc-000d3a2feca1",
    "purchaser": "JS",
    "pricesIncludeTax": false,
    "discountAmount": 50.00,
    "discountAppliedBeforeTax": true,
    "totalAmountExcludingTax": 950.00,
    "totalTaxAmount": 76.00,
    "totalAmountIncludingTax": 1026.00,
    "status": "Open",
    "lastModifiedDateTime": "2025-04-15T14:22:18Z",
    "invoiceId": "b6c93b42-89a1-ed11-94cc-000d3a2feca1",
    "invoiceNumber": "INV-00892",
    "vendorReturnReasonId": "a8d93b42-89a1-ed11-94cc-000d3a2feca1"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemo](../resources/dynamics_purchaseCreditMemo.md)  
[DELETE purchaseCreditMemo](dynamics_purchasecreditmemo_delete.md)  
[POST purchaseCreditMemo](dynamics_purchasecreditmemo_create.md)  
[PATCH purchaseCreditMemo](dynamics_purchasecreditmemo_update.md)
