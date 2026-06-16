---
title: dateSetup resource type
description: Represents a dateSetup entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# dateSetup resource type

Represents a date setup in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET dateSetup](../api/dynamics_datesetup_get.md)|dateSetup|Gets a dateSetup object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|entryNo|string|The primary key of the dateSetup.|
|id|GUID|The unique ID of the dateSetup. Non-editable.|
|fiscalCalendarFirstMonth|integer|Specifies the fiscalCalendarFirstMonth of the dateSetup.|
|firstDayOfWeek|string|Specifies the firstDayOfWeek of the dateSetup.|
|isoCountryHolidays|string|Specifies the isoCountryHolidays of the dateSetup.|
|weeklyType|string|Specifies the weeklyType of the dateSetup.|
|quarterWeekType|string|Specifies the quarterWeekType of the dateSetup.|
|calendarRange|string|Specifies the calendarRange of the dateSetup.|
|calendarPrefix|string|Specifies the calendarPrefix of the dateSetup.|
|fiscalGregorianPrefix|string|Specifies the fiscalGregorianPrefix of the dateSetup.|
|fiscalWeeklyPrefix|string|Specifies the fiscalWeeklyPrefix of the dateSetup.|
|useCustomFisclPeriods|boolean|Specifies the useCustomFisclPeriods of the dateSetup.|
|ignoreWeeklyPeriods|boolean|Specifies the ignoreWeeklyPeriods of the dateSetup.|
|timeZone|string|Specifies the timeZone of the dateSetup.|
|timeZoneDisplayName|string|Specifies the timeZoneDisplayName of the dateSetup.|
|dateTblStart|Date|Specifies the dateTblStart of the dateSetup.|
|dateTblEnd|Date|Specifies the dateTblEnd of the dateSetup.|
|tenantID|string|Specifies the tenantID of the dateSetup.|

## JSON representation

Here's a JSON representation of the dateSetup resource.

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

[GET dateSetup](../api/dynamics_datesetup_get.md)
