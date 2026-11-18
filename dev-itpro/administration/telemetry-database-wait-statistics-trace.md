---
title: Analyzing Database Wait Statistics Telemetry
description: Analyze database wait statistics telemetry in Business Central to compare wait categories, correlate snapshot entries, and investigate database performance.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Analyzing database wait statistics telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2022 release wave 1, version 20.0, and later

[!INCLUDE[include_telemetry_database_wait_statistics_md](../includes/include-telemetry-database-wait-statistics.md)]

[!INCLUDE[include_note_database_wait_statistics_md](../includes/include-note-database-wait-statistics.md)]

## <a name="waitstatstaken"></a>Database wait statistics snapshot taken

Occurs when a database wait statistics snapshot is requested, such as when you select **Emit Telemetry** on the **Database Wait Statistics** page in the client. A snapshot is also taken when additional logging starts or ends.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database wait statistics snapshot taken: {snapshotId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0025**|
|snapshotId|Specifies the ID given to the snapshot.|

## <a name="other"></a>Common custom dimensions

The following table explains custom dimensions that are common to all database wait statistic traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="waitstatsentry"></a>Database wait statistics snapshot entry

Occurs for each wait category included in a database wait statistics snapshot. Each entry contains aggregated SQL wait statistics, not an event for an individual query waiting in the client.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Database wait statistics snapshot entry: {databaseWaitStatisticsCategory}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0026**|
|snapshotId|Specifies the ID given to the snapshot.|
|databaseMaxWaitTimeInMs|Specifies the maximum wait time in milliseconds for a specific wait category.|
|databaseSignalWaitTimeInMs|Specifies the total time in milliseconds that tasks in the wait category spent waiting to run after being signaled that their resource was available.|
|databaseStartedDuration|Specifies the elapsed time in milliseconds since SQL Server started.|
|databaseWaitingTasksCount|Specifies the total number of waits for a wait category.|
|databaseWaitStatisticsCategory|Specifies which type of wait a query is experiencing.|
|databaseWaitTimeInMs|Specifies the total wait time for a wait category including the databaseSignalWaitTimeInMs.|
|[See common custom dimensions](#other)||


## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Performance for Developers](../performance/performance-developer.md)  
[How to work with a performance problem](../performance/performance-work-perf-problem.md)  
