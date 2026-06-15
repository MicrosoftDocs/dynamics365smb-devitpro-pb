---
title: Get purchaseLines
description: Gets a purchaseLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get purchaseLines

Retrieve the properties and relationships of a purchaseLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/purchaseLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **purchaseLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/purchaseLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "orderNo": "string",
    "documentType": "string",
    "payToVendorNo": "string",
    "buyFromVendorNo": "string",
    "purchaserCode": "string",
    "quoteNo": "string",
    "orderDate": "Date",
    "documentDate": "Date",
    "dueDate": "Date",
    "campaignNo": "string",
    "purchaseLineDocumentType": "string",
    "documentNo": "string",
    "type": "string",
    "description": "string",
    "lineNo": "integer",
    "itemNo": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "outstandingQtyBase": "decimal",
    "outstandingAmountLCY": "decimal",
    "amount": "decimal",
    "unitCostLCY": "decimal",
    "outstandingQuantity": "decimal",
    "returnReasonCode": "string",
    "plannedReceiptDate": "Date",
    "expectedReceiptDate": "Date",
    "promisedReceiptDate": "Date",
    "requestedReceiptDate": "Date",
    "dimensionSetID": "integer",
    "qtyRcdNotInvd": "decimal",
    "qtyRcdNotInvdBase": "decimal",
    "qtyToReceive": "decimal",
    "qtyToReceiveBase": "decimal",
    "amtRcdNotInvdExVATLCY": "decimal",
    "amtRcdNotInvd": "decimal",
    "amtRcdNotInvdLCY": "decimal",
    "qtyReceived": "decimal",
    "qtyReceivedBase": "decimal",
    "quantityInvoiced": "decimal",
    "projectNo": "string",
    "prepmtAmountInvLCY": "decimal"
}
```

## Related information

[purchaseLine](../resources/dynamics_purchaseline.md)
