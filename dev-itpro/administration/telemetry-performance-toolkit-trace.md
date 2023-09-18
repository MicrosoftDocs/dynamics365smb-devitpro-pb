---
title: Analyzing Performance Toolkit Telemetry
description: Learn about the telemetry for the Performance Toolkit in Business Central  
author: bverbeek
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, BCPT, Performance Toolkit, performance
ms.date: 03/22/2023
ms.author: jswymer
ms.reviewe: jswymer
---

# Analyzing Performance Toolkit Telemetry

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)] 

The Performance Toolkit (BCPT) extension is built for Independent Solution Vendors (ISVs) and Value Added Resellers (VARs) who develop vertical solutions and customize Business Central for their customers. Because things change between released versions, it's important that ISVs and VARs can test the performance of their solutions to ensure that new versions don't introduce performance regressions when the volume of users grows. To help, the Performance Toolkit lets developers simulate workloads in realistic scenarios to compare performance between builds of their solutions.

The Performance Toolkit extension helps answer questions such as, "Does my solution for Business Central support X number of users doing this, that, and the other thing at the same time?"

The extension doesn't answer questions such as, "How many orders can Business Central process per hour?"

To gather this data, you'll have to install and implement the Performance Toolkit extension.  For more information, see [The Performance Toolkit Extension](/dynamics365/business-central/dev-itpro/developer/devenv-performance-toolkit) in the Development help.

Telemetry is then logged for the following operations:

- When the BCPT header has the status Started
- When the BCPT header has the status Completed
- When the BCPT header has the status Cancelled
- When a BCPT scenario is finished

## <a name="started"></a>When the BCPT header has the status started

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
|runId|Specified the number from the BCPT header.|
|code|Specified the code from the BCPT Header.|
|currentRunType|Values are BCPT and PRT. BCPT for running all the sessions and PRT for only one itteration.|
|version|Specified the version number of the BCPT Header.|
|sessionCount|Specified the total number of all sessions.|
|test Company Name|Specified the company where the BCPT is performed.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all field monitoring traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra ID tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionName|Specifies the name of the base application. |
|extensionId|Specifies the ID of the base extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the base application.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="completed"></a>When the BCPT header has the status Completed

Occurs when the BCPT header gets the status completed.

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit run finished.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DHS**|
|runId|Specified the number from the BCPT header.|
|code|Specified the code from the BCPT Header.|
|currentRunType|Values are BCPT and PRT. BCPT for running all the sessions and PRT for only one itteration.|
|durationInMinutes|Specified the total duration in minutes of the run.|
|version|Specified the version number of the BCPT Header.|
|sessionCount|Specified the total number of all sessions.|
|test Company Name|Specified the company where the BCPT is performed.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all field monitoring traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra ID tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionName|Specifies the name of the base application. |
|extensionId|Specifies the ID of the base extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the base application.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="cancelled"></a>When the BCPT header has the status Cancelled

Occurs when the BCPT header gets the status cancelled.

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit run cancelled.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DHT**|
|runId|Specified the number from the BCPT header.|
|code|Specified the code from the BCPT Header.|
|currentRunType|Values are BCPT and PRT. BCPT for running all the sessions and PRT for only one itteration.|
|version|Specified the version number of the BCPT Header.|
|sessionCount|Specified the total number of all sessions.|
|test Company Name|Specified the company where the BCPT is performed.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all field monitoring traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra ID tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionName|Specifies the name of the base application. |
|extensionId|Specifies the ID of the base extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the base application.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="scenario"></a>When a BCPT scenario is finished

Occurs when ta BCPT scenario is finished and a log entry is written.

|Dimension|Description or value|
|---------|-----|
|message|**Performance Toolkit - {BCPT Header code} - {BCPT Scenario code} - {BCPT Line status}.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DGF**|
|runId|Specified the number from the BCPT header.|
|code|Specified the code from the BCPT Header.|
|lineNo|Specified the line number of the BCPT log entry.|
|codeunitId|Specified the codeunit ID of the scenario that is executed.|
|codeunitName|Specified the codeunit name of the scenario that is executed.|
|operation|Specified the operation name of the scenario. The name that is entered for the startScenario procedure.|
|tag|Specified the tag from the BCPT header.|
|status|Specified the status of the BCPT log Entry. This can be success or error.|
|noOfSqlStatements|Specified the number of SQL statements that is executed during the operation.|
|startTime|Specified the starting time when the operation is executed.|
|endTime|Specified the ending time when the operation is executed.|
|durationInMs|Specified the total duration in milliseconds that the operation is executed.|
|sessionNo|Specified the session number of the executed operation.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all field monitoring traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra ID tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionName|Specifies the name of the base application. |
|extensionId|Specifies the ID of the base extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the base application.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
