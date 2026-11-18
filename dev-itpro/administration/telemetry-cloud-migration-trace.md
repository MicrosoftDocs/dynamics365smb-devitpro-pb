---
title: Cloud Migration Telemetry in Business Central
description: Analyze Business Central cloud migration telemetry to monitor replication runs, companion table repairs, data upgrades, and migration status.
author: jobulsin
ms.topic: reference
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, cloud migration
ms.date: 11/17/2026
ms.author: jobulsin
ms.reviewer: jswymer

ms.custom: bap-template
ai-usage: ai-assisted
---

# Analyzing cloud migration trace telemetry

**INTRODUCED IN:** Business Central 2023 release wave 1, version 22.1

Cloud migration telemetry gathers data about the success or failure of the following operations:

- Replication runs
- Cloud migration setup
- Data upgrade 

Failed operations result in a trace log entry that includes a reason for the failure.

## Replication run started

Occurs when a replication run starts.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Replication run started.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000K0J**|
|alCategory|**CloudMigration**.|
|alReplicationType|The type of replication run: **Data Replication**, **Azure Data Lake**, or **Diagnostic**.|
|alSourceProduct|The product ID configured for cloud migration.|

## Replication run completed

Occurs when a replication run completes, including when tables have failed. If tables have failed, the **AL0000K0I** event is also emitted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Replication run completed.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000K0H**|
|alCategory|**CloudMigration**.|
|alReplicationType|The type of replication run: **Data Replication**, **Azure Data Lake**, or **Diagnostic**.|
|alSourceProduct|The product ID configured for cloud migration, if the setup record is available.|

## Replication run completed with failed tables

Occurs when a replication run completes with failed tables.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Replication run completed with failed tables.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000K0I**|
|alCategory|**CloudMigration**.|
|alReplicationType|The type of replication run: **Data Replication**, **Azure Data Lake**, or **Diagnostic**.|
|alSourceProduct|The product ID configured for cloud migration, if the setup record is available.|
|alHasFailures|**true**. Indicates that the replication run has failed tables.|
|alNumberOfFailedTables|The number of tables that failed in the replication run.|
|alDetails|Additional details from the replication run summary.|

## Companion table repair scheduled

Occurs when a companion table repair is scheduled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Companion table repair scheduled.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000FXC**|
|alCategory|**CloudMigration**. Use this dimension to distinguish the cloud migration event from other events with the same ID.|

## Companion table repair started

Occurs when a companion table repair is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Companion table repair started.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000FJ1**|
|alCategory|**CloudMigration**.|

## Companion table repair completed successfully

Occurs when a companion table repair has succeeded.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Companion table repair completed successfully.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000FJ4**|
|alCategory|**CloudMigration**.|

## Cloud migration data upgrade scheduled

Occurs when a data upgrade has been scheduled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Cloud Migration data upgrade scheduled.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000K0K**|
|alCategory|**CloudMigration**.|
|alSourceProduct|The product ID configured for cloud migration, if the setup record is available.|

## Environment data upgrade operation started

Occurs when a data upgrade operation on an environment is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment data upgrade operation started: {environmentName}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0175**|

## Environment data upgrade operation completed successfully

Occurs when a data upgrade operation on an environment has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment data upgrade operation completed successfully: {environmentName}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0176**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment data upgrade operation failed

Occurs when a data upgrade operation on an environment has failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment data upgrade operation failed: {environmentName}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0177**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Recovery from a failed data upgrade operation has completed successfully

Occurs when a recovery operation that's run after a failed data upgrade operation has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Recovery from a failed data upgrade operation has completed successfully: {environmentName}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0178**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Recovery from a failed data upgrade operation has failed

Occurs when a recovery operation that's run after a failed data upgrade operation has also failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Recovery from a failed data upgrade operation has failed: {environmentName}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0179**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Cloud migration disabled

Occurs when cloud migration is disabled for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Cloud migration has been disabled.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000IGC**|
|alCategory|**CloudMigration**.|
|alDisabledReason|The reason recorded in the cloud migration setup: **Abandoned**, **Completed**, **Paused**, or an empty value if no reason is available.|
|alDisabledReasonDescription|The reason text supplied when cloud migration is disabled.|
|alSourceProduct|The product ID configured for cloud migration, if the setup record is available.|

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
