---
title: Get warehouseEntries
description: Gets a warehouseEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get warehouseEntries

Retrieve the properties and relationships of a warehouseEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/warehouseEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **warehouseEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/warehouseEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "lotNo": "10000",
    "serialNo": "10000",
    "zoneCode": "PICK",
    "binCode": "B-01-0001",
    "qtyBase": 10.00,
    "qtyPerUnitOfMeasure": 10.00,
    "unitOfMeasureCode": "PCS"
}
```

## Related information

[warehouseEntry](../resources/dynamics_warehouseentry.md)
