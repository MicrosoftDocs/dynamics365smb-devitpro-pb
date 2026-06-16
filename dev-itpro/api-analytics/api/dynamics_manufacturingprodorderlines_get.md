---
title: Get manufacturingProdOrderLines
description: Gets a manufacturingProdOrderLines object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get manufacturingProdOrderLines

Retrieve the properties and relationships of a manufacturingProdOrderLines object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/manufacturingProdOrderLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **manufacturingProdOrderLines** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/manufacturingProdOrderLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "prodOrderStatus": "Released",
    "prodOrderNo": "10000",
    "prodOrderLineNo": 10000,
    "itemNo": "1896-S",
    "locationCode": "BLUE",
    "quantityBase": 10.00,
    "remainingQtyBase": 10.00,
    "dueDate": "2026-02-28",
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "routingType": "",
    "dimensionSetID": 102,
    "finishedQtyBase": 10.00,
    "scrapPrc": 5.00,
    "overheadRate": 1.00,
    "planningLevelCode": 1,
    "indirectCostPercent": 25.5,
    "locationName": "Blue Warehouse"
}
```

## Related information

[manufacturingProdOrderLines](../resources/dynamics_manufacturingprodorderlines.md)
