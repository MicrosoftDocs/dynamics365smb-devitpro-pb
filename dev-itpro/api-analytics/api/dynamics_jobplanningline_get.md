---
title: Get jobPlanningLines
description: Gets a jobPlanningLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get jobPlanningLines

Retrieve the properties and relationships of a jobPlanningLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/jobPlanningLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **jobPlanningLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/jobPlanningLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "jobNo": "J00010",
    "jobTaskNo": "1000",
    "lineNo": 10000,
    "jobType": "",
    "lineType": "",
    "no": "10000",
    "description": "ATHENS Desk",
    "quantity": 10.00,
    "unitCostLCY": 25.5,
    "totalCostLCY": 25.5,
    "unitPriceLCY": 49.99,
    "lineAmountLCY": 1500.00,
    "totalPriceLCY": 49.99,
    "planningDate": "2026-01-15"
}
```

## Related information

[jobPlanningLine](../resources/dynamics_jobplanningline.md)
