---
title: Create salesQuoteLines | Microsoft Docs
description: Creates a sales quote line object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create salesQuoteLines

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Create a sales quote line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesQuotes({id})/salesQuoteLines
POST businesscentralPrefix/companies({id})/salesQuoteLines({salesQouteLineId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required.    |
|Content-Type  |application/json    |

## Request body
In the request body, supply a JSON representation of a **salesQuoteLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesQuoteLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesQuotes({id})/salesQuoteLines
Content-type: application/json

{
    "id": "1c8cb9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "920f5c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "04a6738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1936-S",
    "description": "BERLIN Guest Chair, yellow",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitPrice": 192.8,
    "quantity": 10,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 1928,
    "taxCode": "FURNITURE",
    "taxPercent": 5,
    "totalTaxAmount": 96.4,
    "amountIncludingTax": 2024.4,
    "netAmount": 1928,
    "netTaxAmount": 96.4,
    "netAmountIncludingTax": 2024.4,
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
    "id": "1c8cb9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "920f5c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "04a6738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1936-S",
    "description": "BERLIN Guest Chair, yellow",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitPrice": 192.8,
    "quantity": 10,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 1928,
    "taxCode": "FURNITURE",
    "taxPercent": 5,
    "totalTaxAmount": 96.4,
    "amountIncludingTax": 2024.4,
    "netAmount": 1928,
    "netTaxAmount": 96.4,
    "netAmountIncludingTax": 2024.4,
    "itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  

[Sales Quote Line](../resources/dynamics_salesquoteline.md)  
[Get Sales Quote Line](dynamics_salesquoteline_get.md)  
[Update Sales Quote Line](dynamics_salesquoteline_update.md)  
[Delete Sales Quote Line](dynamics_salesquoteline_delete.md)  