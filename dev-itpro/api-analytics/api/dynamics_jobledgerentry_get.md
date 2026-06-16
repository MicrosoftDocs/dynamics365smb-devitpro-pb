---
title: Get jobLedgerEntries
description: Gets a jobLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get jobLedgerEntries

Retrieve the properties and relationships of a jobLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/jobLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **jobLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/jobLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "postingDate": "2026-01-15",
    "entryType": "Sale",
    "type": "Item",
    "no": "10000",
    "description": "ATHENS Desk",
    "locationCode": "BLUE",
    "unitOfMeasureCode": "PCS",
    "quantity": 10.00,
    "unitCostLCY": 25.5,
    "totalCostLCY": 25.5,
    "unitPrice": 49.99,
    "totalPriceLCY": 49.99,
    "dimensionSetID": 102,
    "auxiliaryIndex1": 1
}
```

## Related information

[jobLedgerEntry](../resources/dynamics_jobledgerentry.md)
