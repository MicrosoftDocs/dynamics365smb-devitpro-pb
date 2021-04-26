---
title: Create purchaseInvoiceLines  
description: Creates a purchase invoice line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Create purchaseInvoiceLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a purchase invoice line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
POST businesscentralPrefix/companies({id})/purchaseInvoiceLines({purchaseInvoiceLineId})
```

## Request headers

|Header         |Value                        |
|---------------|-----------------------------|
|Authorization  |Bearer {token}. Required.    |
|Content-Type   |application/json             |

## Request body
In the request body, supply a JSON representation of a **purchaseInvoiceLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **purchaseInvoiceLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines
Content-type: application/json

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

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

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
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Purchase Invoice Line](../resources/dynamics_purchaseinvoiceline.md)  
[Get Purchase Invoice Line](dynamics_purchaseinvoiceline_get.md)  
[Update Purchase Invoice Line](dynamics_purchaseinvoiceline_update.md)  
[Delete Purchase Invoice Line](dynamics_purchaseinvoiceline_delete.md)  