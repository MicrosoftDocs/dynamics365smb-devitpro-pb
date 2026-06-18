---
title: Get prodOrderRoutingLines
description: Gets a prodOrderRoutingLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get prodOrderRoutingLines

Retrieve the properties and relationships of a prodOrderRoutingLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/prodOrderRoutingLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **prodOrderRoutingLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/prodOrderRoutingLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "routingStatus": "Released",
    "status": "Released",
    "prodOrderNo": "10000",
    "type": "Item",
    "no": "10000",
    "description": "ATHENS Desk",
    "locationCode": "BLUE",
    "expectedCapacityNeed": 100.00,
    "expectedOperationCostAmt": 25.5,
    "expectedCapacityOvhdCost": 25.5,
    "endingDate": "2026-06-30",
    "routingNo": "R-1000",
    "routingReferenceNo": 1,
    "operationNo": "10000",
    "workCenterNo": "W100",
    "workCenterGroupCode": "W100",
    "routingLinkCode": "10000",
    "setupTime": 100.00,
    "runTime": 100.00,
    "waitTime": 100.00,
    "moveTime": 100.00,
    "startingDateTime": "",
    "endingDateTime": "",
    "locationName": "Blue Warehouse"
}
```

## Related information

[prodOrderRoutingLine](../resources/dynamics_prodorderroutingline.md)
