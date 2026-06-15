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
    "status": "string",
    "prodOrderNo": "string",
    "routingNo": "string",
    "routingReferenceNo": "integer",
    "operationNo": "string",
    "allocatedTime": "decimal",
    "requestedOnly": "boolean",
    "workCenterNo": "string",
    "workCenterGroupCode": "string",
    "date": "Date",
    "no": "string",
    "type": "string",
    "neededTimeMs": "decimal",
    "neededTime": "decimal",
    "lineNo": "integer"
}
```

## Related information

[prodOrderCapacityNeed](../resources/dynamics_prodordercapacityneed.md)
