---
title: Analyzing Cloud migration trace telemetry
description: Learn about cloud migration telemetry for Dynamics 365 Business Central  
author: jobulsin
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, cloud migration
ms.date: 05/12/2023
ms.author: jobulsin
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.custom: bap-template
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

## Replication run completed

Occurs when a replication run completes successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Replication run completed.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000K0H**|

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

## Companion table repair started

Occurs when a companion table repair is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Companion Table repair started.**|
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

Occurs when recovery operation that's run after a failed data upgrade operation has completed successfully.

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

Occurs when recovery operation that's run after a failed data upgrade operation has also failed.

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

Occurs when cloud migration was disabled for a company.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Cloud migration has been disabled from company {companyname}.**<br /><br />`{companyName}` indicates the name of the company from which cloud migration was disabled.|
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

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
