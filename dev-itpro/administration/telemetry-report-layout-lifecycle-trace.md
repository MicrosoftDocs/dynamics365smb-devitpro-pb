---
title: Analyzing report layout lifecycle telemetry
description: Learn about report layout lifecycle telemetry in Business Central  
author: jswymer
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/06/2024
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: bap-template
---

# Analyzing report layout lifecycle telemetry

[!INCLUDE[2024_releasewave2.md](../developer/includes/2024rw2_and_later.md)]

This article describes the telemetry gathered for actions taken by users on report layouts. Learn more about the actions users can take on report layouts at [Get started with report layouts](/dynamics365/business-central/ui-get-started-layouts?tabs=copy#get-started).

## Report layout added by user

Occurs when a user adds a new report layout.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Report layout added by user**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alAction|**New**|
|alLayoutFormat|Specifies the layout file type. Possible values: `RDLC` (.rdlc file type), `Word` (.docx file type), `Excel` (.xlsx file type), Custom (custom file type, indicated as **External** in the client UI).|
|alLayoutName |Specifies the name of the report layout.|
|alReportId|Specifies the ID of the report assigned the layout.|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[include-telemetry-dimension-environment-name](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000N0E**|

### Sample KQL code (report layout added)

This KQL code can help you get started analyzing which reports users run:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000N0E' // performance optimization
| where customDimensions.eventId == 'AL0000N0E'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// for which report and layout
, reportId = customDimensions.alReportId // object ID of the report
, layoutName = customDimensions.alLayoutName 
, layoutFormat = customDimensions.alLayoutFormat // possible values: RDLC, Word, Excel, Custom
// what did the user do
, action = customDimensions.alAction // alAction is "New" for this event
// user who performed the action
, user_Id // user telemetry ID
```

## Report layout default changed by user

Occurs when a user changes the default layout used by a report. 

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Report layout default changed by user**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alAction|**SetDefault**|
|alLayoutFormat|Specifies the layout file type. Possible values: `RDLC` (.rdlc file type), `Word` (.docx file type), `Excel` (.xlsx file type), Custom (custom file type, indicated as **External** in the client UI).|
|alLayoutName |Specifies the name of the report layout.|
|alReportId|Specifies the ID of the report assigned the layout.|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[include-telemetry-dimension-environment-name](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000N0D**|

### Sample KQL code (report layout default changed)

This KQL code can help you get started analyzing which reports users run:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000N0D' // performance optimization
| where customDimensions.eventId == 'AL0000N0D'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// for which report and layout
, reportId = customDimensions.alReportId // object ID of the report
, newDefaultLayoutName = customDimensions.alLayoutName 
// NB! alLayoutFormat shows as an integer in the telemetry in versions prior to 25.1
, layoutFormat = customDimensions.alLayoutFormat // possible values: RDLC, Word, Excel, Custom
// what did the user do
, action = customDimensions.alAction // alAction is "SetDefault" for this event
// user who performed the action
, user_Id // user telemetry ID
```

## Report layout properties changed by user

Occurs when a user changes the properties of layout used by a report.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Report layout properties changed by user**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alAction|**Edit**|
|alOldLayoutDescription|Specifies the description of the layout before it was changed.|
|alOldLayoutName|Specifies the name of the layout before it was changed.|
|alNewLayoutDescription|Specifies the new description of the layout.|
|alNewLayoutName|Specifies the new name of the layout.|
|alReportId|Specifies the ID of the report assigned the layout.|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[include-telemetry-dimension-environment-name](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000N0H**|

### Sample KQL code (report layout properties changed)

This KQL code can help you get started analyzing which reports users run:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000N0H' // performance optimization
| where customDimensions.eventId == 'AL0000N0H'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// for which report
, reportId = customDimensions.alReportId // object ID of the report
// what did the user do
, action = customDimensions.alAction // alAction is "Edit" for this event
, oldLayoutDescription = customDimensions.alOldLayoutDescription
, oldLayoutName = customDimensions.alOldLayoutName
, newLayoutDescription = customDimensions.alNewLayoutDescription
, newLayoutName = customDimensions.alNewLayoutName
// user who performed the action
, user_Id // user telemetry ID
```

## Report layout exported by user

Occurs when a user exports a layout used by a report.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Report layout exported by user**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alAction|**Export**|
|alLayoutName |Specifies the name of the report layout.|
|alReportId|Specifies the ID of the report assigned the layout.|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[include-telemetry-dimension-environment-name](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000N0I**|

### Sample KQL code (report layout exported)

This KQL code can help you get started analyzing which reports users run:

```kql
// 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000N0I' // performance optimization
| where customDimensions.eventId == 'AL0000N0I'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// for which report and layout
, reportId = customDimensions.alReportId // object ID of the report
, layoutName = customDimensions.alLayoutName 
// what did the user do
, action = customDimensions.alAction // alAction is "Export" for this event
// user who performed the action
, user_Id // user telemetry ID
```

## Report layout deleted by user

Occurs when a user deletes a report layout.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Report layout exported by user**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alAction|**Delete**|
|alLayoutName |Specifies the name of the report layout.|
|alReportId|Specifies the ID of the report assigned the layout.|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[include-telemetry-dimension-environment-name](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000N0F**|

### Sample KQL code (report layout deleted)

This KQL code can help you get started analyzing which reports users run:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000N0F' // performance optimization
| where customDimensions.eventId == 'AL0000N0F'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// for which report and layout
, reportId = customDimensions.alReportId // object ID of the report
, layoutName = customDimensions.alLayoutName 
// what did the user do
, action = customDimensions.alAction // alAction is "Delete" for this event
// user who performed the action
, user_Id // user telemetry ID
```

## Report layout replaced by user

Occurs when a user replaces a report layout with another layout.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Report layout exported by user**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alAction|**Replace**|
|alLayoutName |Specifies the name of the report layout.|
|alReportId|Specifies the ID of the report assigned the layout.|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[include-telemetry-dimension-environment-name](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000N0G**|

### Sample KQL code (report layout replaced)

This KQL code can help you get started analyzing which reports users run:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000N0G' // performance optimization
| where customDimensions.eventId == 'AL0000N0G'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// for which report and layout
, reportId = customDimensions.alReportId // object ID of the report
, layoutName = customDimensions.alLayoutName 
// what did the user do
, action = customDimensions.alAction // alAction is "Replace" for this event
// user who performed the action
, user_Id // user telemetry ID
```
 
## Related information

[Report performance](../developer/devenv-report-performance.md)  
[Troubleshooting report errors](../developer/devenv-reports-troubleshooting.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  