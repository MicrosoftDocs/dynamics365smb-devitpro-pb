---
title: Get salesQuoteLines | Microsoft Docs
description: Gets a sales quote line object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/08/2018
ms.author: solsen
---

# Get salesQuoteLines
Retrieve the properties and relationships of a sales quote line object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## Prerequisites

## HTTP request

```
GET /financials/companies({id})/salesQuotes({id})/salesQuoteLines(documentId=({id}),sequence=({number}))
```

## Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **salesQuoteLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/salesQuotes({id})/salesQuoteLines(documentId=({id}),sequence={number}))
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "documentId": "id-value",
  "sequence": 10000,
  "itemId": "id-value",
  "accountId": "id-value",
  "lineType": "Item",
  "lineDetails": {
    "number": "1896-S",
    "displayName": "ATHENS Desk",
    "description": null
  },
  "description": "ATHENS Desk",
  "unitOfMeasureId": "id-value",
  "unitOfMeasure": {
    "code": "BOX",
    "displayName": "Box",
    "symbol": null,
    "unitConversion": null
  },
  "unitPrice": 6165,
  "quantity": 1,
  "discountAmount": 0,
  "discountPercent": 0,
  "discountAppliedBeforeTax": false,
  "amountExcludingTax": 6165,
  "taxCode": "VAT10",
  "taxPercent": 10,
  "totalTaxAmount": 0,
  "amountIncludingTax": 6165,
  "netAmount": 6165,
  "netTaxAmount": 0,
  "netAmountIncludingTax": 6165
}
```

## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Sales quote line](../resources/dynamics_salesquoteline.md)  
[Create sales quote line](../api/dynamics_create_salesquoteline.md)  
[Update sales quote line](../api/dynamics_salesquoteline_update.md)  
[Delete sales quote line](../api/dynamics_salesquoteline_delete.md)  