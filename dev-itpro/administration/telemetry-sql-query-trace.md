---
title: Analyze SQL query trace telemetry
description: Learn about SQL query trace telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/01/2026
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Analyze SQL query trace telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2024 release wave 2 and later

SQL query trace telemetry provides verbose logging of all SQL queries executed by [!INCLUDE[prod_short](../includes/prod_short.md)]. This telemetry is only emitted when verbose logging is enabled from the **Help & Support** page or through the [!INCLUDE[prod_short](../includes/prod_short.md)] admin center.

> [!NOTE]
> SQL query trace (RT0009) is different from long-running SQL query telemetry (RT0005). The long-running SQL query telemetry is always enabled and captures queries exceeding a threshold (default 750 ms). SQL query trace captures all queries when verbose logging is active, regardless of execution time.

For more information about long-running SQL queries, see [Analyzing Long Running Operation (SQL Query) Telemetry](telemetry-long-running-sql-query-trace.md).

## <a name="RT0009"></a>SQL query executed

Occurs when a SQL statement is executed while verbose logging is enabled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Executed a SQL statement**|
|severityLevel|**0** (Verbose)|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|alObjectId| Specifies the ID of the AL object that executed the SQL statement.|
|alObjectName| Specifies the name of the AL object that executed the SQL statement.|
|alObjectType| Specifies the type of the AL object that executed the SQL statement.|
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0009**|
|executionTime| Specifies the time it took to execute the SQL statement. The value has the format hh:mm:ss.sssssss.|
|extensionId| Specifies the AppID of the extension that contains the AL object.|
|extensionName| Specifies the name of the extension that contains the AL object.|
|extensionPublisher| Specifies the publisher of the extension that contains the AL object.|
|extensionVersion| Specifies the version of the extension that contains the AL object.|
|sqlServerSessionId| Specifies the ID of the SQL Server session that executed the query.|
|sqlStatement| Specifies the SQL statement that was executed. The value is limited to 8192 characters.|

### Sample KQL code

```kql
traces
| where timestamp > ago(1d) // SQL query traces generate high volume
| where customDimensions.eventId == 'RT0009'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, executionTime = customDimensions.executionTime
, sqlStatement = customDimensions.sqlStatement
```

> [!TIP]
> Be careful when analyzing RT0009 events as they can generate large volumes of data. Always limit your query time range and consider filtering by specific objects or sessions.

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Analyzing Long Running Operation (SQL Query) Telemetry](telemetry-long-running-sql-query-trace.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
