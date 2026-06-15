---
title: Get pbiSustainabilityGoals
description: Gets a pbiSustainabilityGoal object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
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
    "scoreCardNo": "string",
    "no": "string",
    "lineNo": "integer",
    "name": "string",
    "owner": "string",
    "countryRegion": "string",
    "responsibilityCentre": "string",
    "targetValueForCo2": "decimal",
    "targetValueForCh4": "decimal",
    "targetValueForN2O": "decimal",
    "targetValueForWaterIntensity": "decimal",
    "targetValueForWasteIntensity": "decimal",
    "mainGoal": "boolean",
    "startDate": "Date",
    "endDate": "Date",
    "baselineStartDate": "Date",
    "baselineEndDate": "Date"
}
```

## Related information

[pbiSustainabilityGoal](../resources/dynamics_pbisustainabilitygoal.md)
