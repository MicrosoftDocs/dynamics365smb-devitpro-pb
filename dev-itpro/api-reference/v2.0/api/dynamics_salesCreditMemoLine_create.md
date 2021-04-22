---
title: Create salesCreditMemoLines | Microsoft Docs
description: Creates a sales credit memo line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create salesCreditMemoLines

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Create a sales credit memo line object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesCreditMemos({id})/salesCreditMemoLines
POST businesscentralPrefix/companies({id})/salesCreditMemoLines({salesCreditMemoLineId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json    |

## Request body
In the request body, supply a JSON representation of a **salesCreditMemoLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesCreditMemoLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesCreditMemos({id})/salesCreditMemoLines
Content-type: application/json

{
"id": "cd7b3ba0-bde3-ea11-aa60-000d3ad7cacb",
"documentId": "cb7b3ba0-bde3-ea11-aa60-000d3ad7cacb",
"sequence": 10000,
"itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
"accountId": "00000000-0000-0000-0000-000000000000",
"lineType": "Item",
"lineObjectNumber": "1896-S",
"description": "ATHENS Desk",
"unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
"unitOfMeasureCode": "PCS",
"unitPrice": 1000.8,
"quantity": 1,
"discountAmount": 0,
"discountPercent": 0,
"discountAppliedBeforeTax": false,
"amountExcludingTax": 1000.8,
"taxCode": "FURNITURE",
"taxPercent": 6.0002,
"totalTaxAmount": 60.05,
"amountIncludingTax": 1060.85,
"invoiceDiscountAllocation": 0,
"netAmount": 1000.8,
"netTaxAmount": 60.05,
"netAmountIncludingTax": 1060.85,
"shipmentDate": "2020-08-21",
"itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
Content-type: application/json

{
    "id": "cd7b3ba0-bde3-ea11-aa60-000d3ad7cacb",
    "documentId": "cb7b3ba0-bde3-ea11-aa60-000d3ad7cacb",
    "sequence": 10000,
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "ATHENS Desk",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitPrice": 1000.8,
    "quantity": 1,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 1000.8,
    "taxCode": "FURNITURE",
    "taxPercent": 6.0002,
    "totalTaxAmount": 60.05,
    "amountIncludingTax": 1060.85,
    "invoiceDiscountAllocation": 0,
    "netAmount": 1000.8,
    "netTaxAmount": 60.05,
    "netAmountIncludingTax": 1060.85,
    "shipmentDate": "2020-08-21",
    "itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  

[Sales Credit Memo Line](../resources/dynamics_salescreditmemoline.md)  
[Get Sales Credit Memo Line](dynamics_salescreditmemoline_get.md)  
[Update Sales Credit Memo Line](dynamics_salescreditmemoline_update.md)  
[Delete Sales Credit Memo Line](dynamics_salescreditmemoline_delete.md)  