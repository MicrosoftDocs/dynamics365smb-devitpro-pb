---
title: Analyzing financial report lifecycle trace telemetry
description: Learn about the telemetry for financial report lifecycle telemetry in Azure Application Insights.  
author: kennieNP
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 03/20/2025
ms.author: kepontop
ms.reviewer: jswymer
---

# Analyzing financial report lifecycle telemetry

[!INCLUDE[introduced_in_2025rw1](../developer/includes/2025rw1_and_later.md)]

Financial report lifecycle telemetry gathers data about the following lifecycle operations to definitions in financial reporting:

- Financial report row definition created
- Financial report row definition modified
- Financial report row definition copied
- Financial report row definition exported
- Financial report row definition imported
- Financial report row definition deleted
- Financial report column definition created
- Financial report column definition modified
- Financial report column definition copied
- Financial report column definition exported
- Financial report column definition imported
- Financial report column definition deleted
- Financial report definition created
- Financial report definition modified
- Financial report definition copied
- Financial report definition exported
- Financial report definition imported
- Financial report definition deleted

Learn more about working with financial reporting in [Primary capabilities of financial reporting](/dynamics365/business-central/finance-financial-reporting-capabilities) of the [!INCLUDE[prod_short](../includes/prod_short.md)] Application Help.

## General dimensions for all financial report lifecycle events

The following table explains general dimensions that are common to all financial report usage events.

|Dimension|Description or value|
|---------|-----|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

## Common dimensions for all financial report lifecycle events

The following table explains custom dimensions that are common to all financial report usage events. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|

## Financial report row definition created: {Row Definition Code}

