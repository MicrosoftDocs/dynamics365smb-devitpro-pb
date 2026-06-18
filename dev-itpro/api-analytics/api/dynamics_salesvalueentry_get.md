---
title: Get salesValueEntries
description: Gets a salesValueEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get salesValueEntries

Retrieve the properties and relationships of a salesValueEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesValueEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesValueEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesValueEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "itemLedgerEntryNo": 1001,
    "itemLedgerEntryType": "Sale",
    "entryNo": 1002,
    "entryType": "Sale",
    "documentNo": "103001",
    "documentType": "Invoice",
    "invoicedQuantity": 10.00,
    "salesAmountActual": 1500.00,
    "costAmountActual": 25.5,
    "costAmountNonInvtbl": 25.5,
    "costPostedToGL": 25.5,
    "customerNo": "10000",
    "postingDate": "2026-01-15",
    "documentDate": "2026-01-10",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "dimensionSetID": 102,
    "salespersonPurchaserCode": "JR",
    "returnReasonCode": "RETURN",
    "projectNo": "10000"
}
```

## Related information

[salesValueEntry](../resources/dynamics_salesvalueentry.md)
