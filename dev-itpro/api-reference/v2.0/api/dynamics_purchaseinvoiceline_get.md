---
title: Get purchaseInvoiceLines | Microsoft Docs
description: Gets a purchase invoice line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get purchaseInvoiceLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a purchase invoice line object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
GET businesscentralPrefix/companies({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **purchaseInvoiceLines** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "dd8db9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "ATHENS Desk",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitCost": 780.7,
    "quantity": 4,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 0,
    "taxCode": "FURNITURE",
    "taxPercent": 6.00006,
    "totalTaxAmount": 0,
    "amountIncludingTax": 0,
    "invoiceDiscountAllocation": 0,
    "netAmount": 3122.8,
    "netTaxAmount": 187.37,
    "netAmountIncludingTax": 3310.17,
    "expectedReceiptDate": "2019-01-01",
    "itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[purchaseinvoiceline](../resources/dynamics_purchaseinvoiceline.md)    
[Delete purchaseinvoiceline](dynamics_purchaseinvoiceline_Delete.md)    
[Create purchaseinvoiceline](dynamics_purchaseinvoiceline_Create.md)    
[Update purchaseinvoiceline](dynamics_purchaseinvoiceline_Update.md)    
