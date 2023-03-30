---
title: Analyzing Database Wait Statistics Telemetry
description: Learn about the telemetry for database wait statics for Business Central in Azure Application Insights.  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 06/16/2022
ms.author: jswymer
---

# Analyzing Database Wait Statistics Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2022 release wave 1, version 20.0, and later

[!INCLUDE[include_telemetry_database_wait_statistics_md](../includes/include-telemetry-database-wait-statistics.md)]

[!INCLUDE[include_note_database_wait_statistics_md](../includes/include-note-database-wait-statistics.md)]

## <a name="waitstatstaken"></a>Database wait statistics snapshot taken

Occurs when you choose the **Emit Telemetry** icon on the Database Wait Statistics view in the client.

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

## <a name="other"></a>**Common custom dimensions**

The following table explains custom dimensions that are common to all database wait statistic traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="waitstatsentry"></a>Database wait statistics snapshot entry

Occurs when a query has to wait because of a resource, queue, or external event in the client. It's the snapshot entry for each wait category.

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
|databaseSignalWaitTimeInMs|Specifies the time difference between when the query was signaled to wait and when it starts to process. |
|databaseStartedDuration|Specifies the date and time when the database was started. |
|databaseWaitingTasksCount|Specifies the total number of waits for a wait category.|
|databaseWaitStatisticsCategory|Specifies which type of wait a query is experiencing.|
|databaseWaitTimeInMs|Specifies the total wait time for a wait category including the databaseSignalWaitTimeInMs.|
|[See common custom dimensions](#other)||


## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Performance for Developers](../performance/performance-developer.md)  
[How to work with a performance problem](../performance/performance-work-perf-problem.md)  
