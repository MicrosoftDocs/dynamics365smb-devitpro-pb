---
title: Analyzing Long Running AL Methods Telemetry
description: Learn about analyzing long running AL methods in Business Central.  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/31/2020
ms.author: jswymer
---

# Analyzing Long Running AL Methods Telemetry

[!INCLUDE[prodshort](../includes/2020_releasewave2.md)]

The [!INCLUDE[server](../developer/includes/server.md)] server will emit telemetry about the execution time of long running AL methods, excluding the time spent in the database. The signal also includes a breakdown of how much time each event subscriber added to the total time. As a partner, this data gives you insight into bad performing code and enables you to troubleshoot performance issues caused by extensions.

<!--
> [!NOTE]
> Currently, this signal isn't enabled for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises. For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, it's enabled with a specific threshold on a case-by-case basis by the service.
-->

> [!NOTE]
> To collect this telemetry for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, the **AL Function Timing** and **AL Function Logging Threshold - Application Insights** settings must be configured on the [!INCLUDE[server](../developer/includes/server.md)] instance. For more information, see [Configuring Business Central Server](configure-server-instance.md#General). With [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, this telemetry is enabled with a specific threshold on a case-by-case basis by the service.

## General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|--------------------|
|message|**Operation exceeded time threshold (AL method)**|
|severityLevel|**2**|

## CustomDimensions

This table describes the different dimensions of a **Operation exceeded time threshold (AL method)** operation.

|Column (key)|Description or value|
|------------|---------------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID when using Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alMethod|The name of the long running AL method.|
|alObjectId|The type of the AL object that executed the AL method.|
|alObjectName|The name of the AL object that executed the AL method.|
|alObjectType|The type of the AL object that executed the AL method.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the AL method, such as Background or Web. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution, such as Production or Sandbox.|
|environmentName|Specifies the environment name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution, such as Production or Sandbox.|
|eventId|**RT0018**|
|executionTime|Specifies the time that it took to execute the AL method. The value has the format hh:mm:ss.sssssss.|
|extensionInfo|Specifies information about individual extensions that contributed to the execution time spent in the call stack up until the point at which the long-running threshold was exceeded and the trace was emitted. The following information is included for each extension:<ul><li>`id` -  the ID of the extension.</li><li>`extensionName` - the name of the extension.</li><li>`extensionVersion` - the version of the extension.</li><li>`extensionPublisher` - the publisher of the extension.</li><li>`subscriberExecutionCount` - the number of event subscribers executed in this extension.</li><li>`executionTime` - the total execution time for this extension in the call stack. The value has the format hh:mm:ss.sssssss.</li></ul>|
|extensionName|Specifies the name of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted. |
|extensionPublisher|Specifies the publisher of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted.|
|extensionVersion|Specifies the version of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted.|
|extensionId|Specifies the ID of the extension that was currently executing when the long-running threshold was exceeded and the trace was emitted.|
|longRunningThreshold|Specifies the time that defines a long-running AL method, after which the trace is emitted. The value has the format hh:mm:ss.sssssss. |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. |

<!-- for 17.1 
<br /><br >This threshold is controlled by the [!INCLUDE[server](../developer/includes/server.md)] configuration settings called ALLongRunningFunctionTracingThreshold and ALLongRunningFunctionTracingThresholdForApplicationInsights.-->

<!--
## Example

The following code snippet shows an example of the CustomDimensions.

`{"telemetrySchemaVersion":"0.1","longRunningThreshold":"00:00:00.5000000","componentVersion":"17.0.15765.0","environmentName":"Production","environmentType":"Production","extensionPublisher":"Microsoft","deprecatedKeys":"Execution time (ms), executionTimeInMs, Long running log threshold (ms), longRunningThresholdInMs, Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","extensionVersion":"17.0.15821.0","aadTenantId":"f22cca61-d606-4dfc-8165-acd0bf022d2a","extensionName":"Base Application","extensionInfo":"[{\"id\": \"00000000-0000-0000-0000-000000000000\",\"subscriberExecutionCount\": 0,\"executionTime\": 0},{\"id\": \"63ca2fa4-4f03-4f2b-a480-172fef340d3f\",\"extensionName\": \"System Application\",\"extensionVersion\": \"17.0.15821.0\",\"extensionPublisher\": \"Microsoft\",\"subscriberExecutionCount\": 0,\"executionTime\": 0},{\"id\": \"437dbf0e-84ff-417a-965d-ed2bb9650972\",\"extensionName\": \"Base Application\",\"extensionVersion\": \"17.0.15821.0\",\"extensionPublisher\": \"Microsoft\",\"subscriberExecutionCount\": 21,\"executionTime\": 0}]","executionTime":"00:00:01.7810000","component":"Dynamics 365 Business Central Server","companyName":"CRONUS USA, Inc.","alObjectType":"CodeUnit","alObjectName":"CRM Statistics Job","alStackTrace":"AppObjectType: CodeUnit\r\n  AppObjectId: 5350\r\n  AL CallStack: \"CRM Statistics Job\"(CodeUnit 5350).UpdateInvoice line 14 - Base Application by Microsoft\r\n\"CRM Statistics Job\"(CodeUnit 5350).UpdateStatusOfPaidInvoices line 21 - Base Application by Microsoft\r\n\"CRM Statistics Job\"(CodeUnit 5350).UpdateInvoices line 9 - Base Application by Microsoft\r\n\"CRM Statistics Job\"(CodeUnit 5350).UpdateStatisticsAndInvoices line 16 - Base Application by Microsoft\r\n\"CRM Statistics Job\"(CodeUnit 5350).OnRun(Trigger) line 2 - Base Application by Microsoft\r\n\"Job Queue Start Codeunit\"(CodeUnit 449).OnRun(Trigger) line 11 - Base Application by Microsoft\r\n\"Job Queue Dispatcher\"(CodeUnit 448).HandleRequest line 30 - Base Application by Microsoft\r\n\"Job Queue Dispatcher\"(CodeUnit 448).OnRun(Trigger) line 19 - Base Application by Microsoft","clientType":"Background","alObjectId":"5350","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","eventId":"RT0018","alMethod":"UpdateInvoice"}`

-->
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
[Monitoring and Analyzing Long Running SQL Queries On-Premises](monitor-long-running-sql-queries-event-log.md)  
[The Business Central Administration Center](tenant-admin-center.md)  