---
title: Get dateSetups
description: Gets a dateSetup object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get dateSetups

Retrieve the properties and relationships of a dateSetup object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/dateSetups
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **dateSetup** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/dateSetups
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "entryNo": "10000",
    "id": "",
    "fiscalCalendarFirstMonth": 1,
    "firstDayOfWeek": "",
    "isoCountryHolidays": "",
    "weeklyType": "",
    "quarterWeekType": "",
    "calendarRange": "",
    "calendarPrefix": "",
    "fiscalGregorianPrefix": "",
    "fiscalWeeklyPrefix": "",
    "useCustomFisclPeriods": false,
    "ignoreWeeklyPeriods": false,
    "timeZone": "",
    "timeZoneDisplayName": "Adatum Corporation",
    "dateTblStart": "2026-01-01",
    "dateTblEnd": "2026-06-30",
    "tenantID": ""
}
```

## Related information

[dateSetup](../resources/dynamics_datesetup.md)
