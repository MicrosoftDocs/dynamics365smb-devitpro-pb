---
title: Analyzing Stopped Session Telemetry
description: Analyze stop session telemetry in Business Central to identify session cancellation requests, their results, and the AL code or management client involved.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
# Analyzing stopped session telemetry

In Business Central, a background session is a session without a UI that runs a specified codeunit. Background sessions are started and stopped by calling the [StartSession](../developer/methods-auto/session/session-startsession-integer-integer-string-table-method.md) and [StopSession](../developer/methods-auto/session/session-stopsession-method.md) methods from AL. With Business Central online, sessions can be stopped by using the admin center, which indirectly calls the `StopSession` method. Learn more in [Managing Sessions](tenant-admin-center-manage-sessions.md).

With Application Insights, you can record attempts to stop sessions, either by direct calls to the `StopSession` method or from the admin center.

## <a name="stopsession"></a>The StopSession method was invoked on session

A call to the `StopSession` method was made from AL or from the admin center. The event is also emitted when the call doesn't stop a session. Check the `result` dimension to determine the outcome.

### General dimensions

This table explains the columns included in the trace emitted when a session stop is attempted.

|Dimension|Description or value|
|---------|-----|
|message|**The StopSession method was invoked on session {stoppingSessionID}**|
|operation_Name|**StopSessionOperation**|
|severityLevel|**1**|

### Custom dimensions

The following table describes the most relevant custom dimensions of the trace.

| Column | Description or value |
|--------|----------------------|
|eventId|RT0029|
|alObjectId<sup>[\*](#1)</sup>|The ID of the object that called the StopSession method to cancel the session |
|alObjectName<sup>[\*](#1)</sup>|The name of the object that called the StopSession method to cancel the session|
|alObjectType<sup>[\*](#1)</sup>|The type of the object, like codeunit or page, that called the `StopSession` method to cancel the session|
|alStackTrace<sup>[\*](#1)</sup>|The stack trace for the session stop in AL.|
|cancellationComment|The comment defined in the `StopSession` method call. **Stopped by management PowerShell cmdlet** indicates a management request, such as a request from the Business Central admin center or a management PowerShell cmdlet.|
|clientType|The type of client that called the `StopSession` method, such as `Background`, `WebClient`, or `ManagementClient`. `ManagementClient` indicates a management request, not exclusively a request from the Business Central admin center. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName<sup>[\*](#1)</sup>|The name of the company that was open during the session|
|currentSessionID|The ID of the session that called the StopSession method to stop the session identified by `stoppingSessionID`.|
|extensionName|The name of the extension that included the code that called the StopSession method. |
|result|The Boolean outcome recorded for the stop request. A value of `True` indicates that the stop request was accepted.|
|stoppingSessionID|The ID of the session that the `StopSession` method attempted to stop.|
|stoppingSessionIsAdmin|Indicates whether the target session was running as an administrator.|
|[See common custom dimensions](#other)||

<sup>*</sup><a name="1"></a> Not shown for sessions canceled from the admin center.
<!--
```json
{"result":"False","stoppingSessionID":"448999","cancellationComment":"Stopped by management PowerShell cmdlet.","component":"Dynamics 365 Business Central Server","environmentType":"Production","stoppingSessionIsAdmin":"False","eventId":"RT0029","clientType":"ManagementClient","telemetrySchemaVersion":"0.1","currentSessionID":"910803","componentVersion":"20.0.42653.43979","environmentName":"Production","aadTenantId":"aaaabbbb-0000-cccc-1111-dddd2222eeee"}
```
-->

<!--
{"aadTenantId":"common","result":"True","extensionName":"stopsession","component":"Dynamics 365 Business Central Server","extensionId":"aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb","extensionVersion":"1.0.0.0","environmentType":"Production","extensionPublisher":"Default publisher","telemetrySchemaVersion":"0.1","eventId":"RT0029","componentVersion":"21.0.42152.0","clientType":"WebClient","companyName":"CRONUS International Ltd.","alObjectName":"CustomerListExt","stoppingSessionID":"12","alObjectType":"PageExtension","cancellationComment":"Logoff cache stress test session","currentSessionID":"9","alStackTrace":"AppObjectType: PageExtension\r\n AppObjectId: 50100\r\n AL CallStack: CustomerListExt(PageExtension 50100).MyProcedure line 6 - stopsession by Default publisher\r\nCustomerListExt(PageExtension 50100).OnOpenPage(Trigger) line 2 - stopsession by Default publisher","alObjectId":"50100","stoppingSessionIsAdmin":"False"}

-->

<a name="other"></a>**Other custom dimensions**

The following table explains other custom dimensions of the trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|The Microsoft Entra tenant ID that's used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments. Learn more in [Managing environments](tenant-admin-center-environments.md).|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema|

 
## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Monitoring and Analyzing Long Running SQL Queries On-Premises](monitor-long-running-sql-queries-event-log.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
