---
title: Get toBinWarehouseJournalLines
description: Gets a toBinWarehouseJournalLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get toBinWarehouseJournalLines

Retrieve the properties and relationships of a toBinWarehouseJournalLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/toBinWarehouseJournalLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **toBinWarehouseJournalLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/toBinWarehouseJournalLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "toBinCode": "string",
    "itemNo": "string",
    "locationCode": "string",
    "qtyBase": "decimal",
    "lotNo": "string",
    "serialNo": "string",
    "toZoneCode": "string",
    "qtyPerUnitOfMeasure": "decimal",
    "unitOfMeasureCode": "string"
}
```

## Related information

[toBinWarehouseJournalLine](../resources/dynamics_tobinwarehousejournalline.md)
