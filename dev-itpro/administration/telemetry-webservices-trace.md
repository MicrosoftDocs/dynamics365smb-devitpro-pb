---
title: Web Service Request Trace
description: Learn about the web service request telemetry in Business Central  
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 02/19/2024
ms.author: kepontop
ms.reviewer: jswymer
ms.custom: bap-template
---

# Analyzing Incoming Web Services Request Telemetry

[!INCLUDE[2020_releasewave1.md](../includes/2020_releasewave1.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Web services telemetry gathers data about SOAP, OData, and REST API requests to the service. It provides information like the request's endpoint, time to complete, HTTP status codes, and more.  

## General dimensions

The following table explains the general dimensions included in an incoming **Web Services Call** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|
|message|<ul><li>**Web service called (API): {endpoint}**</li><li>**Web service called (ODataV4): {endpoint}**</li><li>**Web service called (ODataV3): {endpoint}**</li><li>**Web service called (SOAP): {endpoint}**</li></ul>|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)]. This dimension was introduced in Business Central 2024 release wave 1, version 24.2. |

### General dimensions (version 16.0 and earlier)

In versions 16.0 and earlier, the general dimensions look like this:

|Dimension|Description or value|
|---------|-----|
|operation_Name|**Web Services Call**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|message| Before version 16.1:<ul><li>**Received a web service request of type API**</li><li>**Received a web service request of type ODataV4**</li><li>**Received a web service request of type ODataV3**</li><li>**Received a web service request of type SOAP**|


## Custom dimensions

The following table explains the custom dimensions included in a **Web Services Call** telemetry event.

