---
title: Analyzing Database Deadlock Telemetry
description: Analyze database deadlock telemetry in Business Central to identify deadlock victims, inspect SQL statements and AL stack traces, and troubleshoot contention.
author: jswymer

ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Analyzing database deadlock telemetry

**INTRODUCED IN:** Business Central 2022 release wave 1, version 20.0

The database deadlock telemetry gathers information about deadlocks that happen. Deadlocks can prevent users from completing tasks in the Business Central client. A deadlock occurs when two or more processes block each other because each has locked a database resource. SQL Server terminates and rolls back one of the transactions, known as the deadlock victim. Business Central then emits a telemetry signal for the affected session.

As a partner or developer, this telemetry provides several benefits:

- Makes you aware that there are deadlocks happening.
- Lets you identify who was the victim in deadlock situations.
- In some deadlock problems, the process that is the victim and the process that succeeds will change by chance. In these cases, both will be stored in the telemetry resource as different deadlock events.
- For further monitoring and troubleshooting, this telemetry is complemented by other features like:
  - Enable SQL database deadlock monitoring on a sandbox or on-premises environment. Learn more in [Monitoring SQL Database Deadlocks](monitor-database-deadlocks.md).
  - Database lock trace telemetry. Learn more in [Database lock trace telemetry](telemetry-database-locks-trace.md).

> [!IMPORTANT]
> The `EnableDeadlockMonitoring` server setting controls the separate SQL deadlock monitoring feature. It isn't required to collect the RT0028 telemetry event. Learn more in [Monitoring SQL Database Deadlocks](monitor-database-deadlocks.md).

## Database deadlock occurred

Occurs when a deadlock occurs.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database deadlock occurred**|
|severityLevel|**3**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0028**|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that ran the transaction that was victim of the deadlock. |
|alObjectName|Specifies the name of the AL object that ran the transaction that was victim of the deadlock.|
|alObjectType|Specifies the type of the AL object that ran the transaction that was victim of the deadlock, such as a page or report. |
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL statement, such as `Background` or `WebClient`. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. Learn more in [Managing environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|extensionId|Specifies the AppID of the extension that was involved in the deadlock.|
|extensionName|Specifies the name of the extension that was involved in the deadlock.|
|extensionVersion|Specifies the version of the extension that was involved in the deadlock.|
|sessionId|Specifies the ID of the session that was involved in the deadlock. |
|sqlServerSessionId|Specifies the ID of the SQL server session that was the victim of the deadlock. |
|sqlStatement|Specifies the SQL statement that was executing in the deadlock victim's transaction. |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Database Lock Timeout Telemetry](telemetry-database-locks-trace.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
