---
title: Analyzing financial report usage trace telemetry
description: Learn about the telemetry for financial report usage telemetry in Azure Application Insights.  
author: kennieNP
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 03/20/2025
ms.author: kepontop
ms.reviewer: jswymer
---

# Analyzing financial report usage telemetry

[!INCLUDE[introduced_in_2025rw1](../developer/includes/2025rw1_and_later.md)]

Financial report usage telemetry gathers data about the following operations with financial reports:

- Financial report run on-screen
- Financial report run from request page

Learn more about working with financial reporting in [Primary capabilities of financial reporting](/dynamics365/business-central/finance-financial-reporting-capabilities) in the [!INCLUDE[prod_short](../includes/prod_short.md)] Application Help.

## Common dimensions for all financial report usage events

The following table explains custom dimensions that are common to all financial report usage events.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alReportDefinitionCode | Specifies the report definition code for the financial report. |
|alRowDefinitionCode | Specifies the row definition code for the financial report. |
|alColumnDefinitionCode | Specifies the column definition code for the financial report. |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|

## Financial report run on-screen: {report definition code}

Occurs when a user views a financial report from the user interface.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report run on-screen: {report definition code}**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000OKU**|

### Sample KQL code (financial report run on-screen)

This KQL code can help you get started analyzing usage of financial reports.

```kql
// Financial report run on-screen
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000OKU'
| where customDimensions.eventId == 'AL0000OKU'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// report/row/column definitions
, reportDefinitionCode=customDimensions.alReportDefinitionCode
, rowDefinitionCode=customDimensions.alRowDefinitionCode
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user ran the report
, usertelemetryId = user_Id
```

## Financial report run from request page: {report definition code}

Occurs when a user views a financial report from the request page.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Financial report run from request page: {report definition code}**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000O76**|

### Sample KQL code (financial report run from the request page)

This KQL code can help you get started analyzing usage of financial reports (producing a PDF from the request page).

```kql
// Financial report run from request page
traces
| where timestamp > ago(5d) // adjust the time range as needed
| where customDimensions has 'AL0000O76' 
| where customDimensions.eventId == 'AL0000O76' 
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// report definitions
, reportDefinitionCode=customDimensions.alReportDefinitionCode
, rowDefinitionCode=customDimensions.alRowDefinitionCode
, columnDefinitionCode=customDimensions.alColumnDefinitionCode
// which user ran the report
, usertelemetryId = user_Id
```

## Related information

[Primary capabilities of financial reporting](/dynamics365/business-central/finance-financial-reporting-capabilities)  
[Analyzing financial report lifecycle trace telemetry](telemetry-financial-report-lifecycle-trace.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  