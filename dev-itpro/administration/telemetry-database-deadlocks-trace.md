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

Database deadlock telemetry gathers information about database deadlocks. The telemetry data allows you to troubleshoot what caused these deadlock situations. Note that a database deadlock is different than a database lock timeout. A database lock timeout happens if a session is unsuccesful getting a database lock within the time limit configured by the BC server.

TODO
In the client, when a lock has timed out, the user is presented with a message, similar to the following message:
*The operation could not complete because a record in the [table name] table was locked by another user. Please retry the activity.*


> [!TIP]
> When analyzing database deadlock telemetry, it's useful to look historically in telemetry for other sessions that experience deadlocks on other sql queries. With a bit of luck, these are the counterparts in the deadlock situation.


## Database deadlock occurred
Occurs when a database deadlock happens. A deadlock occurs when there is a cyclic dependency between two or more threads, or processes, for some set of resources within SQL Server.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database deadlock occurred**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the running AL object that experienced the deadlock. |
|alObjectName|Specifies the name of the running AL object that experienced the deadlock. |
|alObjectType|Specifies the type of the running AL object that experienced the deadlock.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0028**|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the AppID of the extension for the AL object that experienced the deadlock.|
|extensionName|Specifies the name of the extension for the AL object that experienced the deadlock.|
|extensionVersion|Specifies the version of the extension for the AL object that experienced the deadlock.|
|sessionId|Specifies the ID of the session that experienced the deadlock. |
|sqlServerSessionId|Specifies the ID of the SQL server session that experienced the deadlock. |
|sqlStatement| Specifies the SQL statement that experienced the deadlock. |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Database Lock Timeout Telemetry](administration/telemetry-database-locks-trace.md)
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
