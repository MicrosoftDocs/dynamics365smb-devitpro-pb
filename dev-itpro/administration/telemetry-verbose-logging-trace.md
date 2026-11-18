---
title: Analyzing Verbose Logging Telemetry
description: Analyze verbose logging telemetry in Business Central to see when additional logging starts and ends for a session while troubleshooting user problems.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Analyzing verbose telemetry

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)] 

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] users can temporarily set up their session to emit more verbose telemetry by going to the **Help and Support** page in the client and selecting **Additional Logging**. They'll typically only do this when asked by a partner or support representative to help troubleshoot problems. This additional logging applies to the current session for 15 minutes. It doesn't enable verbose logging for other users.

A telemetry trace is recorded whenever additional logging is turned on or off.

Learn more in [Resources for Help and Support](/dynamics365/business-central/product-help-and-support#troubleshooting).

## <a name="enabled"></a>Verbose telemetry enabled for session

Occurs when additional logging is turned on from the **Help and Support** page in the client or by an AL call to enable verbose telemetry.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|
|message|**Verbose telemetry enabled for session: {sessionId}**|
|severityLevel|**1**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. This dimension is only for traces from Business Central online. Learn more in [Managing environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**RT0023**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"20.0.36722.0","environmentType":"Production","aadTenantId":"aaaabbbb-0000-cccc-1111-dddd2222eeee","component":"Dynamics 365 Business Central Server","eventId":"RT0023"}

-->

## <a name="disabled"></a>Verbose telemetry disabled for session

Occurs when the session's temporary verbose logging override is reset, including when its duration expires. This event doesn't specifically indicate that the user closed the browser or signed out.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|
|message|**Verbose telemetry disabled for session: {sessionId}**|
|severityLevel|**1**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0024**|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. This dimension is only for traces from Business Central online. Learn more in [Managing environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"20.0.36722.0","environmentType":"Production","aadTenantId":"aaaabbbb-0000-cccc-1111-dddd2222eeee","component":"Dynamics 365 Business Central Server","eventId":"RT0024"}

-->

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
