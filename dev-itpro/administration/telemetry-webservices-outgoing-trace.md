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

Web services telemetry gathers data about SOAP, OData, and API requests through the service. It provides information like the request's endpoint, time to complete, the SQL statements run, and more.  

As a developer, you use the data to learn about conditions that you can change to improve performance. The following table provides some examples:

|Condition|Analysis|
|---------|--------|
|A web service request results in a long running SQL query|Adjust or fine-tune code.|
|Web service requests to a specific endpoint read more rows than requests to the other endpoints|Consider adding filtering to limit the rows that are read.|
|Fewer API type requests compared with other types|With SOAP and OData requests, computation resources are used on UI elements that aren't relevant. Instead of exposing normal pages as web service endpoints, use the built-in API pages. API pages are optimized for this scenario.|
|High number of requests to endpoints that include Power BI |This condition may indicate excessive PowerBI integration.|

For more performance guidelines, see [Writing efficient Web Services](../performance/performance-developer.md#writing-efficient-web-services).

> [!NOTE]
> [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online and on-premises are configured with various limits on web service requests. For example, there is a request timeout and a maximum connections limit. For online, you can't change these limits, but it is helpful to know what the limits are. See [Current API Limits](/dynamics-nav/api-reference/v1.0/dynamics-current-limits). For on-premises, you change the limits on the Business Central Server instance. See [Configuring Business Central Server](configure-server-instance.md). Web service calls that exceed the timeout limit result in a **408 - Request Timeout**. These calls are recorded in Application Insights with a totalTime that is equal to the timeout threshold.

## General dimensions

The following table explains the general dimensions included in an outgoing **Web Services Call** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Web Service Called (Outgoing): {endpoint}**||
|severityLevel|**1**||

## Custom dimensions

The following table explains the custom dimensions included in a **Web Services Call** trace.

<!--
```
{"Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","Component version":"16.0.11329.0","componentVersion":"16.0.11329.0","Environment type":"Production","environmentType":"Production","serverExecutionTime":"00:00:00.3886441","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","component":"Dynamics 365 Business Central Server","AadTenantId":"common","aadTenantId":"common","Component":"Dynamics 365 Business Central Server","sqlExecutes":"21","sqlRowsRead":"117","totalTime":"00:00:00.3886441","alObjectType":"Page","alObjectName":"Sales Document Line Entity","alObjectId":"6403","category":"ODataV4","endpoint":"BC160/ODataV4/Company()/workflowSalesDocumentLines"}
```
-->

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alAuthenticationMethod|Specifies the ID of the AL object that was run by request.|
|alHttpTimeout||
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
|httpMethod||
|httpReturnCode |Specifies the http status code returned when a request has completed. This dimension further indicates whether request succeeded or not, and why. Use it to verify whether there was an issue with a request even though the request was logged as successful. The dimension displays one of the following values: <ul><li>**200** <br />OK. The request succeeded.</li><li>**401**<br />Access denied. The user who made the request doesn't have proper permissions. For more information, see [Web Services Authentication](../webservices/web-services-authentication.md) and [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions). </li><li>**404**<br />Not found. The given endpoint was not valid. For more information, see [Publishing a Web Service](../webservices/publish-web-service.md)</li><li>**408**<br />Request timed out. The request took longer to complete than the threshold configured for the service. For information about this threshold in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, see [OData request limits](operational-limits-online.md#ODataServices). For on-premises, the timeout is determined by the ODataServicesOperationTimeout setting of the [!INCLUDE[server](../developer/includes/server.md)]. For more information, see [Configuring Business Central Server](configure-server-instance.md#ODataServices)</li><li>**429**<br /> Too Many Requests. The request exceeded the maximum simultaneous requests allowed on the service. For information about this threshold in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, see [OData request limits](operational-limits-online.md#ODataServices). For on-premises, the timeout is determined by the ODataMaxConnections setting of the [!INCLUDE[server](../developer/includes/server.md)]. For more information, see [Configuring Business Central Server](configure-server-instance.md#ODataServices)</li></ul><br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.3.|
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
