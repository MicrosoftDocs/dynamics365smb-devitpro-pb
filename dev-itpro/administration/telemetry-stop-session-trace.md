---
title: Analyzing Stopped Session Telemetry
description: Learn about analyzing stop session telemetry in Business Central.  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/26/2022
ms.author: jswymer
---
# Analyzing Stopped Session Telemetry

In Business Central, a background session is session without a UI that runs a specified codeunit. Background sessions are started and stopped by calling the [StartSession](..\developer\methods-auto\session\session-startsession-integer-integer-string-table-method.md) and [StopSession](..\developer\methods-auto\session\session-stopsession-method.md) methods from AL. With Business Central online, sessions can be stopped by using the admin center, which indirectly calls the StopSession method. For more information, see [Managing Sessions](tenant-admin-center-manage-sessions.md).

With Application Insights, you can record when sessions are stopped, either by direct calls to the StopSession method or from the admin center.

## <a name="stopsession"></a>The StopSession method was invoked on session

A session was stopped by a direct call to the StopSession method from AL or from the admin center.

### General dimensions

This table explains the columns included in trace emitted when a session is stopped.

|Dimension|Description or value|
|---------|-----|
|message|**The StopSession method was invoked on session {stoppingSessionID}**|
|operation_Name|**StopSessionOperation**|
|severityLevel|**1**|

## CustomDimensions

The following table describes the most relevant custom dimensions of the trace.

| Column | Description or value |
|--------|----------------------|
|eventId|RT0029|
|alObjectId<sup>[\*](#1)</sup>|The ID of the object that called the StopSession method to cancel the session |
|alObjectName<sup>[\*](#1)</sup>|The name of the object that called the StopSession method to cancel the session|
|alObjectType<sup>[\*](#1)</sup>|The type of the object, like codeunit or page, called by the StopSession method to cancel the session|
|alStackTrace<sup>[\*](#1)</sup>|The stack trace for the session stop in AL.|
|cancellationComment|The comment defined in the StopSession method call. **Stopped by management PowerShell cmdlet** means that the session was stopped from the Business Central admin center.|
|clientType|The type of client that called the Stop Session method such as **Background**, **WebClient**, or **ManagementClient**. **ManagementClient** indicates that the session was canceled from the Business Central admin center. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName<sup>[\*](#1)</sup>|The name of the company that was open during the session|
|currentSessionID|The ID of the session that called the StopSession method to stop the session identified by `stoppingSessionID`.|
|extensionName|The name of the extension that included the code that called the StopSession method. |
|result|The return value of the StopSession method call.|
|stoppingSessionID|The ID of the session that was stopped by the StopSession method call|
|stoppingSessionIsAdmin|Indicates whether the session that was stopped was running as an administrator|
|[See common custom dimensions](#other)||

<sup>*</sup><a name="1"></a> Not shown for sessions canceled from the admin center.
<!--
```
{"result":"False","stoppingSessionID":"448999","cancellationComment":"Stopped by management PowerShell cmdlet.","component":"Dynamics 365 Business Central Server","environmentType":"Production","stoppingSessionIsAdmin":"False","eventId":"RT0029","clientType":"ManagementClient","telemetrySchemaVersion":"0.1","currentSessionID":"910803","componentVersion":"20.0.42653.43979","environmentName":"Production","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d"}-->

<!--
{"aadTenantId":"common","result":"True","extensionName":"stopsession","component":"Dynamics 365 Business Central Server","extensionId":"15b61b42-fcd5-45c5-98d5-72ddd8ed14b6","extensionVersion":"1.0.0.0","environmentType":"Production","extensionPublisher":"Default publisher","telemetrySchemaVersion":"0.1","eventId":"RT0029","componentVersion":"21.0.42152.0","clientType":"WebClient","companyName":"CRONUS International Ltd.","alObjectName":"CustomerListExt","stoppingSessionID":"12","alObjectType":"PageExtension","cancellationComment":"Logoff cache stress test session","currentSessionID":"9","alStackTrace":"AppObjectType: PageExtension\r\n AppObjectId: 50100\r\n AL CallStack: CustomerListExt(PageExtension 50100).MyProcedure line 6 - stopsession by Default publisher\r\nCustomerListExt(PageExtension 50100).OnOpenPage(Trigger) line 2 - stopsession by Default publisher","alObjectId":"50100","stoppingSessionIsAdmin":"False"}

-->

<a name="other"></a>**Other custom dimensions**

The following table explains other custom dimensions os the trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|The Azure Active Directory (Azure AD) tenant ID that's used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema|

 
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Monitoring and Analyzing Long Running SQL Queries On-Premises](monitor-long-running-sql-queries-event-log.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
