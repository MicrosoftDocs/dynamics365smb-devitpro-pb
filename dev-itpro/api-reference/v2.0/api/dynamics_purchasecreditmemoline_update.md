---
title: Update purchaseCreditMemoLines
description: Updates a  purchase credit memo line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Update purchaseCreditMemoLines

Updates the properties of a purchase credit memo line object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/purchaseCreditMemoLines({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **purchaseCreditMemoLine**, the **purchase credit memo line** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **purchaseCreditMemoLine** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemoLines({id})
Content-type: application/json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "quantity": 3
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "documentId": "dddddddd-3333-4444-5555-eeeeeeeeeeee",
    "sequence": 10000,
    "itemId": "bbbbbbbb-1111-2222-3333-cccccccccccc",
    "accountId": "",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "Athens Desk",
    "unitOfMeasureId": "cccccccc-2222-3333-4444-dddddddddddd",
    "unitOfMeasureCode": "PCS",
    "unitCost": 250.00,
    "quantity": 3,
    "discountAmount": 37.50,
    "discountPercent": 5,
    "discountAppliedBeforeTax": true,
    "amountExcludingTax": 712.50,
    "taxCode": "VAT10",
    "taxPercent": 10,
    "totalTaxAmount": 71.25,
    "amountIncludingTax": 783.75,
    "invoiceDiscountAllocation": 0.00,
    "netAmount": 712.50,
    "netTaxAmount": 71.25,
    "netAmountIncludingTax": 783.75,
    "itemVariantId": "",
    "locationId": "aaaaaaaa-6666-7777-8888-bbbbbbbbbbbb"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemoLine](../resources/dynamics_purchaseCreditMemoLine.md)  
[GET purchaseCreditMemoLine](dynamics_purchasecreditmemoline_get.md)  
[DELETE purchaseCreditMemoLine](dynamics_purchasecreditmemoline_delete.md)  
[POST purchaseCreditMemoLine](dynamics_purchasecreditmemoline_create.md)
