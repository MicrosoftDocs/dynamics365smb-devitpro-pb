---
title: Analyze app resource exposure policy telemetry
description: Learn about app resource exposure policy telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/01/2026
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
---

# Analyze app resource exposure policy telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2024 release wave 2 and later

App resource exposure policy telemetry gathers data about failures when parsing or applying resource exposure policy overrides defined in extensions. Resource exposure policies control which resources (pages, codeunits, tables, and so on) in an extension that other extensions can access.

## <a name="RT0022"></a>App resource exposure policy overrides parse failed

Occurs when [!INCLUDE[prod_short](../includes/prod_short.md)] fails to parse the resource exposure policy overrides defined in an extension.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App secret initialization failed**|
|severityLevel|**3** (Error)|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0022**|
|failureReason| Specifies the reason why parsing the resource exposure policy overrides failed.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0022'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, failureReason = customDimensions.failureReason
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Resource Exposure Policy](../developer/devenv-security-settings-and-ip-protection.md)  
