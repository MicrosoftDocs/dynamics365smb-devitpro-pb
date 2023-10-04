---
title: Analyzing Long Running AL Methods Telemetry
description: Learn about analyzing long running AL methods in Business Central.  
author: jswymer
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.custom: bap-template
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 08/18/2023
ms.author: jswymer
ms.reviewer: jswymer
---

# Analyzing long running AL methods telemetry

[!INCLUDE[prod_short](../includes/2020_releasewave2.md)], version 17.1. Available in extension telemetry starting with version 18.1.

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

The [!INCLUDE[server](../developer/includes/server.md)] server will emit telemetry about the execution time of long running AL methods, including the time spent in the database. The signal also includes a breakdown of how much time each event subscriber added to the total time. As a partner, this data gives you insight into bad performing code and enables you to troubleshoot performance issues caused by extensions.

<!--
> [!NOTE]
> Currently, this signal isn't enabled for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises. For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, it's enabled with a specific threshold on a case-by-case basis by the service.
-->

> [!NOTE]
> To collect this telemetry for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, the **AL Function Timing** and **AL Function Logging Threshold - Application Insights** settings must be configured on the [!INCLUDE[server](../developer/includes/server.md)] instance. For more information, see [Configuring Business Central Server](configure-server-instance.md#general-settings). With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, this telemetry is enabled with a specific threshold on a case-by-case basis by the service.

## General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|--------------------|
|message|**Operation exceeded time threshold (AL method)**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

## CustomDimensions

This table describes the different dimensions of a **Operation exceeded time threshold (AL method)** operation.

|Column (key)|Description or value|
|------------|---------------|
|aadTenantId|Specifies the Microsoft Entra tenant ID when using Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alMethod|The name of the long running AL method.|
|alObjectId|The type of the AL object that executed the AL method.|
|alObjectName|The name of the AL object that executed the AL method.|
|alObjectType|The type of the AL object that executed the AL method.|
|alStackTrace| [!INCLUDE[alStackTrace](../includes/include-telemetry-dimension-al-stacktrace.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution, such as Production or Sandbox.|
|environmentName|Specifies the environment name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution, such as Production or Sandbox.|
|eventId|**RT0018**|
|exclusiveTime|Specifies the execution time of the operation without the time where AL execution was suspended due to client callback (such as when waiting for user input.) The value has the format hh:mm:ss.sssssss. </br></br>Introduced in versions 21.6 and 22.1.|
|executionTime|Specifies the total time that it took to execute the AL method. The value has the format hh:mm:ss.sssssss.|
|extensionInfo|Specifies information about individual extensions that contributed to the execution time spent in the call stack up until the point at which the long-running threshold was exceeded and the trace was emitted. The following information is included for each extension:<ul><li>`id` -  the ID of the extension.</li><li>`extensionName` - the name of the extension.</li><li>`extensionVersion` - the version of the extension.</li><li>`extensionPublisher` - the publisher of the extension.</li><li>`subscriberExecutionCount` - the number of event subscribers executed in this extension.</li><li>`executionTime` - the total execution time for this extension in the call stack. The value has the format hh:mm:ss.sssssss.</li></ul>|
|extensionName|Specifies the name of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted. |
|extensionPublisher|Specifies the publisher of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted.|
|extensionVersion|Specifies the version of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted.|
|extensionId|Specifies the ID of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted.|
|longRunningThreshold|Specifies the time that defines a long-running AL method, after which the trace is emitted. The value has the format hh:mm:ss.sssssss. |
|sqlExecutes|Specifies the number of SQL statements that was executed in the method.<br /><br />This dimension was introduced in Business Central 2023 release wave 1, version 22.0. |
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.<br /><br />This dimension was introduced in Business Central 2023 release wave 1, version 22.0.  |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema. |

## Sample KQL code for analyzing AL method performance

Use this KQL code if you want to analyze AL method performance.

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0018' 
| where customDimensions.alObjectId > 0 // filter out internal server calls
| project aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, alMethod = customDimensions.alMethod
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, alStackTrace = customDimensions.alStackTrace // use the KQL snippet parseStackTrace to get top/bottom of the stack trace details
, clientType = customDimensions.clientType
// exclusiveTime is the execution time of the operation, without the time where AL execution was suspended due to client callback
, exclusiveTime = customDimensions.exclusiveTime // This dimension was introduced in Business Central 2023 release wave 1, version 22.1. Backported to version 21.6
, exclusiveTimeInMS = toreal(totimespan(customDimensions.exclusiveTime))/10000 //the datatype for exclusiveTime is timespan 
// exclusiveTime is the total time of the operation, including wait time due to client callback
, totalTime = customDimensions.executionTime
, totalTimeInMS = toreal(totimespan(customDimensions.executionTime))/10000 //the datatype for executionTime is timespan 
, extensionId = customDimensions.extensionId
, extensionInfo = customDimensions.extensionInfo // parse this json structure to find out if other extensions is involved
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, longRunningThreshold = customDimensions.longRunningThreshold
, longRunningThresholdInMS = toreal(totimespan(customDimensions.longRunningThreshold))/10000 //the datatype for executionTime is timespan 
, sqlExecutes = toint(customDimensions.sqlExecutes) // This dimension was introduced in Business Central 2023 release wave 1, version 22.0
, sqlRowsRead = toint(customDimensions.sqlRowsRead) // This dimension was introduced in Business Central 2023 release wave 1, version 22.0
, usertelemetryId = case(
  // user telemetry id was introduced in the platform in version 20.0
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id
, 'N/A'
)
```

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Monitoring and Analyzing Long Running SQL Queries On-Premises](monitor-long-running-sql-queries-event-log.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