For a full KQL example of all dimensions in web services telemetry, see [Sample KQL code](#sample-kql-code).


|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by the request.<sup>[\[1\]](#1)</sup>|
|alObjectName|Specifies the name of the AL object that was run by the request.<sup>[\[1\]](#1)</sup>|
|alObjectType|Specifies the type of the AL object that was run by the request.<sup>[\[1\]](#1)</sup>|
|category|Specifies the web service type. Values include: **API**, **ODataV4**, **ODataV3**, and **SOAP**.|
|companyName| The company name in which the request runs. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|diagnosticsMessage | Logged in case of an error in a OData/API call. <br /><br/>This dimension was introduced in Business Central 2023 release wave 1, version 22.0.|
|endpoint|Specifies the endpoint for the request.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)| 
|eventId|**RT0008**<br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.1.|
|extensionId|Specifies the appID of the app/extension that the object belongs to.|
|extensionName|Specifies the name of the app/extension that the object belongs to.|
|extensionVersion|Specifies the version of the app/extension that the object belongs to.|
|extensionPublisher|Specifies the publisher of the app/extension that the object belongs to.|
|failureReason | Logged in case of an error in a OData/API request. Contains the exception as seen from the server. <br /><br/>This dimension was introduced in Business Central 2023 release wave 1, version 22.0.|
|httpHeaders|Introduced in version 16.3. Specifies the http headers set in the request. Not logged for SOAP requests. In version 17.3, a truncated version of the Authorization header was introduced to enable querying for the use of basic or token authorization. For more information, see [HTTP headers](#http-headers). |
|httpMethod|Introduced in version 16.3. Specifies the HTTP method used in the request. Values include: POST, GET, PUT, PATCH, or DELETE. Not logged for SOAP requests. |
|httpStatusCode |Introduced in version 16.3. Specifies the http status code returned when a request has completed. This dimension further indicates whether request succeeded or not, and why. Use it to verify whether there was an issue with a request even though the request was logged as successful. Not logged for SOAP requests. For more information, see [HTTP status codes](#http-status-codes)|
|queryFilter|Specifies the OData/API filter used in the request.|
|requestQueueTime | Specifies the amount of time the request spent in the request queue before it was started by the server.<sup>[\[3\]](#3)</sup> <br /><br />The time has the format hh:mm:ss.sssssss. | 
|serverExecutionTime|Specifies the amount of time it took the server to complete the request\*\*. The time has the format hh:mm:ss.sssssss. Time spent in the request queue isn't included.|
|sqlExecutes|Specifies the number of SQL statements run by the request.<sup>[\[1\]](#1)</sup> <sup>[\[2\]](#2)</sup>|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.<sup>[\[1\]](#1)</sup> <sup>[\[2\]](#2)</sup>|
|totalTime|Specifies the amount of time it took to process the request.<sup>[\[2\]](#2)</sup> <br /><br />The time has the format hh:mm:ss.sssssss. Time spent in the request queue isn't included. |
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<sup>1</sup><a name="1"></a>This dimension isn't relevant for $metadata calls, like `https://localhost:7048/BC/ODataV4/$metadata`, so it won't be in the trace.

<sup>2</sup><a name="2"></a>From telemetrySchemaVersion **0.6** and onwards, this value also includes the CompanyOpen operation.

<sup>3</sup><a name="3"></a>This dimension was introduced in Business Central 2023 release wave 1, version 22.0.
 
<sup>4</sup><a name="4"></a>This HTTP status code was introduced in Business Central 2023 release wave 1, version 22.2.

## HTTP status codes

[!INCLUDE[httpStatusCodes](../includes/include-http-status-error-codes.md)]

## HTTP headers

For privacy and security reasons, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] maintains a list of HTTP headers that are allowed to be emitted to telemetry. 

The following HTTP headers are emitted to telemetry (if set in the request):

* Accept
* Accept-Charset
* Accept-Encoding
* Accept-Language
* Allow
* client-request-id
* Connection
* Content-Encoding
* Content-Language
* Content-Length
* Content-Type
* Data-Access-Intent
* Expect
* If-Match
* isolation
* odata-isolation
* OData-MaxVersion
* OData-Version
* postman-token
* Prefer
* request-id
* return-client-request-id
* Transfer-Encoding
* User-Agent
* x-forwarded-host
* x-forwarded-path
* x-forwarded-port
* x-forwarded-proto

<!-- internal note
allowed HTTP headers are defined in the HeadersAllowedForTelemetry data structure in the partial class StringExtensions 
-->

## Who is calling web services endpoints?

[!INCLUDE[who_is_calling](../includes/include-webservices-telemetry-who-is-calling.md)]

## Who owns the code behind a web services endpoint?

You can use the custom dimensions *alObjectId*, *alObjectName*, and *alObjectType* to identify the object behind the endpoint. To see which app/extension that the object belongs to, use the custom dimensions *extensionId*, *extensionName*, *extensionVersion*, and *extensionPublisher*.

This KQL code illustrates how you can find the owner of the code behind and endpoint and what code was running. Such information might be useful, should you need to contact the publisher of an app/extension.

```kql
// Incoming Web Service Requests - object and extension information
traces
| where timestamp > ago(1d) // change as needed
| where customDimensions has "RT0008"
| where customDimensions.eventId == "RT0008"
| project timestamp
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
, whoWroteTheCode = case(
    customDimensions.endpoint startswith "MS/", 'Microsoft' // metadata calls and calls to company endpoints do not have data in extension* dimensions
  , customDimensions.extensionPublisher
)
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
```

For a full KQL example of all dimensions in web services telemetry, see [Sample KQL code](#sample-kql-code).


## What type of web services are called (REST API, OData, or SOAP)?

The custom dimension *category* hold information about the type of endpoint (REST API, OData, or SOAP) being called. 

This KQL code illustrates how you can find which endpoints are being called and which types of endpoints are being used. Such information might be useful, should you want to modernize your use of web services to use REST APIs, which is recommended over using SOAP web services or OData web services based on pages. 

```kql
// Incoming Web Service Requests - endpoint information
traces
| where timestamp > ago(1d) // change as needed
| where customDimensions has "RT0008"
| where customDimensions.eventId == "RT0008"
| project timestamp
// endpoint information
, category = customDimensions.category // API, ODataV3, ODataV4, or SOAP
, endpoint = customDimensions.endpoint // URI
```

For a full KQL example of all dimensions in web services telemetry, see [Sample KQL code](#sample-kql-code).

## Analyze web service call performance using telemetry

As a developer, you use the data to learn about conditions that you can change to improve performance. The following table provides some examples:

|Condition|Analysis|
|---------|--------|
|A web service request results in a long running SQL query|Adjust or fine-tune code.|
|Web service requests to a specific endpoint read more rows than requests to the other endpoints|Consider adding filtering to limit the rows that are read.|
|Fewer API type requests compared with other types|With SOAP and OData requests to UI pages, computation resources are used on UI elements that aren't relevant. Instead of exposing normal pages as web service endpoints, use the built-in API pages. API pages are optimized for this scenario.|
|High number of requests to endpoints that include Power BI |This condition may indicate excessive Power BI integration.|

For more performance guidelines, see [Web service performance](../webservices/web-service-performance.md)  

This KQL code illustrates how you can find the performance characteristics of different endpoints. 

```kql
// Incoming Web Service Requests - performance information
traces
| where timestamp > ago(1d) // change as needed
| where customDimensions has "RT0008"
| where customDimensions.eventId == "RT0008"
| project timestamp
// endpoint information
, category = customDimensions.category // API, ODataV3, ODataV4, or SOAP
, endpoint = customDimensions.endpoint // URI
// performance data (time is in milliseconds)
, requestQueueTimeMS = toreal(totimespan(customDimensions.requestQueueTime))/10000
, executionTimeInMS = toreal(totimespan(customDimensions.serverExecutionTime))/10000 
, requestTotalTimeMS = ( toreal(totimespan(customDimensions.totalTime))+toreal(totimespan(customDimensions.requestQueueTime)) )/10000
```

For a full KQL example of all dimensions in web services telemetry, see [Sample KQL code](#sample-kql-code).

## Analyze web service call stability using telemetry

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry on web service calls have two important dimensions to troubleshoot failed web service calls:
- The custom dimension httpStatusCode
- The custom dimension failureReason

For more guidelines on web service call stability, see [Troubleshoot web service errors](../webservices/web-service-troubleshooting.md)  

### The custom dimension httpStatusCode

The custom dimension _httpStatusCode_ is key to understanding unsuccessful web service calls. Any call with an HTTP status code in the 4xx range should be investigated because these calls are likely failing due to a misconfiguration on the web service client (the caller).

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] online and on-premises are configured with various limits on web service requests. For example, there's a request timeout and a maximum connections limit. For online, you can't change these limits, but it's helpful to know what the limits are. See [Current API Limits](/dynamics-nav/api-reference/v1.0/dynamics-current-limits). For on-premises, you change the limits on the Business Central Server instance. See [Configuring Business Central Server](configure-server-instance.md). Web service calls that exceed the timeout limit result in a **408 - Request Timeout**. These calls are recorded in Application Insights with a totalTime that is equal to the timeout threshold.

For more guidelines on HTTP status codes, see [HTTP status codes](#http-status-codes).

### The custom dimension failureReason

The custom dimension _failureReason_ is used to troubleshoot further, mostly error conditions happening in the AL code behind the web service endpoint. 

For more information on error codes for the various exceptions that are logged in the custom dimension _failureReason_, please see [Troubleshooting OData/API calls](../api-reference/v2.0/dynamics-error-codes.md).

### Sample KQL code for analyzing failures in web service calls

This KQL code can help you see combinations of httpStatusCode and failureReason in your web service call telemetry: 

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'RT0008'
| where customDimensions.httpStatusCode <> 200
| where customDimensions.category <> 'SOAP' // no httpStatusCode or failureReason logged for SOAP calls
| project failureReason = tostring( customDimensions.failureReason )
, httpStatusCode = tostring(customDimensions.httpStatusCode)
| where isnotempty( httpStatusCode )
| distinct httpStatusCode, failureReason
```

For a full KQL example of all dimensions in web services telemetry, see [Sample KQL code](#sample-kql-code).

## Sample KQL code

This KQL code unfolds all information from the custom dimensions in your web service call telemetry. Use the code sample as a starting point for you analysis and comment out sections for details that you don'tt need.

```kql
// Incoming Web Service Requests
traces
| where timestamp > ago(60d) // change if your retention policy is different than the default
| where customDimensions has "RT0008"
| where customDimensions.eventId == "RT0008"
// use this line and comment out the two lines on RT0008 above if you have data prior to version 16.1 
// | where operation_Name == "Web Services Call" // in a later version of the schema, this field will not be used 
//      or customDimensions.eventId == "RT0008" // starting from version 16.1, the eventId is used to identity signal types
| project timestamp
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
, whoWroteTheCode = case(
    customDimensions.endpoint startswith "MS/", 'Microsoft' // metadata calls and calls to company endpoints do not have data in extension* dimensions
  , customDimensions.extensionPublisher
)
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// endpoint information
, category = customDimensions.category // API, ODataV3, ODataV4, or SOAP
, endpoint = customDimensions.endpoint // URI
// how was the endpoint called?
, httpHeaders = customDimensions.httpHeaders // httpHeaders available from 16.3
, httpMethod = customDimensions.httpMethod   // httpMethod available from 16.3
// diagnostics data (how did it go?)
, httpStatusCode = customDimensions.httpStatusCode // httpStatusCode available from 16.3
, diagnosticsMessage = customDimensions.diagnosticsMessage // Not logged for SOAP calls. diagnosticsMessage available from 22.0
, failureReason = customDimensions.failureReason // Not logged for SOAP calls. failureReason available from 22.0
// performance data
// the datatype for executionTime and requestQueueTime is timespan so need to convert to milliseconds
, executionTime = customDimensions.serverExecutionTime
, requestQueueTime = customDimensions.requestQueueTime // This dimension was introduced in Business Central 2023 release wave 1, version 22.0.
, requestQueueTimeMS = toreal(totimespan(customDimensions.requestQueueTime))/10000
, executionTimeInMS = toreal(totimespan(customDimensions.serverExecutionTime))/10000 
, requestTotalTimeMS = ( toreal(totimespan(customDimensions.totalTime))+toreal(totimespan(customDimensions.requestQueueTime)) )/10000
// these extend lines illustrate how to extract data from the httpHeaders dimension
| extend httpHeadersTmp =  tostring( httpHeaders)
| extend httpHeadersJSON = parse_json(httpHeadersTmp)
| extend msUserAgent = tostring( httpHeadersJSON.['ms-dyn-useragent'] )
| extend httpAuthorization = tostring( httpHeadersJSON.['Authorization'] ) // Authorization header (truncated) available from 17.3
```

To make it easier to get started using [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] with [!INCLUDE[prod_short](../developer/includes/prod_short.md)], samples of KQL code are available in the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/KQL/Queries).

If you want to analyze web service call telemetry from the usage of the Microsoft connector (Power BI, Power Apps, ...), then the query 
[MicrosoftConnectorUsage.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/KQL/Queries/HelperQueries/MicrosoftConnectorUsage.kql) might be useful.
 

## See also

[Web service performance](../webservices/web-service-performance.md)  
[Troubleshoot web service errors](../webservices/web-service-troubleshooting.md)  
[Web services overview](../webservices/web-services.md)  
[Telemetry overview](telemetry-overview.md)   
