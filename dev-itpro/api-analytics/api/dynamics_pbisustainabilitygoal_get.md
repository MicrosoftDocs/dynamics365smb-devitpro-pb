---
title: Get pbiSustainabilityGoals
description: Gets a pbiSustainabilityGoal object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get pbiSustainabilityGoals

Retrieve the properties and relationships of a pbiSustainabilityGoal object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/pbiSustainabilityGoals
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **pbiSustainabilityGoal** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/pbiSustainabilityGoals
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "scoreCardNo": "10000",
    "no": "10000",
    "lineNo": 10000,
    "name": "Adatum Corporation",
    "owner": "",
    "countryRegion": "",
    "responsibilityCentre": "",
    "targetValueForCo2": 100.00,
    "targetValueForCh4": 100.00,
    "targetValueForN2O": 100.00,
    "targetValueForWaterIntensity": 100.00,
    "targetValueForWasteIntensity": 100.00,
    "mainGoal": false,
    "startDate": "2026-01-01",
    "endDate": "2026-06-30",
    "baselineStartDate": "2026-01-01",
    "baselineEndDate": "2026-06-30"
}
```

## Related information

[pbiSustainabilityGoal](../resources/dynamics_pbisustainabilitygoal.md)
