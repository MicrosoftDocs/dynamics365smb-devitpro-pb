---
title: Localizing the report data formatting and caption strings
description: "Localizing report output with respect to captions and data format"
author: nhsejth
ms.custom: na
ms.date: 01/04/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: nhsejth
---

# Localizing the report data formatting and caption strings

You can localize captions and formatting in a report object in the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to match the expectations of the recepient.

The following report properties are used to define strings with dependencies to language and region:

- [Report.Language](./methods-auto/report/reportinstance-language-method.md): Selects the application language to use for application captions, options, enums, and strings in Date/DateTime/Time strings. This value determines the localizations that are used for formatting period names like day name, month name and so forth.
- [Report.FormatRegion](./methods-auto/report/reportinstance-formatregion-method.md): Defines the regional format to apply to any format operation on Date/DateTime/Time and decimal values.

These values can be set from code, from the **Report Limit and Settings** page, or from the requestpage and will revert to the default values for the current session as defined in the users mySettings page.

## Setting the values

The FormatRegion and Language values can be set in a number of ways

| Where | Who | Language | FormatRegion | Sample | Notes |
|---|---|:---:|:---:|---|---|
| Object definition | Developer | NA | x |  `FormatRegion = 'en-US';` | Used as default format region for this report instead for the users standard regional setup. |
| Report Limits and Settings Page | Tenant/Company Admin | x | x|| Provides tenant and company default values that will override defaults set by user setup or object definition. |
| Report Trigger code | Developer| x | x| `currReport.Language := 1033;` <br> `currReport.FormatRegion := 'en-US';` |
| Instance | Developer | x | x | `myReportInstance.Language := 1033;` <br> `myReportInstance.FormatRegion := 'en-US'` |
| Request Page (Advanced group) | User | x | x|| Values will override settings from **Report Limits and Setting** page and instance. | 

If none of these settings have been applied, the report will be formatted according to the users current language and region setup.

## Remarks

- In RLDC-based reports, the `FormatRegion` settings will determine the formatting that takes place on RDLC system properties using date/time and decimal data types, and columns where the data set definition doesn't use AL format functions to convert values to strings. The system format methods in the RDLC engine can't use the application language settings and all period names will be printed using the `FormatRegion` settings.
- The `Language` field on the **Report Limits and settings** page and on the request page is filtered to the languages currently supported by the tenant. The `FormatRegion` field supports all available languages.

## See Also

[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
[CultureInfo.Name Property](dotnet/api/system.globalization.cultureinfo.name)
