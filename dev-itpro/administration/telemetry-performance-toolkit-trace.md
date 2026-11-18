---
title: Performance Toolkit Trace Telemetry
description: Analyze Performance Toolkit telemetry in Business Central to monitor test runs and compare scenario duration, SQL statement counts, and execution results.
author: bverbeek
ms.topic: reference
ai-usage: ai-assisted
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, BCPT, Performance Toolkit, performance
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
---

# Analyzing Performance Toolkit telemetry

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

The Performance Toolkit (BCPT) extension is built for Independent Solution Vendors (ISVs) and Value Added Resellers (VARs) who develop vertical solutions and customize Business Central for their customers. Because things change between released versions, it's important that ISVs and VARs can test the performance of their solutions to ensure that new versions don't introduce performance regressions when the volume of users grows. To help, the Performance Toolkit lets developers simulate workloads in realistic scenarios to compare performance between builds of their solutions.

The Performance Toolkit extension helps answer questions such as, "Does my solution for Business Central support X number of users doing this, that, and the other thing at the same time?"

The extension doesn't answer questions such as, "How many orders can Business Central process per hour?"

To gather this data, you'll have to install and implement the Performance Toolkit extension. Learn more in [The Performance Toolkit Extension](/dynamics365/business-central/dev-itpro/developer/devenv-performance-toolkit) in the Development help.

Telemetry is then logged for the following operations:

- When the BCPT header has the status Running
- When the BCPT header has the status Completed
- When the BCPT header has the status Cancelled
- When a BCPT operation or scenario is finished

These events use normal verbosity (`severityLevel` **1**) and `TelemetryScope::All`, including scenario events with an error status.

## <a name="started"></a>When the BCPT header has the status running

Occurs when the BCPT header gets the status running.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit run started.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DHR**|
|alRunID|Number from the BCPT header.|
|alCode|Code from the BCPT Header.|
|alCurrentRunType|Values are BCPT and PRT. BCPT runs all the sessions and PRT runs only one iteration.|
|alVersion|Version number of the BCPT Header.|
|alSessionCount|Total number of all sessions.|
|alTest Company Name|Company where the BCPT is performed.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all Performance Toolkit traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|When present, lists deprecated dimension keys. We recommend that you update queries to use the new key names.|
|environmentName|Specifies the name of the tenant environment. Learn more in [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|extensionName|Specifies the name of the Performance Toolkit extension. |
|extensionId|Specifies the ID of the Performance Toolkit extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the Performance Toolkit extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="completed"></a>When the BCPT header has the status completed

Occurs when the BCPT header gets the status completed.

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit run finished.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DHS**|
|alRunID|Number from the BCPT header.|
|alCode|Specified the code from the BCPT Header.|
|alCurrentRunType|Values are BCPT and PRT. BCPT for running all the sessions and PRT for only one iteration.|
|alDurationInMinutes|Specified the total duration in minutes of the run.|
|alVersion|Specified the version number of the BCPT Header.|
|alSessionCount|Specified the total number of all sessions.|
|alTest Company Name|Specified the company where the BCPT is performed.|

<a name="completed-dimensions"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all Performance Toolkit traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|When present, lists deprecated dimension keys. We recommend that you update queries to use the new key names.|
|environmentName|Specifies the name of the tenant environment. Learn more in [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|extensionName|Specifies the name of the Performance Toolkit extension. |
|extensionId|Specifies the ID of the Performance Toolkit extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the Performance Toolkit extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="cancelled"></a>When the BCPT header has the status cancelled

Occurs when the BCPT header gets the status cancelled.

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit run cancelled.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DHT**|
|alRunID|Specified the number from the BCPT header.|
|alCode|Specified the code from the BCPT Header.|
|alCurrentRunType|Values are BCPT and PRT. BCPT for running all the sessions and PRT for only one iteration.|
|alVersion|Specified the version number of the BCPT Header.|
|alSessionCount|Specified the total number of all sessions.|
|alTest Company Name|Specified the company where the BCPT is performed.|

<a name="cancelled-dimensions"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all Performance Toolkit traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|When present, lists deprecated dimension keys. We recommend that you update queries to use the new key names.|
|environmentName|Specifies the name of the tenant environment. Learn more in [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|extensionName|Specifies the name of the Performance Toolkit extension. |
|extensionId|Specifies the ID of the Performance Toolkit extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the Performance Toolkit extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="scenario"></a>When a BCPT scenario is finished

Occurs when a BCPT operation or scenario is finished and a log entry is written.

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit - {BCPT Header code} - {Scenario label} - {BCPT log entry status}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DGF**|
|alRunID|Specified the number from the BCPT header.|
|alCode|Specified the code from the BCPT Header.|
|alLineNo|Specifies the BCPT configuration line number associated with the log entry.|
|alVersion|Specifies the version number recorded in the BCPT log entry.|
|alCodeunitId|Specified the codeunit ID of the scenario that is executed.|
|alCodeunitName|Specified the codeunit name of the scenario that is executed.|
|alOperation|Specifies the operation name recorded in the log entry.|
|alTag|Specified the tag from the BCPT header.|
|alStatus|Specified the status of the BCPT log Entry. This can be success or error.|
|alStackTrace|Specifies the error call stack. Included only when the log entry has an error status.|
|alMessage|Specifies the message recorded in the log entry.|
|alNoOfSqlStatements|Specified the number of SQL statements that is executed during the operation.|
|alStartTime|Specified the starting time when the operation is executed.|
|alEndTime|Specified the ending time when the operation is executed.|
|alDurationInMs|Specified the total duration in milliseconds that the operation is executed.|
|alSessionNo|Specified the session number of the executed operation.|

The scenario label in the message is `Scenario` in English and can be localized. It isn't the codeunit or operation name. Use `alCodeunitName` and `alOperation` to identify the work being measured.

<a name="scenario-dimensions"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all Performance Toolkit traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|When present, lists deprecated dimension keys. We recommend that you update queries to use the new key names.|
|environmentName|Specifies the name of the tenant environment. Learn more in [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|extensionName|Specifies the name of the Performance Toolkit extension. |
|extensionId|Specifies the ID of the Performance Toolkit extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the Performance Toolkit extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
