---
title: Database Lock Timeout Trace Telemetry | Microsoft Docs
description: Learn about the database lock timeout Trace Telemetry telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---

# Analyzing Database Lock Timeout Trace Telemetry

**INTRODUCED IN:** Business Central 2020 release wave 1, version 16.0

Database lock timeout telemetry gathers information about database locks that have timed out. The telemetry data allows you to troubleshoot what caused these locks.

In the client, when a lock has timed out, the user is presented with a message, similar to the following message:

*The operation could not complete because a record in the [table name] table was locked by another user. Please retry the activity.*

Two types of trace events are emitted to Application Insights:

- The first is a **Database lock timed out** event. This event includes general information about the lock request. This event includes information like the AL object and code that is impacted by the lock, the extension involved, and more.

- The **Database lock timed out** event then triggers one or more **Database lock snapshot** events. **Database lock snapshot** events provide details about SQL sessions that hold database locks at the time of lock timeout, including the session that caused the lock timeout. These events include specific details about the SQL lock request on the database, like the type, status, mode, and the table.


> [!TIP]
> When analyzing database lock timeout telemetry, it's useful to look at combined data from the **Database lock timed out** event and **Database lock snapshot** events. You can combine data from different events by using *joins* in your Kusto queries. For an example, see [LockTimeouts.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/KQL/LockTimeouts.kql) in the **Microsoft/BCTech** repository on GitHub. For more general information about using joins, see [Joins in Azure Monitor log queries](/azure/azure-monitor/log-query/joins) in the Microsoft Azure documentation.

## Database lock timed out

Occurs when a database lock has timed out.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database lock timed out**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alExecutingMethodScope|Specifies the AL action that is running the transaction that caused the lock.|
|alObjectId|Specifies the ID of the running AL object that requested the lock. |
|alObjectName|Specifies the name of the running AL object that requested the lock. not shown|
|alObjectType|Specifies the type of the running AL object that requested the lock, such as a page or report. |
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0012**|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the AppID of the extension that was involved in the lock.|
|extensionName|Specifies the name of the extension that was involved in the lock.|
|extensionVersion|Specifies the version of that was involved in the lock.|
|sessionId|Specifies the ID of the session that requested the lock. |
|snapshotId|Specifies the ID of the database snapshot. This ID is used to identify associated **Database lock snapshot** trace events.|
|sqlServerSessionId|Specifies the ID of the SQL server session that requested the lock. |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Database lock snapshot

Occurs when a database lock has timed out. Each **Database lock snapshot** trace event is associated with a specific **Database lock timed out** trace event.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database lock snapshot: {snapshotId}**<br /><br />The value of the `{snapshotId}` maps to the `snapshotId` dimension of the **Database lock timed out** trace event that triggered this event.|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alExecutingMethodScope|Specifies the AL action that is running the transaction that caused the lock.|
|alObjectId|Specifies the ID of the running AL object that requested the lock. |
|alObjectName|Specifies the name of the running AL object that requested the lock.|
|alObjectType|Specifies the type of the running AL object that requested the lock, such as a page or report. |
|alStackTrace|The stack trace in AL.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0013**|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the AppID of the extension that was involved in the lock.|
|extensionName|Specifies the name of the extension that was involved in the lock.|
|extensionVersion|Specifies the version of that was involved in the lock.|
|sessionId|Specifies the ID of the session that requested the lock. |
|snapshotId|Specifies the ID of the database snapshot. All messages in the snapshot share this ID.  |
|sqlLockRequestMode|Specifies the lock mode that determines how concurrent transactions can access the resource. For more information, see [Lock Modes](https://aka.ms/sqldatabaselockmodes). |
|sqlLockRequestStatus|Specifies the current status of the lock, which can be one of the following values:<ul><li>`CNVRT` - means that the lock is transitioning from another mode, but the conversion is blocked by another process that holds a lock with a conflicting mode.</li><li>`GRANT` - means that the lock is active.</li><li>`WAIT`- means that the lock is blocked by another process that holds a lock with a conflicting mode.</li></ul> |
|sqlLockResourceType|Specifies the database resource affected by the lock. For example, `DATABASE`, `FILE`, `OBJECT`, `PAGE`, `KEY`, and more. |
|sqlServerSessionId|Specifies the ID of the SQL server session that requested the lock. |
|sqlTableName|Specifies the name of table on which the lock was held.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
