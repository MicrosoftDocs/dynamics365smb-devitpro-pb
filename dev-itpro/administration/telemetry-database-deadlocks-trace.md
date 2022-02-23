---
title: Database Deadlock Lock Trace Telemetry
description: Learn about the database deadlock telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Database Deadlock Telemetry

**INTRODUCED IN:** Business Central 2022 release wave 1, version 20.0

The database deadlock telemetry gathers information about deadlocks that happen. Deadlocks can prevent users from completing tasks in the Business Central client. A deadlock occurs when two or more processes block each other because each has locked a database resource. The system terminates and rolls back one of the sessions (known as the deadlock victim), then emits a telemetry signal.

As a partner or developer, this telemetry provides several benefits:

- Makes you aware that there are deadlocks happening.
- Let's you identify who was the victim in deadlock situations.
- In some deadlock problems, the process that is the victim and the process that succeeds will change by chance. In these cases, both will be stored in the telemetry resource as different deadlock events.
- For further monitoring and troubleshooting, this telemetry is complimented by other features like:
  - Enable SQL database deadlock monitoring on a sandbox or on-premises environment. For more information, see [Monitoring SQL Database Deadlocks](monitor-database-deadlocks.md).
  - Database lock trace telemetry. For more information, see [Database lock trace telemetry](telemetry-database-locks-trace.md).

> [!IMPORTANT]
> For Business Central on-premises, you must turn on the EnableDeadlockMonitoring setting of the [!INCLUDE[server](../developer/includes/server.md#Database)] instance to collect the telemetry.  For more information, see [Configuring Business Central Server](configure-server-instance.md).

## Database deadlock occurred

Occurs when a deadlock occurs.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database deadlock occurred**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0028**|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that ran the transaction that was victim of the deadlock. |
|alObjectName|Specifies the name of the AL object that ran the transaction that was victim of the deadlock.|
|alObjectName|Specifies the name of the AL object that ran the transaction that victim of the deadlock.|
|alObjectType|Specifies the type of the AL object that ran the transaction that was victim of the deadlock, such as a page or report. |
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the AppID of the extension that was involved in the deadlock.|
|extensionName|Specifies the name of the extension that was involved in the deadlock.|
|extensionVersion|Specifies the version of that was involved in the deadlock.|
|sessionId|Specifies the ID of the session that was involved by the deadlock. |
|sqlServerSessionId|Specifies the ID of the SQL server session that was the victim of the deadlock. |
|sqlStatement|Specifies the SQL statement that was the victim of in the deadlock. |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Database Lock Timeout Telemetry](administration/telemetry-database-locks-trace.md)
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
