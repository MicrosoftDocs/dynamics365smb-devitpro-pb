---
title: Get fromBinWarehouseJournalLines
description: Gets a fromBinWarehouseJournalLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get fromBinWarehouseJournalLines

Retrieve the properties and relationships of a fromBinWarehouseJournalLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/fromBinWarehouseJournalLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **fromBinWarehouseJournalLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/fromBinWarehouseJournalLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "fromBinCode": "B-01-0001",
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "qtyBase": 10.00,
    "lotNo": "10000",
    "serialNo": "10000",
    "fromZoneCode": "PICK",
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[fromBinWarehouseJournalLine](../resources/dynamics_frombinwarehousejournalline.md)
