---
title: Get purchaseCreditMemoLines
description: Gets a purchase credit memo line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get purchaseCreditMemoLines

Retrieves the properties and relationships of a purchase credit memo line object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/purchaseCreditMemoLines({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseCreditMemoLine** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemoLines({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "c2810c4d-678e-45d1-b140-f84c2a20f420",
    "documentId": "5d863f66-7de2-4d80-95a6-c2ec47e7b8b2",
    "sequence": 10000,
    "itemId": "8b26f7d5-0178-4d8c-9a62-f5136b2e0f47",
    "accountId": "",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "Athens Desk",
    "unitOfMeasureId": "58ca7f64-a5c0-42e0-b5b2-a17c7a59cd6c",
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
    "locationId": "14f6f3a9-3528-47a1-b13e-46d43f5c6239"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemoLine](../resources/dynamics_purchaseCreditMemoLine.md)  
[DELETE purchaseCreditMemoLine](dynamics_purchasecreditmemoline_delete.md)  
[POST purchaseCreditMemoLine](dynamics_purchasecreditmemoline_create.md)  
[PATCH purchaseCreditMemoLine](dynamics_purchasecreditmemoline_update.md)
