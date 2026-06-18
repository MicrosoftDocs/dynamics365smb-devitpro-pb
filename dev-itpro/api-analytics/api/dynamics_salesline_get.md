---
title: Get salesLines
description: Gets a salesLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get salesLines

Retrieve the properties and relationships of a salesLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "orderNo": "10000",
    "documentType": "Invoice",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "quoteNo": "10000",
    "quoteValidUntilDate": "2026-01-15",
    "orderDate": "2026-01-12",
    "documentDate": "2026-01-10",
    "dueDate": "2026-02-28",
    "campaignNo": "10000",
    "salesLineDocumentType": "Invoice",
    "type": "Item",
    "description": "ATHENS Desk",
    "documentNo": "103001",
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
    "shipmentDate": "2026-01-20",
    "plannedShipmentDate": "2026-01-20",
    "plannedDeliveryDate": "2026-01-15",
    "requestedDeliveryDate": "2026-01-15",
    "promisedDeliveryDate": "2026-01-15",
    "dimensionSetID": 102,
    "returnQtyRcdNotInvd": 10.00,
    "returnQtyReceivedBase": 10.00,
    "returnQtyToReceiveBase": 10.00,
    "returnRcdNotInvdLCY": 100.00,
    "quantityShippedBase": 10.00,
    "quantityToShipBase": 10.00,
    "qtyShippedNotInvdBase": 10.00,
    "shippedNotInvoicedLCYNoVAT": 100.00,
    "shippedNotInvoiced": 100.00,
    "quantityInvoiced": 10.00,
    "projectNo": "10000",
    "postingDate": "2026-01-15"
}
```

## Related information

[salesLine](../resources/dynamics_salesline.md)
