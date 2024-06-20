---
title: Get purchaseCreditMemoLines
description: Gets a purchase credit memo line object in Dynamics 365 Business Central.
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
# Get purchaseCreditMemoLines

Retrieves the properties and relationships of a purchase credit memo line object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```
GET businesscentralPrefix/companies({id})/purchaseCreditMemos({id})/purchaseCreditMemoLines({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseCreditMemoLine** object in the response body.

## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseCreditMemos({id})/purchaseCreditMemoLines({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.

<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
{
    "id": "9722e816-7602-ef11-b3c3-83fe9ccecec3",
    "documentId": "93c20e8c-7402-ef11-b3c3-83fe9ccecec3",
    "sequence": 10000,
    "itemId": "64748e9f-8401-ef11-9f8f-6045bde9b6de",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "ATHENS Desk",
    "unitOfMeasureId": "d5748e9f-8401-ef11-9f8f-6045bde9b6de",
    "unitOfMeasureCode": "PCS",
    "unitCost": 780.7,
    "quantity": 1,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 0,
    "taxCode": "FURNITURE",
    "taxPercent": 5.99974,
    "totalTaxAmount": 0,
    "amountIncludingTax": 0,
    "invoiceDiscountAllocation": 0,
    "netAmount": 780.7,
    "netTaxAmount": 46.84,
    "netAmountIncludingTax": 827.54,
    "itemVariantId": "00000000-0000-0000-0000-000000000000",
    "locationId": "00000000-0000-0000-0000-000000000000"
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[purchaseCreditMemoLine](../resources/dynamics_purchaseCreditMemoLine.md)  
[DELETE purchaseCreditMemoLine](dynamics_purchasecreditmemoline_delete.md)  
[POST purchaseCreditMemoLine](dynamics_purchasecreditmemoline_create.md)  
[PATCH purchaseCreditMemoLine](dynamics_purchasecreditmemoline_update.md)  
