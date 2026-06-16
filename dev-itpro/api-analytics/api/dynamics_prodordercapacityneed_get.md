---
title: Get prodOrderCapacityNeeds
description: Gets a prodOrderCapacityNeed object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get prodOrderCapacityNeeds

Retrieve the properties and relationships of a prodOrderCapacityNeed object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/prodOrderCapacityNeeds
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **prodOrderCapacityNeed** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/prodOrderCapacityNeeds
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "status": "Released",
    "prodOrderNo": "10000",
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "operationNo": "10000",
    "allocatedTime": 100.00,
    "requestedOnly": false,
    "workCenterNo": "W100",
    "workCenterGroupCode": "W100",
    "date": "2026-01-15",
    "no": "10000",
    "type": "Item",
    "neededTimeMs": 100.00,
    "neededTime": 100.00,
    "lineNo": 10000
}
```

## Related information

[prodOrderCapacityNeed](../resources/dynamics_prodordercapacityneed.md)
