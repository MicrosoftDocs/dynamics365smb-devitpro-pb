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
    "orderNo": "10000",
    "documentType": "Invoice",
    "payToVendorNo": "10000",
    "buyFromVendorNo": "10000",
    "purchaserCode": "JR",
    "quoteNo": "10000",
    "orderDate": "2026-01-12",
    "documentDate": "2026-01-10",
    "dueDate": "2026-02-28",
    "campaignNo": "10000",
    "purchaseLineDocumentType": "Invoice",
    "documentNo": "103001",
    "type": "Item",
    "description": "ATHENS Desk",
    "lineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "outstandingQtyBase": 10.00,
    "outstandingAmountLCY": 1500.00,
    "amount": 1500.00,
    "unitCostLCY": 25.5,
    "outstandingQuantity": 10.00,
    "returnReasonCode": "RETURN",
    "plannedReceiptDate": "2026-01-18",
    "expectedReceiptDate": "2026-01-18",
    "promisedReceiptDate": "2026-01-18",
    "requestedReceiptDate": "2026-01-18",
    "dimensionSetID": 102,
    "qtyRcdNotInvd": 10.00,
    "qtyRcdNotInvdBase": 10.00,
    "qtyToReceive": 10.00,
    "qtyToReceiveBase": 10.00,
    "amtRcdNotInvdExVATLCY": 100.00,
    "amtRcdNotInvd": 100.00,
    "amtRcdNotInvdLCY": 100.00,
    "qtyReceived": 10.00,
    "qtyReceivedBase": 10.00,
    "quantityInvoiced": 10.00,
    "projectNo": "10000",
    "prepmtAmountInvLCY": 1500.00
}
```

## Related information

[purchaseLine](../resources/dynamics_purchaseline.md)
