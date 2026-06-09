---
title:  Analyzing AI Consumption Trace Telemetry 
description: Learn about the AI Consumption telemetry in Business Central.
author: jobulsin
ms.author: jobulsin
ms.reviewer: 
ms.topic: concept-article
ms.date: 04/23/2026
ms.custom: bap-template
---
# Analyzing AI consumption trace telemetry

[!INCLUDE[online_only](../developer/includes/online_only.md)]

Environment lifecycle telemetry gathers data about the Copilot Credits consumed by features subject to [consumption-based billing](tenant-admin-center-manage-consumption-billing.md).

## AI consumption recorded

Occurs when Copilot Credits are consumed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|AI Consumption Recorded|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|actions|The action that consumed Copilot Credits, for example 'Outbound Message' for Sales Order Agent|
|agentTaskId|The task ID of the agent task that consumed Copilot Credits|
|appId|The application ID of the app associated with the agent that consumed Copilot Credits|
|appName|The application name of the app associated with the agent that consumed Copilot Credits|
|appPublisher|The publisher name for the app associated with the agent that consumed Copilot Credits|
|appVersion|The version number of the app associated with the agent that consumed Copilot Credits|
|companyName|The name of the company in which the agent that consumed Copilot Credits ran|
|component|Dynamics 365 Business Central Server|
|componentVersion|The version number of the Dynamics 365 Business Central server|
|consumptionDateTime|The date and time at which Copilot Credit consumption was recorded|
|copilotCredits|The number of Copilot Credits consumed for the recorded action|
|copilotStudioFeature|The [Copilot Studio Agent feature](/microsoft-copilot-studio/requirements-messages-management#copilot-credits-billing-rates) used to record Copilot consumption|
|description|A description of the action that consumed Copilot Credits|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0055**|
|externalConsumptionId|A GUID representing the Copilot Credit consumption event|
|featureName|Name of the feature that consumed the Copilot Credits|
|telemetrySchemaVersion|0.1|

### Sample KQL code

This KQL code can help you get started analyzing consumed Copilot Credits:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'RT0055' 
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, actions = customDimensions.actions
, agentTaskId = customDimensions.agentTaskId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, copilotCredits = customDimensions.copilotCredits
, copilotStudioFeature = customDimensions.copilotStudioFeature
, featureName = customDimensions.featureName
```

## <a name="LC0059"></a>Metadata embedding generation succeeded

Occurs when metadata embedding generation for an extension completes successfully. Metadata embeddings are used to power AI-based features like Copilot search and suggestions.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation succeeded for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0059**|
|extensionId|Specifies the GUID of the extension for which embeddings were generated.|
|extensionVersion|Specifies the version of the extension for which embeddings were generated.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0059'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## <a name="LC0060"></a>Metadata embedding generation failed

Occurs when metadata embedding generation for an extension fails.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation failed for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0060**|
|extensionId|Specifies the GUID of the extension for which embeddings generation failed.|
|extensionVersion|Specifies the version of the extension.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0060'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## <a name="LC0061"></a>Metadata embedding generation scheduled

Occurs when metadata embedding generation for an extension is scheduled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation scheduled for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0061**|
|extensionId|Specifies the GUID of the extension for which embeddings generation was scheduled.|
|extensionVersion|Specifies the version of the extension.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0061'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## <a name="LC0062"></a>Metadata embedding generation started

Occurs when metadata embedding generation for an extension starts processing.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation started for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0062**|
|extensionId|Specifies the GUID of the extension for which embeddings generation started.|
|extensionVersion|Specifies the version of the extension.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0062'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## Related information

[Manage consumption-based billing for agent capabilities](tenant-admin-center-manage-consumption-billing.md)  
[Telemetry overview](telemetry-overview.md)  
[Turn environment telemetry on or off](telemetry-enable-application-insights.md)  
