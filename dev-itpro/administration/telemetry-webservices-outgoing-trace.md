---
title: Outgoing Web Service Request Trace | Microsoft Docs
description: Learn about the outgoing web service request telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---

# Analyzing Outgoing Web Service Request Telemetry

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)]

Outgoing web service request telemetry gathers data about outgoing web service requests sent using the AL HTTPClient module. As a partner, the data gives you insight into the execution time and failures that happen in external services that your environment and extensions depend on. Use the data to monitor environments for performance issues caused by external services, and be more proactive in preventing issues from occurring.

## General dimensions

The following table explains the general dimensions included in an outgoing **Web Services Call (Outgoing)** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|-----------|
|message|**Web Service Called (Outgoing): {endpoint}**|
|severityLevel|**1**|

## Custom dimensions

The following table explains the custom dimensions included in a **Web Services Call** trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alAuthenticationMethod|Specifies the user authentication used by the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service . Values include: Windows, UserName, NavUserPassword, AccessControlService. For more information about the authentication types, see [Authentication and Credential Types](users-credential-types.md).|
|alHttpTimeout|Specifies the timeout defined for the request. The timeout is the time to wait before a request gets canceled. The value has the format hh:mm:ss. <br /><br />The timeout is defined either by the [NavHttpClientMaxTimeout](configure-server-instance.md#Development) setting on the [!INCLUDE[server](../developer/includes/server.md)] instance or by a [TimeOut method](../developer/methods-auto/httpclient/httpclient-timeout-method.md) call in extension code. The TimeOut method call takes precedence. |
|alObjectId|Specifies the ID of the AL object that made the request.|
|alObjectName|Specifies the name of the AL object that made the request.|
|alObjectType|Specifies the type of the AL object that made the request.|
|companyName|Specifies the display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company from which the request was made.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request. The endpoint is cleaned to include only the base URI. |
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0019**|
|extensionId|Specifies the appID of the extension that made the request.|
|extensionName|Specifies the name of the extension that made the request.|
|extensionVersion|Specifies the version of the extension that made the request.|
|httpMethod|Specifies the HTTP method used in the outgoing request. Values include: POST, GET, PUT, PATCH, or DELETE. |
|httpReturnCode |Specifies the http status code returned when a request has completed. This dimension further indicates whether request succeeded or not, and why. Use it to verify whether there was an issue with a request even though the request was logged as successful. The dimension displays one of the following values: <ul><li>**200** <br />OK. The request succeeded.</li><li>**404**<br />Not found. The given endpoint wasn't valid.</li></li></ul>|
|serverExecutionTime|Specifies the amount of time it took the server to complete the request, including the time to open the company. The time has the format hh:mm:ss.sssssss.|
|totalTime|Specifies the amount of time it took to process the request, including the time to open the company. The time has the format hh:mm:ss.sssssss. <br /><br />|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

### Example trace

The following code snippet is a CustomDimensions example:

`
{"Telemetry schema version":"0.2","telemetrySchemaVersion":"0.2","Component version":"17.0.15765.0","Environment type":"Production","componentVersion":"17.0.15765.0","Environment name":"Production","environmentName":"Production","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension version":"17.0.15821.0","extensionVersion":"17.0.15821.0","Extension App Id":"11111111-aaaa-2222-bbbb-333333333333","aadTenantId":"afbb64dc-bc88-43a3-9153-dd9d2fde08e6","AadTenantId":"afbb64dc-bc88-43a3-9153-dd9d2fde08e6","AL Object Id":"7203","Company name":"CRONUS USA, Inc.","AL Object type":"CodeUnit","Extension name":"Base Application","AL Object name":"My Codeunit","component":"Dynamics 365 Business Central Server","companyName":"CRONUS USA, Inc.","extensionName":"Base Application","Component":"Dynamics 365 Business Central Server","alObjectId":"7203","alObjectName":"My Codeunit","alObjectType":"CodeUnit","extensionId":"11111111-aaaa-2222-bbbb-333333333333","eventId":"RT0019","httpMethod":"GET","serverExecutionTime":"00:00:00.1971767","totalTime":"00:00:00.1971767","endpoint":"https://mycorp.dynamics.com/api/discovery/v1.0/Instances","alAuthenticationMethod":"AccessControlService","alHttpTimeout":"00:01:40","httpReturnCode":"200"}
`
 
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
