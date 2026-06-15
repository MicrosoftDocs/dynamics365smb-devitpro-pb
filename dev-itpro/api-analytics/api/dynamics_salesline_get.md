---
title: Get salesLines
description: Gets a salesLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "orderNo": "string",
    "documentType": "string",
    "billToCustomerNo": "string",
    "sellToCustomerNo": "string",
    "salespersonCode": "string",
    "opportunityNo": "string",
    "quoteNo": "string",
    "quoteValidUntilDate": "Date",
    "orderDate": "Date",
    "documentDate": "Date",
    "dueDate": "Date",
    "campaignNo": "string",
    "salesLineDocumentType": "string",
    "type": "string",
    "description": "string",
    "documentNo": "string",
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
    "shipmentDate": "Date",
    "plannedShipmentDate": "Date",
    "plannedDeliveryDate": "Date",
    "requestedDeliveryDate": "Date",
    "promisedDeliveryDate": "Date",
    "dimensionSetID": "integer",
    "returnQtyRcdNotInvd": "decimal",
    "returnQtyReceivedBase": "decimal",
    "returnQtyToReceiveBase": "decimal",
    "returnRcdNotInvdLCY": "decimal",
    "quantityShippedBase": "decimal",
    "quantityToShipBase": "decimal",
    "qtyShippedNotInvdBase": "decimal",
    "shippedNotInvoicedLCYNoVAT": "decimal",
    "shippedNotInvoiced": "decimal",
    "quantityInvoiced": "decimal",
    "projectNo": "string",
    "postingDate": "Date"
}
```

## Related information

[salesLine](../resources/dynamics_salesline.md)
