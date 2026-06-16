---
title: Get manufacturingValueEntries
description: Gets a manufacturingValueEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get manufacturingValueEntries

Retrieve the properties and relationships of a manufacturingValueEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/manufacturingValueEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **manufacturingValueEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/manufacturingValueEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryNo": 1001,
    "entryType": "Sale",
    "capacityLedgerEntryNo": 1002,
    "valuationDate": "2026-01-15",
    "itemNo": "1896-S",
    "costAmountActual": 25.5,
    "costAmountExpected": 25.5,
    "expectedCostPostedtoGL": 25.5,
    "costPostedtoGL": 25.5,
    "costPerUnit": 25.5,
    "itemLedgerEntryQuantity": 10.00,
    "valuedQuantity": 10.00,
    "locationCode": "BLUE",
    "itemLedgerEntryType": "Sale",
    "postingDate": "2026-01-15",
    "type": "Item",
    "no": "10000",
    "dimensionSetID": 102,
    "orderType": "",
    "orderNo": "10000",
    "expectedCost": false
}
```

## Related information

[manufacturingValueEntry](../resources/dynamics_manufacturingvalueentry.md)