Occurs when a user creates a new financial report row definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report row definition created: {Row Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alRowDefinitionCode|The code of the row definition that was created.|
|eventId|**AL0000O81**|

### Sample KQL code (financial report row definition created)

This KQL code can help you get started analyzing creation of financial report row definitions.

```kql
// Financial report row definition created: {Row Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O81'
| where customDimensions.eventId == 'AL0000O81'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was created
, rowDefinitionCode=customDimensions.alRowDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial report row definition modified: {Row Definition Code}

Occurs when a user modifies a financial report row definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report row definition modified: {Row Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alRowDefinitionCode|The code of the row definition that was modified.|
|eventId|**AL0000O82**|

### Sample KQL code (row definition modified)

This KQL code can help you get started analyzing modifications to financial report row definitions.

```kql
// Financial report row definition modified: {Row Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O82'
| where customDimensions.eventId == 'AL0000O82'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was modified
, rowDefinitionCode=customDimensions.alRowDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial report row definition copied: {Row Definition Code}

Occurs when a user copies a financial report row definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report row definition copied: {Row Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alSourceRowDefinitionCode|The code of the row definition that was copied.|
|alSourceRowDefinitionCode|The code of the copy of the row definition.|
|eventId|**AL0000OKV**|

### Sample KQL code (row definition copied)

This KQL code can help you get started analyzing copies taken on financial report row definitions.

```kql
// Financial report row definition copied: {Row Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000OKV'
| where customDimensions.eventId == 'AL0000OKV'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was copied
, sourceRowDefinitionCode = customDimensions.alSourceRowDefinitionCode
, newRowDefinitionCode = customDimensions.alSourceRowDefinitionCode
// which user did it
, usertelemetryId = user_Id
```


## Financial report row definition imported: {Row Definition Code}

Occurs when a user imports a financial report row definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report row definition imported: {Row Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alRowDefinitionCode|The code of the row definition that was imported.|
|eventId|**AL0000ONP**|

### Sample KQL code (row definition imported)

This KQL code can help you get started analyzing import actions for financial report row definitions.

```kql
// Financial report row definition imported: {Row Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000ONP' // event id collision
| where customDimensions.eventId == 'AL0000ONP' // event id collision
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was imported
, rowDefinitionCode=customDimensions.alRowDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial report row definition exported: {Row Definition Code}

Occurs when a user exports a financial report row definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report row definition exported: {Row Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alRowDefinitionCode|The code of the row definition that was exported.|
|eventId|**AL0000ONP**|

### Sample KQL code (row definition exported)

This KQL code can help you get started analyzing export actions for financial report row definitions.

```kql
// Financial report row definition exported: {Row Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000ONP' // event id collision
| where customDimensions.eventId == 'AL0000ONP' // event id collision
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was exported
, rowDefinitionCode=customDimensions.alRowDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial report row definition deleted: {Row Definition Code}

Occurs when a user deletes a financial report row definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report row definition deleted: {Row Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alRowDefinitionCode|The code of the row definition that was deleted.|
|eventId|**AL0000O84**|

### Sample KQL code (row definition deleted)

This KQL code can help you get started analyzing deletions of financial report row definitions.

```kql
// Financial report row definition deleted: {Row Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O84'
| where customDimensions.eventId == 'AL0000O84'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was deleted
, rowDefinitionCode=customDimensions.alRowDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Column Definition created: {Column Definition Code}

Occurs when a user creates a new financial report column definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Column Definition created: {Column Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alColumnDefinitionCode|The financial report column definition that was created.|
|eventId|**AL0000O85**|

### Sample KQL code (column definition created)

This KQL code can help you get started analyzing creation of financial report column definitions.

```kql
// Financial Report Column Definition created: {Column Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O85'
| where customDimensions.eventId == 'AL0000O85'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was created
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Column Definition modified: {Column Definition Code}

Occurs when a user modifies a financial report column definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Column Definition modified: {Column Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alColumnDefinitionCode|The financial report column definition that was modified.|
|eventId|**AL0000O86**|

### Sample KQL code (column definition modified)

This KQL code can help you get started analyzing modifications to financial report column definitions.

```kql
// Financial Report Column Definition modified: {Column Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O86'
| where customDimensions.eventId == 'AL0000O86'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was modified
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Column Definition copied: {Column Definition Code}

Occurs when a user copies a financial report column definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Column Definition copied: {Column Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alSourceColDefinitionCode|The financial report column definition that was copied.|
|alNewColDefinitionCode|The financial report column definition of the copy.|
|eventId|**AL0000OKW**|

### Sample KQL code (column definition copied)

This KQL code can help you get started analyzing copies taken on financial report column definitions.

```kql
// Financial Report Column Definition copied: {Column Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000OKW'
| where customDimensions.eventId == 'AL0000OKW'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was copied
, sourceColDefinitionCode = customDimensions.alSourceColDefinitionCode
, newColDefinitionCode = customDimensions.alNewColDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Column Definition imported: {Column Definition Code}

Occurs when a user imports a financial report column definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Column Definition imported: {Column Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alColumnDefinitionCode|The financial report column definition that was imported.|
|eventId|**AL0000ONQ**|

### Sample KQL code (column definition imported)

This KQL code can help you get started analyzing import actions of financial report column definitions.

```kql
// Financial Report Column Definition imported: {Column Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000ONQ' // event id collision
| where customDimensions.eventId == 'AL0000ONQ' // event id collision
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was imported
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Column Definition exported: {Column Definition Code}

Occurs when a user exports a financial report column definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Column Definition exported: {Column Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alColumnDefinitionCode|The financial report column definition that was exported.|
|eventId|**AL0000ONQ**|

### Sample KQL code (column definition exported)

This KQL code can help you get started analyzing exports of financial report column definitions.

```kql
// Financial Report Column Definition exported: {Column Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000ONQ' // event id collision
| where customDimensions.eventId == 'AL0000ONQ' // event id collision
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was exported
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Column Definition deleted: {Column Definition Code}

Occurs when a user deletes a financial report column definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Column Definition deleted: {Column Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alColumnDefinitionCode|The financial report column definition that was deleted.|
|eventId|**AL0000O88**|

### Sample KQL code (column definition deleted)

This KQL code can help you get started analyzing deletions of financial report column definitions.

```kql
// Financial Report Column Definition deleted: {Column Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O88'
| where customDimensions.eventId == 'AL0000O88'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was deleted
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Definition created: {Report Definition Code}

Occurs when a user creates a new financial report definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Definition created: {Report Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alReportDefinitionCode|The code for the financial report definition that was created.|
|eventId|**AL0000O77**|

### Sample KQL code (financial report definition created)

This KQL code can help you get started analyzing creation of financial report definitions.

```kql
// Financial Report Definition created: {Report Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O77'
| where customDimensions.eventId == 'AL0000O77'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was created
, reportDefinitionCode=customDimensions.alReportDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Definition copied: {Report Definition Code}

Occurs when a user takes a copy of a financial report definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Definition copied: {Report Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alSourceReportDefinitionCode|The code for the financial report definition that was copied. |
|alNewReportDefinitionCode|The code for the copy of the financial report definition. |
|eventId|**AL0000OKX**|

### Sample KQL code (financial report definition copied)

This KQL code can help you get started analyzing financial report definitions being copied.

```kql
// Financial Report Definition copied: {Report Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000OKX'
| where customDimensions.eventId == 'AL0000OKX'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was copied
, sourceReportDefinitionCode = customDimensions.alSourceReportDefinitionCode
, newReportDefinitionCode = customDimensions.alNewReportDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Definition imported: {Report Definition Code}

Occurs when a user imports a financial report report definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Definition imported: {Report Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alReportDefinitionCode|The code for the financial report definition that was imported.|
|eventId|**AL0000ONR**|

### Sample KQL code (financial report definition imported)

This KQL code can help you get started analyzing imports of financial report definitions.

```kql
// Financial Report Definition imported: {Report Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000ONR' // event id collision
| where customDimensions.eventId == 'AL0000ONR' // event id collision
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was imported
, reportDefinitionCode=customDimensions.alReportDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Definition exported: {Report Definition Code}

Occurs when a user exports a financial report report definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Definition exported: {Report Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alReportDefinitionCode|The financial report definition that was exported.|
|eventId|**AL0000ONR**|

### Sample KQL code (financial report definition exported)

This KQL code can help you get started analyzing export actions of financial report definitions.

```kql
// Financial Report Definition exported: {Report Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000ONR' // event id collision
| where customDimensions.eventId == 'AL0000ONR' // event id collision
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was exported
, reportDefinitionCode=customDimensions.alReportDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Definition modified: {Report Definition Code}

Occurs when a user modifies a financial report report definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Definition modified: {Report Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alReportDefinitionCode|The financial report definition that was modified.|
|eventId|**AL0000O78**|

### Sample KQL code (financial report definition modified)

This KQL code can help you get started analyzing modifications of financial report definitions.

```kql
// Financial Report Definition modified: {Report Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O78'
| where customDimensions.eventId == 'AL0000O78'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was modified
, reportDefinitionCode=customDimensions.alReportDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Financial Report Definition deleted: {Report Definition Code}

Occurs when a user deletes a financial report report definition.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial Report Definition deleted: {Report Definition Code}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alReportDefinitionCode|The financial report definition that was deleted.|
|eventId|**AL0000O80**|

### Sample KQL code (financial report definition deleted)

This KQL code can help you get started analyzing deletions of financial report definitions.

```kql
// Financial Report Definition deleted: {Report Definition Code}
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O80'
| where customDimensions.eventId == 'AL0000O80'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// which definition was deleted
, reportDefinitionCode=customDimensions.alReportDefinitionCode
// which user did it
, usertelemetryId = user_Id
```

## Related information

[Design your own financial reports](/dynamics365/business-central/bi-design-financial-reports)  
[Row definitions in financial reporting](/dynamics365/business-central/bi-row-definitions)  
[Column definitions in financial reporting](/dynamics365/business-central/bi-column-definitions)  
[Primary capabilities of financial reporting](/dynamics365/business-central/finance-financial-reporting-capabilities)  
[Analyzing financial report usage trace telemetry](telemetry-financial-report-usage-trace.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  