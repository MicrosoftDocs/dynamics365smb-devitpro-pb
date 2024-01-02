---
title: Feature management telemetry
description: Learn about the telemetry that is emitted from the Feature Management page in Business Central.
author: kennienp
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, data, sensitive
ms.date: 12/22/2023
ms.author: kepontop
ms.reviewer: jsywmer
---

# Feature management telemetry

**INTRODUCED IN:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1, version 22.0.

When new capabilities are added to [!INCLUDE [prod_short](../includes/prod_short.md)] in major updates and minor updates, they might come with the ability to be enabled ahead of time on sandbox and production environments. Enabling a feature is done by administrators using the **Feature Management** page. Each of these changes is logged to telemetry.

## Feature switch has been flipped

Occurs when a user changes the state of a feature on the Feature Management page.

### General dimensions

|Field|Description or value|
|---------|-----|
|message|**Feature switch has been flipped**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alFeatureDescription|Specifies the description of the feature. |
|alFeatureId|Specifies the name of the feature. |
|alStatus|Specifies the new state of the feature, such as **enabled** or **disabled**. |
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000JT3** |

### Sample KQL code
This KQL code can help you get started analyzing feature management telemetry or if you want to alert on these changes

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000JT3'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, featureId = customDimensions.alFeatureId // feature name
, featureDescription = customDimensions.alFeatureDescription // feature description
, status = customDimensions.alStatus // enabled/disabled
, usertelemetryId = user_Id // who did it
```

## See also

[Telemetry Overview](telemetry-overview.md)  
[Enable Telemetry in Business Central](telemetry-enable-application-insights.md)  
[Feature Telemetry sample code](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/AL/FeatureTelemetry)  
[System Application Overview](../developer/devenv-system-application-overview.md)  
[Feature Telemetry System Application Documentation](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Telemetry)  
[Feature Telemetry Codeunit Reference Documentation](/dynamics365/business-central/application/reference/system%20application/codeunit/system.telemetry.feature-telemetry)  
[Enabling new features ahead of time](feature-management.md)  