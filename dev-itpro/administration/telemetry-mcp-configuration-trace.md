---
title: Analyze MCP configuration telemetry 
description: Learn about the MCP (Model Context Protocol) configuration telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, MCP, AI, Copilot
ms.date: 04/29/2026
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
---

# Analyze MCP configuration telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2026 release wave 1, version 26.0, and later

[Model Context Protocol (MCP)](../ai/mcp-overview.md) configuration telemetry gathers data about the following operations:

- An MCP configuration was created
- An MCP configuration was modified
- An MCP configuration was deleted
- An MCP configuration was designated as the default

Use this telemetry to track changes to MCP server configurations in your environment, which is useful for auditing and troubleshooting AI agent integrations. Learn how to configure the MCP server in [Configure Business Central MCP Server](../ai/configure-mcp-server.md).

## <a name="created"></a>MCP configuration created

Occurs when a new MCP configuration is created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**MCP Configuration created**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000R0Q**|
|alActive|Specifies whether the configuration is active. Values are **true** or **false**.|
|alDiscoverReadOnlyObjects|Specifies whether the configuration discovers read-only objects. Values are **true** or **false**.|
|alDynamicToolMode|Specifies whether dynamic tool mode is enabled. Values are **true** or **false**.|
|alIsDesignatedDefault|Specifies whether this configuration is designated as the default. Values are **true** or **false**.|
|alMCPConfigurationName|Specifies the name of the MCP configuration.|
|alUnblockEditTools|Specifies whether edit tools are allowed for production environments. Values are **true** or **false**.|

### Sample KQL code

This KQL code can help you get started analyzing MCP configuration creation:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000R0Q'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, mcpConfigurationName = customDimensions.alMCPConfigurationName
, active = customDimensions.alActive
, dynamicToolMode = customDimensions.alDynamicToolMode
```

## <a name="modified"></a>MCP configuration modified

Occurs when an existing MCP configuration is modified.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**MCP Configuration modified**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000QE9**|
|alMCPConfigurationName|Specifies the name of the MCP configuration.|
|alOldActive|Specifies the previous value of the Active setting (only included if changed).|
|alNewActive|Specifies the new value of the Active setting (only included if changed).|
|alOldUnblockEditTools|Specifies the previous value of the UnblockEditTools setting (only included if changed).|
|alNewUnblockEditTools|Specifies the new value of the UnblockEditTools setting (only included if changed).|
|alOldDynamicToolMode|Specifies the previous value of the DynamicToolMode setting (only included if changed).|
|alNewDynamicToolMode|Specifies the new value of the DynamicToolMode setting (only included if changed).|
|alOldDiscoverReadOnlyObjects|Specifies the previous value of the DiscoverReadOnlyObjects setting (only included if changed).|
|alNewDiscoverReadOnlyObjects|Specifies the new value of the DiscoverReadOnlyObjects setting (only included if changed).|

### Sample KQL code

This KQL code can help you get started analyzing MCP configuration modifications:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000QE9'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, mcpConfigurationName = customDimensions.alMCPConfigurationName
, oldActive = customDimensions.alOldActive
, newActive = customDimensions.alNewActive
, oldDynamicToolMode = customDimensions.alOldDynamicToolMode
, newDynamicToolMode = customDimensions.alNewDynamicToolMode
```

## <a name="deleted"></a>MCP configuration deleted

Occurs when an MCP configuration is deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**MCP Configuration deleted**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000QEB**|
|alActive|Specifies whether the deleted configuration was active. Values are **true** or **false**.|
|alDiscoverReadOnlyObjects|Specifies whether the deleted configuration discovered read-only objects. Values are **true** or **false**.|
|alDynamicToolMode|Specifies whether dynamic tool mode was enabled. Values are **true** or **false**.|
|alIsDesignatedDefault|Specifies whether the deleted configuration was designated as the default. Values are **true** or **false**.|
|alMCPConfigurationName|Specifies the name of the deleted MCP configuration.|
|alUnblockEditTools|Specifies whether edit tools were allowed. Values are **true** or **false**.|

### Sample KQL code

This KQL code can help you get started analyzing MCP configuration deletions:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000QEB'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, mcpConfigurationName = customDimensions.alMCPConfigurationName
, wasActive = customDimensions.alActive
```

## <a name="default"></a>MCP default configuration designated

Occurs when an MCP configuration is designated as the default configuration.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**MCP default configuration designated**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000R0R**|
|alActive|Specifies whether the configuration is active. Values are **true** or **false**.|
|alDiscoverReadOnlyObjects|Specifies whether the configuration discovers read-only objects. Values are **true** or **false**.|
|alDynamicToolMode|Specifies whether dynamic tool mode is enabled. Values are **true** or **false**.|
|alIsDesignatedDefault|Specifies whether this configuration is designated as the default (should be **true**).|
|alMCPConfigurationName|Specifies the name of the MCP configuration.|
|alUnblockEditTools|Specifies whether edit tools are allowed. Values are **true** or **false**.|

### Sample KQL code

This KQL code can help you get started analyzing MCP default configuration changes:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000R0R'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, mcpConfigurationName = customDimensions.alMCPConfigurationName
, dynamicToolMode = customDimensions.alDynamicToolMode
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Sample KQL code for monitoring all MCP configuration changes

Use this KQL code if you want to monitor all MCP configuration lifecycle events:

```kql
traces
| where timestamp > ago(1d) // adjust as needed
| where customDimensions.eventId in ('AL0000R0Q', 'AL0000QE9', 'AL0000QEB', 'AL0000R0R')
| extend eventId = tostring(customDimensions.eventId)
| extend eventType = case(
    eventId == 'AL0000R0Q', 'Created',
    eventId == 'AL0000QE9', 'Modified',
    eventId == 'AL0000QEB', 'Deleted',
    eventId == 'AL0000R0R', 'Default Designated',
    'Unknown'
)
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, eventType
, mcpConfigurationName = customDimensions.alMCPConfigurationName
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Model Context Protocol (MCP) in Business Central overview](../ai/mcp-overview.md)  
[Configure Business Central MCP Server](../ai/configure-mcp-server.md)  
[Connect to Business Central MCP Server with Visual Studio Code](../ai/use-mcp-server-in-vscode.md)  
[Connect to Business Central MCP server with non-Microsoft clients](../ai/use-mcp-server-non-microsoft.md)  
[Business Central Admin Center API MCP server](administration-center-api-mcp.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on Telemetry](telemetry-alert.md)
