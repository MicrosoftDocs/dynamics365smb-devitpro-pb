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
    "entryNo": "integer",
    "orderType": "string",
    "orderNo": "string",
    "orderLineNo": "integer",
    "type": "string",
    "no": "string",
    "description": "string",
    "postingDate": "Date",
    "itemNo": "string",
    "setupTime": "decimal",
    "runTime": "decimal",
    "stopTime": "decimal",
    "quantity": "decimal",
    "outputQuantity": "decimal",
    "scrapQuantity": "decimal",
    "routingNo": "string",
    "routingReferenceNo": "integer",
    "operationNo": "string",
    "workCenterGroupCode": "string",
    "scrapCode": "string",
    "dimensionSetID": "integer",
    "workCenterNo": "string",
    "workShiftCode": "string",
    "subcontracting": "boolean",
    "qtyPerCapUnitOfMeasure": "decimal",
    "capUnitOfMeasureCode": "string",
    "qtyPerUnitOfMeasure": "decimal",
    "directCost": "decimal",
    "overheadCost": "decimal"
}
```

## Related information

[capacityLedgerEntry](../resources/dynamics_capacityledgerentry.md)
