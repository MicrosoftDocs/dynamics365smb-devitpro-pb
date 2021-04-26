---
title: Create salesInvoiceLines  
description: Creates a sales invoice line object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create salesInvoiceLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales invoice line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesInvoices({id})/salesInvoiceLines
POST businesscentralPrefix/companies({id})/salesInvoices({id})/salesInvoiceLines({salesInvoiceLineId})
```

## Request headers

|Header        |Value                      |
|--------------|---------------------------|
|Authorization |Bearer {token}. Required.  |
|Content-Type  |application/json           |

## Request body
In the request body, supply a JSON representation of a **salesInvoiceLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesInvoiceLines** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices({id})/salesInvoiceLines
Content-type: application/json

{
"id": "238cb9c0-44e3-ea11-bb43-000d3a2feca1",
"documentId": "9e0f5c9c-44e3-ea11-bb43-000d3a2feca1",
"sequence": 10000,
"itemId": "02a6738a-44e3-ea11-bb43-000d3a2feca1",
"accountId": "00000000-0000-0000-0000-000000000000",
"lineType": "Item",
"lineObjectNumber": "1928-S",
"description": "AMSTERDAM Lamp",
"unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
"unitOfMeasureCode": "PCS",
"unitPrice": 54.9,
"quantity": 3,
"discountAmount": 0,
"discountPercent": 0,
"discountAppliedBeforeTax": false,
"amountExcludingTax": 164.7,
"taxCode": "FURNITURE",
"taxPercent": 5,
"totalTaxAmount": 8.24,
"amountIncludingTax": 172.94,
"invoiceDiscountAllocation": 0,
"netAmount": 164.7,
"netTaxAmount": 8.24,
"netAmountIncludingTax": 172.94,
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
    "id": "238cb9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "9e0f5c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "02a6738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1928-S",
    "description": "AMSTERDAM Lamp",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitPrice": 54.9,
    "quantity": 3,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 164.7,
    "taxCode": "FURNITURE",
    "taxPercent": 5,
    "totalTaxAmount": 8.24,
    "amountIncludingTax": 172.94,
    "invoiceDiscountAllocation": 0,
    "netAmount": 164.7,
    "netTaxAmount": 8.24,
    "netAmountIncludingTax": 172.94,
    "shipmentDate": "2020-08-21",
"itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Invoice Line](../resources/dynamics_salesinvoiceline.md)  
[Get Sales Invoice Line](dynamics_salesinvoiceline_get.md)  
[Update Sales Invoice Line](dynamics_salesinvoiceline_update.md)  
[Delete Sales Invoice Line](dynamics_salesinvoiceline_delete.md)  