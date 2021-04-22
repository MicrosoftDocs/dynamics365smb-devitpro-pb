---
title: Get salesCreditMemoLines  
description: Gets a sales credit memo line in Dynamics 365 Business Central. 
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get salesCreditMemoLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a sales credit memo line object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## Prerequisites

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/salesCreditMemos({id})/salesCreditMemoLines({salesCreditMemoLineId})
GET businesscentralPrefix/companies({id})/salesCreditMemoLines({salesCreditMemoLineId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **salesCreditMemoLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesCreditMemos({id})/salesCreditMemoLines({salesCreditMemoLineId})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
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
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[salescreditmemoline](../resources/dynamics_salescreditmemoline.md)    
[Delete salescreditmemoline](dynamics_salescreditmemoline_Delete.md)    
[Create salescreditmemoline](dynamics_salescreditmemoline_Create.md)    
[Update salescreditmemoline](dynamics_salescreditmemoline_Update.md)    
