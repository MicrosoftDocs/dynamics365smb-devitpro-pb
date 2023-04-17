---
title: Create salesCreditMemos  
description: Creates a sales credit memo object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Create salesCreditMemos

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales credit memo object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesCreditMemos
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **salesCreditMemo**, the **salesCreditMemo** will not be updated. |

## Request body
In the request body, supply a JSON representation of a **salesCreditMemos** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesCreditMemos** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesCreditMemos
Content-type: application/json

{
  "creditMemoDate": "2022-12-27",
  "customerNumber": "10000",
  "currencyCode": "GBP",
  "paymentTermsId": "a0a51911-e48a-ed11-af3b-cf75db0ab305"
}
```

**Response**

Here is an example of a response.

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "1e8cb9c0-44e3-ea11-bb43-000d3a2feca1",
  "documentId": "960f5c9c-44e3-ea11-bb43-000d3a2feca1",
  "sequence": 10000,
  "itemId": "0ea6738a-44e3-ea11-bb43-000d3a2feca1",
  "accountId": "00000000-0000-0000-0000-000000000000",
  "lineType": "Item",
  "lineObjectNumber": "1996-S",
  "description": "ATLANTA Whiteboard, base",
  "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
  "unitOfMeasureCode": "PCS",
  "quantity": 12,
  "unitPrice": 1397.3,
  "discountAmount": 0,
  "discountPercent": 0,
  "discountAppliedBeforeTax": false,
  "amountExcludingTax": 16767.6,
  "taxCode": "FURNITURE",
  "taxPercent": 6.00002,
  "totalTaxAmount": 1006.06,
  "amountIncludingTax": 17773.66,
  "invoiceDiscountAllocation": 0,
  "netAmount": 16767.6,
  "netTaxAmount": 1006.06,
  "netAmountIncludingTax": 17773.66,
  "shipmentDate": "2020-04-02",
  "shippedQuantity": 0,
  "invoicedQuantity": 0,
  "invoiceQuantity": 12,
  "shipQuantity": 12,
  "itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Credit Memo](../resources/dynamics_salescreditmemo.md)  
[Get Sales Credit Memo](dynamics_salescreditmemo_get.md)  
[Update Sales Credit Memo](dynamics_salescreditmemo_update.md)  
[Delete Sales Credit Memo](dynamics_salescreditmemo_delete.md)  
