---
title: Analyzing Permission Dependency Cycle Trace Telemetry
description: Learn about the permission dependency cycle trace  telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.search.keywords: administration, dependency cycle, permission set, telemetry
ms.date: 12/21/2022
ms.author: jswymer

---
# Analyzing Permission Dependency Cycle Trace Telemetry

[!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

A permission dependency cycle occurs when a permission set depends on itself, which can happen when you build permissions sets that include other permission sets. For example, suppose you create a permission set Y that includes permission set X. If you then try modify permission set X to include permission set Y, you'll create a dependency cycle. When you create a permission dependency cycle in the Business Central client, you'll get an error similar to the following message:

**The permission set [XX] has a circular reference on path [XX]->[YY]->[XX].**

This telemetry data let's you identify and analyze permission problems that users may experience in Business Central.

## Dependency cycle discovered in permission sets

Occurs when there's permission set dependency cycle in the application.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Dependency cycle discovered in permission sets**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0032**|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alObjectId|Specifies the ID of the object causing the dependency cycle. If there's no value or the value is 0, then the error wasn't related to a specific object, which typically happens when `permissionArea` is something other than `Object`. |
|alObjectType|The type of the AL object that the user was trying to access, like a table or page. |
|clientType|[!INCLUDE[include-telemetry-dimension-client-type](../includes/include-telemetry-dimension-client-type.md)]|
|companyName|[!INCLUDE[include-telemetry-dimension-company-name](../includes/include-telemetry-dimension-company-name.md)]|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|permissionArea|The area that the dependency cycle is related to. Possible values include: `System`, `Entitlement`, `Company`, `Object`.|
|permissionType|The permission that the dependency cycle pertains to. Possible values: `Delete`, `Execute`, `Insert`, `Modify`, `Read`, `Undefined` |
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"errorMessage":"You do not have the following permission: Allow Action Automate","aadTenantId":"common","component":"Dynamics 365 Business Central Server","environmentType":"Production","telemetrySchemaVersion":"1.0","eventId":"RT0031","componentVersion":"21.0.42152.0","companyName":"CRONUS International Ltd.","clientType":"WebClient","alObjectId":"0","alObjectType":"System","permissionType":"Execute","permissionArea":"System"}
-->

## See also

[ Composing Permission Sets](../developer/devenv-permissionset-composing.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  