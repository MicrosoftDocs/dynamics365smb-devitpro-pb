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
# Analyzing AI Consumption Trace Telemetry

[!INCLUDE[component](../developer/includes/online_only.md)]

Environment lifecycle telemetry gathers data about the Copilot Credits consumed by features subject to [consumption-based billing](tenant-admin-center-manage-consumption-billing.md).

## AI Consumption Recorded

Occurs when Copilot Credits have been consumed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|AI Consumption Recorded|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|actions|The action for which Copilot Credits have been consumed, for example "Outbound Message" for Sales Order Agent|
|agentTaskId|The task ID of the agent task for which Copilot Credits have been consumed|
|appId|The application ID of the app the agent that consumed Copilot Credits belongs to|
|appName|The application name of the app the agent that consumed Copilot Credits belongs to|
|appPublisher|The publisher name for the app the agent that consumed Copilot Credits belongs to|
|appVersion|The version number of the app the agent that consumed Copilot Credits belongs to|
|companyName|The name of the company in which the agent that consumed Copilot Credits ran|
|component|Dynamics 365 Business Central Server|
|componentVersion|The version number of the Dynamics 365 Business Central server|
|consumptionDateTime|The date and time at which Copilot Credit consumption was recorded|
|copilotCredits|The number of Copilot Credits consumed for the recorded action|
|copilotStudioFeature|The [Copilot Studio Agent Feature](https://learn.microsoft.com/en-us/microsoft-copilot-studio/requirements-messages-management#copilot-credits-billing-rates) used to record Copilot Consumption|
|description|A description of the action for which Copilot Credits have been consumed|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0055**|
|externalConsumptionId|A guid representing the Copilot Credit consumption event|
|featureName|Name of the feature for which Copilot Credits have been consumed|
|telemetrySchemaVersion|0.1|
|userId|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)]|

### Sample KQL code (environment app hotfix scheduling by App Management API failed to be installed)

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
