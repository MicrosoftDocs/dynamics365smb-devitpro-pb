---
title: Get salesInvoiceLines
description: Gets a salesInvoiceLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get salesInvoiceLines

Retrieve the properties and relationships of a salesInvoiceLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesInvoiceLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesInvoiceLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesInvoiceLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "postingDate": "2026-01-15",
    "type": "Item",
    "description": "ATHENS Desk",
    "documentNo": "103001",
    "lineNo": 10000,
    "no": "10000",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "amount": 1500.00,
    "unitCostLCY": 25.5,
    "returnReasonCode": "RETURN",
    "shipmentDate": "2026-01-20",
    "dimensionSetID": 102,
    "projectNo": "10000",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000",
    "salesInvoiceDocumentNo": "103001",
    "campaignNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "quoteNo": "10000"
}
```

## Related information

[salesInvoiceLine](../resources/dynamics_salesinvoiceline.md)
