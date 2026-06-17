---
title: Analyze MCP Server Tool Calls Telemetry 
description: Learn about the MCP Server telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, mcp, copilot
ms.date: 01/20/2025
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
---

# Analyze MCP server tool calls telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2026 release wave 1, version 28.0, and later

[Model Context Protocol (MCP)](../ai/mcp-overview.md) Server telemetry gathers data about tool calls made through MCP Server configurations in Business Central. This telemetry helps you understand how external tools and services are being used through the MCP protocol.

Learn how to configure the MCP server in [Configure Business Central MCP Server](../ai/configure-mcp-server.md).

## <a name="rt0054"></a>MCP Server tool called

Occurs when an MCP Server tool is called from Business Central.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**MCP Server tool called: '{toolName}'**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0054**|
|configurationName|Specifies the name of the MCP configuration that was used for the tool call.|
|configurationSystemId|Specifies the system ID (GUID) of the MCP configuration record.|
|toolName|Specifies the name of the MCP tool that was called.|
|dynamicToolName|Specifies the action name for dynamic MCP tools. This dimension is populated when using dynamic tool configurations.|
|clientName|Specifies the name of the MCP host that initiated the tool call.|
|authAppId|Specifies the authenticated application ID from the security token.|
|result|Specifies the result of the operation. Possible values are **Success** or **Failure**.|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|serverExecutionTime|[!INCLUDE[serverExecutionTime](../includes/include-telemetry-dimension-server-executiontime.md)]|
|toolInvocationResult|Specifies the result of the MCP tool invocation. Possible values are **Success** or **Failure**.|
|toolInvocationFailureReason|Specifies the reason for the tool invocation failure. This dimension is only populated when **toolInvocationResult** is **Failure**.|

### Sample KQL code

This KQL code can help you get started analyzing MCP Server tool calls:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0054'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, configurationName = customDimensions.configurationName
, toolName = customDimensions.toolName
, dynamicToolName = customDimensions.dynamicToolName
, clientName = customDimensions.clientName
, toolInvocationResult = customDimensions.toolInvocationResult
, toolInvocationFailureReason = customDimensions.toolInvocationFailureReason
, totalTime = customDimensions.totalTime
, serverExecutionTime = customDimensions.serverExecutionTime
```

### Sample KQL code for failed tool invocations

This KQL code can help you analyze failed MCP Server tool calls:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0054'
| where customDimensions.toolInvocationResult == 'Failure'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, configurationName = customDimensions.configurationName
, toolName = customDimensions.toolName
, clientName = customDimensions.clientName
, toolInvocationFailureReason = customDimensions.toolInvocationFailureReason
| summarize FailureCount = count() by tostring(toolName), tostring(toolInvocationFailureReason)
| order by FailureCount desc
```

### Sample KQL code for tool usage by configuration

This KQL code can help you understand which MCP configurations and tools are being used most frequently:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'RT0054'
| summarize 
    TotalCalls = count()
  , SuccessfulCalls = countif(customDimensions.toolInvocationResult == 'Success')
  , FailedCalls = countif(customDimensions.toolInvocationResult == 'Failure')
  , AvgServerExecutionTime = avg(toreal(customDimensions.serverExecutionTime))
  by 
    ConfigurationName = tostring(customDimensions.configurationName)
  , ToolName = tostring(customDimensions.toolName)
  , ClientName = tostring(customDimensions.clientName)
| extend SuccessRate = round(100.0 * SuccessfulCalls / TotalCalls, 2)
| order by TotalCalls desc
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
