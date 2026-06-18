---
title: Get salesInvoiceProjectLedgerEntries
description: Gets a salesInvoiceProjectLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get salesInvoiceProjectLedgerEntries

Retrieve the properties and relationships of a salesInvoiceProjectLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesInvoiceProjectLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesInvoiceProjectLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesInvoiceProjectLedgerEntries
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
    "entryNo": 1001,
    "no": "10000",
    "documentNo": "103001",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "totalPriceLCY": 49.99,
    "totalCostLCY": 25.5,
    "unitCostLCY": 25.5,
    "reasonCode": "RETURN",
    "dimensionSetID": 102,
    "projectNo": "10000",
    "salesInvoiceDocumentNo": "103001",
    "campaignNo": "10000",
    "salespersonCode": "JR",
    "opportunityNo": "10000",
    "quoteNo": "10000",
    "billToCustomerNo": "10000",
    "sellToCustomerNo": "10000"
}
```

## Related information

[salesInvoiceProjectLedgerEntry](../resources/dynamics_salesinvoiceprojectledgerentry.md)
