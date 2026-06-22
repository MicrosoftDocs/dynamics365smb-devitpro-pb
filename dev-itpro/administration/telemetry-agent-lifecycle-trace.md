---
title: Analyze Agent Lifecycle Telemetry 
description: Learn about the agent lifecycle telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, agent, AI, copilot
ms.date: 01/20/2025
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Analyze agent lifecycle telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2026 release wave 1, version 28.0, and later

Agent lifecycle telemetry gathers data about the creation and configuration of AI agents in Business Central. This telemetry helps you track agent setup, monitor configuration changes, and understand how agents and their tasks are being used.

## <a name="lc0067"></a>Agent created

Occurs when a new agent is created in Business Central.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Agent created: {agentDisplayName}**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**LC0067**|
|agentUserId|Specifies the security ID (GUID) of the agent user.|
|agentUserName|Specifies the unique user name identifier for the agent.|
|agentDisplayName|Specifies the human-readable display name of the agent.|
|state|Specifies the agent's state. Values are **Enabled** or **Disabled**.|
|instructionsHash|Specifies the SHA-256 hash of the agent's instructions. Empty if no instructions are set.|
|modelId|Specifies the ID of the AI model configured for the agent.|
|modelName|Specifies the display name of the AI model.|
|modelAvailability|Specifies the availability status of the model. Values are **Preview**, **Available**, **Obsolete**, or **Retired**.|
|modelIsDefault|Specifies whether this is the platform default model. Values are **true** or **false**.|
|modelRetirementDate|Specifies the retirement date for the model, if set.|

### Sample KQL code

This KQL code can help you get started analyzing agent creation:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'LC0067'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, agentDisplayName = customDimensions.agentDisplayName
, agentUserName = customDimensions.agentUserName
, state = customDimensions.state
, modelId = customDimensions.modelId
, modelName = customDimensions.modelName
, modelAvailability = customDimensions.modelAvailability
```

## <a name="lc0066"></a>Agent configuration changed

Occurs when an agent's configuration is modified in Business Central. This event includes information about which fields changed and their previous values.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Agent configuration changed: {agentDisplayName}**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**LC0066**|
|agentUserId|Specifies the security ID (GUID) of the agent user.|
|agentUserName|Specifies the unique user name identifier for the agent.|
|agentDisplayName|Specifies the human-readable display name of the agent.|
|state|Specifies the agent's current state after the change. Values are **Enabled** or **Disabled**.|
|instructionsHash|Specifies the SHA-256 hash of the agent's current instructions.|
|modelId|Specifies the ID of the AI model currently configured for the agent.|
|modelName|Specifies the display name of the AI model.|
|modelAvailability|Specifies the availability status of the model. Values are **Preview**, **Available**, **Obsolete**, or **Retired**.|
|modelIsDefault|Specifies whether this is the platform default model. Values are **true** or **false**.|
|modelRetirementDate|Specifies the retirement date for the model, if set.|
|changedFields|Specifies a comma-separated list of fields that changed (for example, "state,modelId"). Empty when no specific fields were flagged.|
|agentUserNamePreviousValue|Specifies the agent's user name before the change. Empty when the user name did not change.|
|agentDisplayNamePreviousValue|Specifies the agent's display name before the change. Empty when the display name did not change.|
|statePreviousValue|Specifies the agent's state before the change. Empty when the state did not change.|
|modelIdPreviousValue|Specifies the configured model ID before the change. Empty when the model did not change.|
|instructionsHashPreviousValue|Specifies the SHA-256 hash of the agent's instructions before the change. Empty when the instructions did not change.|

### Sample KQL code

This KQL code can help you get started analyzing agent configuration changes:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'LC0066'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, agentDisplayName = customDimensions.agentDisplayName
, changedFields = customDimensions.changedFields
, oldState = customDimensions.statePreviousValue
, newState = customDimensions.state
, oldModelId = customDimensions.modelIdPreviousValue
, newModelId = customDimensions.modelId
```

### Sample KQL code for tracking state changes

This KQL code can help you track when agents are enabled or disabled:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0066'
| where customDimensions.changedFields contains 'state'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, agentDisplayName = customDimensions.agentDisplayName
, oldState = customDimensions.statePreviousValue
, newState = customDimensions.state
| summarize StateChanges = count() by tostring(agentDisplayName), tostring(oldState), tostring(newState)
| order by StateChanges desc
```

## <a name="lc0068"></a>Agent task created

Occurs when a new agent task is created in Business Central. Agent tasks represent individual work items assigned to agents.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Agent task created: {taskId}**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**LC0068**|
|taskId|Specifies the unique identifier for the agent task.|
|agentUserId|Specifies the security ID (GUID) of the agent user that owns the task.|
|agentDisplayName|Specifies the human-readable display name of the agent that owns the task.|
|modelSource|Specifies where the model configuration came from. Values are **Task**, **Agent**, or **Default**. This indicates the level at which the model was defined.|
|modelId|Specifies the ID of the AI model used by the task.|
|modelName|Specifies the display name of the AI model.|
|modelAvailability|Specifies the availability status of the model. Values are **Preview**, **Available**, **Obsolete**, or **Retired**.|
|modelIsDefault|Specifies whether this is the platform default model. Values are **true** or **false**.|
|modelRetirementDate|Specifies the retirement date for the model, if set.|

### Sample KQL code

This KQL code can help you get started analyzing agent task creation:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'LC0068'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, taskId = customDimensions.taskId
, agentDisplayName = customDimensions.agentDisplayName
, modelSource = customDimensions.modelSource
, modelId = customDimensions.modelId
, modelName = customDimensions.modelName
, modelAvailability = customDimensions.modelAvailability
```

### Sample KQL code for task creation by agent

This KQL code can help you understand which agents are creating the most tasks:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0068'
| summarize 
    TaskCount = count()
  , UniqueModels = dcount(tostring(customDimensions.modelId))
  by 
    AgentDisplayName = tostring(customDimensions.agentDisplayName)
  , EnvironmentName = tostring(customDimensions.environmentName)
| order by TaskCount desc
```

### Sample KQL code for model usage in tasks

This KQL code can help you understand which models are being used and how they were configured:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0068'
| summarize 
    TaskCount = count()
  by 
    ModelName = tostring(customDimensions.modelName)
  , ModelSource = tostring(customDimensions.modelSource)
  , ModelAvailability = tostring(customDimensions.modelAvailability)
| order by TaskCount desc
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on Telemetry](telemetry-alert.md)
