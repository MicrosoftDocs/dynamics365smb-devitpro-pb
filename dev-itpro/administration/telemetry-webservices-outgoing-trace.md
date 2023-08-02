---
title: Outgoing Web Service Request Trace
description: Learn about the outgoing web service request telemetry in Business Central  
author: kennienp
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 06/01/2023
ms.author: kepontop
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms-custom: bap-template
---

# Analyzing outgoing web service request telemetry

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)]

Outgoing web service request telemetry gathers data about outgoing web service requests sent using the AL HTTPClient module. As a partner, the data gives you insight into the execution time and failures that happen in external services that your environment and extensions depend on. Use the data to monitor environments for performance issues caused by external services, and be more proactive in preventing issues from occurring.

## General dimensions

The following table explains the general dimensions included in an outgoing **Web Services Call (Outgoing)** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|--------------|
|message|**Web Service Called (Outgoing): {endpoint}**|
|severityLevel|**1**|

## Custom dimensions

The following table explains the custom dimensions included in a **Web Services Call** trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alAuthenticationMethod|Specifies the user authentication used by the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service . Values include: Windows, UserName, NavUserPassword, AccessControlService. For more information about the authentication types, see [Authentication and Credential Types](users-credential-types.md).|
|alHttpTimeout|Specifies the timeout defined for the request. The timeout is the time to wait before a request gets canceled. The value has the format hh:mm:ss. <br /><br />The timeout is defined either by the [NavHttpClientMaxTimeout](configure-server-instance.md#Development) setting on the [!INCLUDE[server](../developer/includes/server.md)] instance or by a [TimeOut method](../developer/methods-auto/httpclient/httpclient-timeout-method.md) call in extension code. The TimeOut method call takes precedence. |
|alObjectId|Specifies the ID of the AL object that made the request.|
|alObjectName|Specifies the name of the AL object that made the request.|
|alObjectType|Specifies the type of the AL object that made the request.|
|alStackTrace| [!INCLUDE[alStackTrace](../includes/include-telemetry-dimension-al-stacktrace.md)] Introduced in version 20.1.|
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)]  Introduced in version 21.3.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request. The endpoint is cleaned to include only the base URI. |
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0019**|
|extensionId|Specifies the appID of the extension that made the request.|
|extensionName|Specifies the name of the extension that made the request.|
|extensionPublisher|Specifies the publisher of the extension that made the request.|
|extensionVersion|Specifies the version of the extension that made the request.|
|httpHeaders|Specifies the http headers set in the request. </br></br>Introduced in version 17.2.|
|httpMethod|Specifies the HTTP method used in the outgoing request. Values include: POST, GET, PUT, PATCH, or DELETE. |
|httpReturnCode | **Deprecated in version 17.2. Use the dimension httpStatusCode instead.**  Specifies the http status code returned when a request has completed. This dimension further indicates whether request succeeded or not, and why. Use it to verify whether there was an issue with a request even though the request was logged as successful. The dimension displays one of the following values: <ul><li>**200** <br />OK. The request succeeded.</li><li>**404**<br />Not found. The given endpoint wasn't valid.</li></li></ul>|
|httpStatusCode |Specifies the http status code returned when a request has completed. This dimension further indicates whether request succeeded or not, and why. Use it to verify whether there was an issue with a request even though the request was logged as successful. The dimension displays one of the following values: <ul><li>**200** <br />OK. The request succeeded.</li><li>**404**<br />Not found. The given endpoint wasn't valid.</li></li></ul>In the case of a failure, the reason for the underlying issue could be network connectivity, DNS failure, server certificate validation or timeout. The Business Central Server does not know which if these it might be. |
|serverExecutionTime|Specifies the amount of time it took the server to complete the request, including the time to open the company. The time has the format hh:mm:ss.sssssss.|
|totalTime|Specifies the amount of time it took to process the request, including the time to open the company. The time has the format hh:mm:ss.sssssss. <br /><br />|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Sample KQL code 
This KQL code can help you get started analyzing outgoing web service calls. 

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0019'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, alAuthenticationMethod = customDimensions.alAuthenticationMethod
, alHttpTimeout = customDimensions.alHttpTimeout
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, alStackTrace = customDimensions.alStackTrace // This dimension was introduced in Business Central 2022 release wave 1, version 20.1.
, clientType = customDimensions.clientType // This dimension was introduced in Business Central 2022 release wave 2, version 21.4.
, endpoint = customDimensions.endpoint
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, httpMethod = toupper( customDimensions.httpMethod ) // httpMethod is logged as the value used in the AL code
, httpStatusCode = case( isnotempty(customDimensions.httpStatusCode), customDimensions.httpStatusCode, customDimensions.httpReturnCode ) 
, httpHeaders = customDimensions.httpHeaders       
, executionTime = customDimensions.serverExecutionTime
, executionTimeInMS = toreal(totimespan(customDimensions.serverExecutionTime))/10000 //the datatype for executionTime is timespan
, usertelemetryId = case(
  // user telemetry id was introduced in the platform in version 20.0
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id
, 'N/A'
)
// these three lines httpHeadersTmp, httpHeadersJSON, and Authorization illustrate how to extract data from the httpHeaders dimension
| extend httpHeadersTmp =  tostring( httpHeaders )
| extend httpHeadersJSON = parse_json(httpHeadersTmp)
| extend Authorization = tostring( httpHeadersJSON.['Authorization'] )
```

## Performance considerations

[!INCLUDE[httpclientPerformance](../includes/performance-outgoing-http.md)] 

## Troubleshoot errors

[!INCLUDE[httpclientErrors](../includes/errors-outgoing-http.md)] 

### HTTP status codes

[!INCLUDE[httpStatusCodes](../includes/include-http-status-codes.md)]


## See also

[HttpClient data type](../developer/methods-auto/httpclient/httpclient-data-type.md)  
[Telemetry overview](telemetry-overview.md)  
[Enable sending telemetry to Application Insights](telemetry-enable-application-insights.md)  
