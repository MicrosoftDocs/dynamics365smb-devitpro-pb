---
title: Web Service Request Trace | Microsoft Docs
description: Learn about the web service request telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2020
ms.author: jswymer
---

# Analyzing Outgoing Web Service Request Telemetry

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)]

Outgoing web service request telemetry gathers data about SOAP, OData, and API requests through the service. It provides information like the request's endpoint, time to complete, the SQL statements run, and more.  

As a developer, you use the data to learn about conditions that you can change to improve performance. The following table provides some examples:

## General dimensions

The following table explains the general dimensions included in an outgoing **Web Services Call** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Web Service Called (Outgoing): {endpoint}**||
|severityLevel|**1**||

## Custom dimensions

The following table explains the custom dimensions included in a **Web Services Call** trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alAuthenticationMethod|Specifies the ID of the AL object that was run by request.|
|alHttpTimeout| |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by the request.|
|alObjectType|Specifies the type of the AL object that was run by the request.|
|companyName||
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0019**|
|extensionId|Specifies the appID of the extension that the report object belongs to.|
|extensionName|Specifies the name of the extension that the report object belongs to.|
|extensionVersion|Specifies the version of the extension that the report object belongs to.|
|httpMethod|Specifies the HTTP method used in the incoming request, Values include: POST, GET, PUT, PATCH, or DELETE. |
|httpReturnCode |Specifies the http status code returned when a request has completed. This dimension further indicates whether request succeeded or not, and why. Use it to verify whether there was an issue with a request even though the request was logged as successful. The dimension displays one of the following values: <ul><li>**200** <br />OK. The request succeeded.</li><li>**401**<br />Access denied. The user who made the request doesn't have proper permissions. For more information, see [Web Services Authentication](../webservices/web-services-authentication.md) and [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions). </li><li>**404**<br />Not found. The given endpoint was not valid.</li><li>**408**<br />Request timed out. The request took longer to complete than the threshold configured for the service. For information about this threshold in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, see [OData request limits](operational-limits-online.md#ODataServices). For on-premises, the timeout is determined by the ODataServicesOperationTimeout setting of the [!INCLUDE[server](../developer/includes/server.md)]. For more information, see [Configuring Business Central Server](configure-server-instance.md#ODataServices)</li><li>**429**<br /> Too Many Requests. The request exceeded the maximum simultaneous requests allowed on the service. For information about this threshold in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, see [OData request limits](operational-limits-online.md#ODataServices). For on-premises, the timeout is determined by the ODataMaxConnections setting of the [!INCLUDE[server](../developer/includes/server.md)]. For more information, see [Configuring Business Central Server](configure-server-instance.md#ODataServices)</li></ul><br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.3.|
|serverExecutionTime|Specifies the amount of time it took the server to complete the request\*\*. The time has the format hh:mm:ss.sssssss.|
|totalTime|Specifies the amount of time it took to process the request\*\*. The time has the format hh:mm:ss.sssssss. <br /><br />|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

### Example trace

The following code snippet is a CustomDimensions example:

`
{"Telemetry schema version":"0.2","telemetrySchemaVersion":"0.2","Component version":"17.0.15765.0","Environment type":"Production","componentVersion":"17.0.15765.0","Environment name":"Production","environmentName":"Production","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension version":"17.0.15821.0","extensionVersion":"17.0.15821.0","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","aadTenantId":"afbb64dc-bc88-43a3-9153-dd9d2fde08e6","AadTenantId":"afbb64dc-bc88-43a3-9153-dd9d2fde08e6","AL Object Id":"7203","Company name":"CRONUS USA, Inc.","AL Object type":"CodeUnit","Extension name":"Base Application","AL Object name":"CDS Environment","component":"Dynamics 365 Business Central Server","companyName":"CRONUS USA, Inc.","extensionName":"Base Application","Component":"Dynamics 365 Business Central Server","alObjectId":"7203","alObjectName":"CDS Environment","alObjectType":"CodeUnit","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","eventId":"RT0019","httpMethod":"GET","serverExecutionTime":"00:00:00.1971767","totalTime":"00:00:00.1971767","endpoint":"https://globaldisco.crm.dynamics.com/api/discovery/v1.0/Instances","alAuthenticationMethod":"AccessControlService","alHttpTimeout":"00:01:40","httpReturnCode":"200"}
`
 
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
