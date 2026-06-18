---
title: Get opportunityEntries
description: Gets a opportunityEntry object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get opportunityEntries

Retrieve the properties and relationships of a opportunityEntry object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/opportunityEntries
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **opportunityEntry** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/opportunityEntries
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "opportunityEntryEntryNo": 1001,
    "opportunityEntryOpportunity": "",
    "salespersonCode": "JR",
    "opportunityEntryActive": true,
    "opportunityEntryActionTaken": "",
    "opportunityEntryDateChange": "2026-01-15",
    "opportunityEntryEstCloseDate": "2025-12-31",
    "opportunityEntryEstValue": 100.00,
    "opportunityEntryCalcCurrentValue": 100.00,
    "opportunityEntryCompleted": 100.00,
    "opportunityEntryChanceSuccess": 100.00,
    "opportunityEntryProbability": 100.00,
    "opportunityEntrySalesCycleCode": "10000",
    "opportunityEntrySalesCycleStage": 1,
    "opportunityEntrySalesCycleStageDescription": "1",
    "opportunityEntryCloseOpportunityCode": "10000",
    "opportunityContactNo": "10000"
}
```

## Related information

[opportunityEntry](../resources/dynamics_opportunityentry.md)
