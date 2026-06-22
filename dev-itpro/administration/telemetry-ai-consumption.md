---
title:  Analyzing AI Consumption Trace Telemetry 
description: Learn about the AI Consumption telemetry in Business Central.
author: jobulsin
ms.author: jobulsin
ms.reviewer: 
ms.topic: concept-article
ms.date: 06/22/2026
ms.custom: bap-template
---
# Analyzing AI consumption trace telemetry

[!INCLUDE[online_only](../developer/includes/online_only.md)]

Environment lifecycle telemetry gathers data about the Copilot Credits consumed by features subject to [consumption-based billing](tenant-admin-center-manage-consumption-billing.md).

## AI consumption recorded

Occurs when Copilot Credits are consumed. The event reports consumption data for all features that use consumption-based billing through environment telemetry. For extension telemetry, it reports only consumption associated with agents that are published to an environment as part of the app.

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
|extensionId|The extension ID of the app associated with the agent that consumed Copilot Credits|
|extensionName|The name of the extension associated with the agent that consumed Copilot Credits|
|extensionPublisher|The publisher name for the extension associated with the agent that consumed Copilot Credits|
|extensionVersion|The version number of the extension associated with the agent that consumed Copilot Credits|
|externalConsumptionId|A GUID representing the Copilot Credit consumption event|
|featureName|Name of the feature that consumed the Copilot Credits|
|telemetrySchemaVersion|0.2|

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

## Related information

[Manage consumption-based billing for agent capabilities](tenant-admin-center-manage-consumption-billing.md)  
[Telemetry overview](telemetry-overview.md)  
[Turn environment telemetry on or off](telemetry-enable-application-insights.md)  
