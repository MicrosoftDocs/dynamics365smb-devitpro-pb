---
title: Analyze API metadata validation telemetry
description: Learn about the API metadata validation telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/01/2026
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Analyze API metadata validation telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2024 release wave 2 and later

API metadata validation telemetry gathers data about errors that occur when [!INCLUDE[prod_short](../includes/prod_short.md)] validates API page metadata during API generation. These errors help identify configuration issues with API pages that prevent them from being exposed correctly.

## <a name="RT0048"></a>API metadata conflicting API path

Occurs when two or more API pages attempt to use the same API path, creating a conflict.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Web service conflicting API path: {path} for group {groupId}, object type {objectType}, object ID {objectId}, package ID {packageId}**|
|severityLevel|**3** (Error)|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0048**|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0048'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
```

## <a name="RT00049"></a>API metadata circular API pages

Occurs when API pages have circular references through navigation properties, creating an infinite loop in the metadata hierarchy.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Web service metadata circular API pages**|
|severityLevel|**3** (Error)|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT00049**|
|pagesHierarchy| Specifies the hierarchy of pages that caused the circular reference.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT00049'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, pagesHierarchy = customDimensions.pagesHierarchy
```

## <a name="RT0050"></a>API metadata invalid root entity

Occurs when an API page defines an invalid root entity.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Web service metadata invalid root entity**|
|severityLevel|**3** (Error)|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0050**|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0050'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
```

## <a name="RT0051"></a>API metadata conflicting navigation property

Occurs when an API page has conflicting navigation properties with the same name but different targets.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Web service metadata conflicting navigation property**|
|severityLevel|**3** (Error)|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0051**|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0051'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[API Page Type](../developer/devenv-api-pagetype.md)  
