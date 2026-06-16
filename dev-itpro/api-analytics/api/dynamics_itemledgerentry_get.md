---
title: Get itemLedgerEntries
description: Gets a itemLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get itemLedgerEntries

Retrieve the properties and relationships of a itemLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/itemLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **itemLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/itemLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryNo": 1001,
    "entryType": "Sale",
    "sourceType": "Customer",
    "sourceNo": "10000",
    "documentNo": "103001",
    "documentType": "Invoice",
    "postingDate": "2026-01-15",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "serialNo": "10000",
    "expirationDate": "2026-01-15",
    "lotNo": "10000",
    "quantity": 10.00,
    "unitOfMeasureCode": "PCS",
    "remainingQuantity": 10.00,
    "dimensionSetID": 102,
    "open": true,
    "positive": false,
    "invoicedQuantity": 10.00,
    "qtyPerUnitOfMeasure": 10.00,
    "costAmountActual": 25.5,
    "salesAmountActual": 1500.00
}
```

## Related information

[itemLedgerEntry](../resources/dynamics_itemledgerentry.md)
