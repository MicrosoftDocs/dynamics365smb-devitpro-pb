---
title: Analyzing Permission Dependency Cycle Trace Telemetry
description: Analyze permission dependency cycle telemetry in Business Central to identify circular permission set references and investigate the dependency path.
author: jswymer

ms.topic: concept-article
ms.search.keywords: administration, dependency cycle, permission set, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
# Analyzing permission dependency cycle trace telemetry

[!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

A permission dependency cycle occurs when a permission set depends on itself, which can happen when you build permission sets that include other permission sets. For example, suppose you create a permission set Y that includes permission set X. If you then try to modify permission set X to include permission set Y, you create a dependency cycle. When you create a permission dependency cycle in the Business Central client, you get an error similar to the following message:

**The permission set [XX] has a circular reference on path [XX]->[YY]->[XX].**

This telemetry data lets you identify and analyze permission problems that users might experience in Business Central.

## Dependency cycle discovered in permission sets

Occurs when a permission set dependency cycle is logged while permission sets are expanded or validated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Dependency cycle discovered in permission sets.**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0032**|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alObjectId|Specifies the ID of the AL object in the current execution context. This value doesn't identify a permission set in the cycle.|
|alObjectName|Specifies the name of the AL object in the current execution context.|
|alObjectType|Specifies the type of the AL object in the current execution context.|
|alStackTrace|[!INCLUDE[alStackTrace](../includes/include-telemetry-dimension-al-stacktrace.md)]|
|clientType|[!INCLUDE[include-telemetry-dimension-client-type](../includes/include-telemetry-dimension-client-type.md)]|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments. Learn more in [Managing environments](tenant-admin-center-environments.md).|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|permissionSetCycle|The dependency path of the permission sets in the cycle. Long paths are truncated in the middle to retain the start and end of the cycle.|
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"errorMessage":"You do not have the following permission: Allow Action Automate","aadTenantId":"common","component":"Dynamics 365 Business Central Server","environmentType":"Production","telemetrySchemaVersion":"1.0","eventId":"RT0031","componentVersion":"21.0.42152.0","companyName":"CRONUS International Ltd.","clientType":"WebClient","alObjectId":"0","alObjectType":"System","permissionType":"Execute","permissionArea":"System"}
-->

## Related information

[Composing Permission Sets](../developer/devenv-permissionset-composing.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
