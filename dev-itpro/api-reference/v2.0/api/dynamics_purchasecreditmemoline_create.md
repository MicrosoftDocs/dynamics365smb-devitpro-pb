---
title: Create purchaseCreditMemoLines
description: Creates a purchase credit memo line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Create purchaseCreditMemoLines

Creates a purchase credit memo line in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/purchaseCreditMemoLines({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **purchaseCreditMemoLine** object.

## Response

If successful, this method returns ```201 Created``` response code and a **purchaseCreditMemoLine** object in the response body.


## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemoLines({id})
Content-type: application/json
{
    "documentId": "dddddddd-3333-4444-5555-eeeeeeeeeeee",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "Athens Desk",
    "unitOfMeasureCode": "PCS",
    "unitCost": 250.00,
    "quantity": 2,
    "discountPercent": 5,
    "discountAppliedBeforeTax": true
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
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
    "quantity": 2,
    "discountAmount": 25.00,
    "discountPercent": 5,
    "discountAppliedBeforeTax": true,
    "amountExcludingTax": 475.00,
    "taxCode": "VAT10",
    "taxPercent": 10,
    "totalTaxAmount": 47.50,
    "amountIncludingTax": 522.50,
    "invoiceDiscountAllocation": 0.00,
    "netAmount": 475.00,
    "netTaxAmount": 47.50,
    "netAmountIncludingTax": 522.50,
    "itemVariantId": "",
    "locationId": "aaaaaaaa-6666-7777-8888-bbbbbbbbbbbb"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemoLine](../resources/dynamics_purchaseCreditMemoLine.md)  
[GET purchaseCreditMemoLine](dynamics_purchasecreditmemoline_get.md)  
[DELETE purchaseCreditMemoLine](dynamics_purchasecreditmemoline_delete.md)  
[PATCH purchaseCreditMemoLine](dynamics_purchasecreditmemoline_update.md)
