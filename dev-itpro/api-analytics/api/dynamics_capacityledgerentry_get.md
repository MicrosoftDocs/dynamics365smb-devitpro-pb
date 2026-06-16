---
title: Get capacityLedgerEntries
description: Gets a capacityLedgerEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get capacityLedgerEntries

Retrieve the properties and relationships of a capacityLedgerEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/capacityLedgerEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **capacityLedgerEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/capacityLedgerEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryNo": 1001,
    "orderType": "",
    "orderNo": "10000",
    "orderLineNo": 10000,
    "type": "Item",
    "no": "10000",
    "description": "ATHENS Desk",
    "postingDate": "2026-01-15",
    "itemNo": "1896-S",
    "setupTime": 100.00,
    "runTime": 100.00,
    "stopTime": 100.00,
    "quantity": 10.00,
    "outputQuantity": 10.00,
    "scrapQuantity": 10.00,
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "operationNo": "10000",
    "workCenterGroupCode": "W100",
    "scrapCode": "10000",
    "dimensionSetID": 102,
    "workCenterNo": "W100",
    "workShiftCode": "10000",
    "subcontracting": false,
    "qtyPerCapUnitOfMeasure": 10.00,
    "capUnitOfMeasureCode": "PCS",
    "qtyPerUnitOfMeasure": 10.00,
    "directCost": 25.5,
    "overheadCost": 25.5
}
```

## Related information

[capacityLedgerEntry](../resources/dynamics_capacityledgerentry.md)
