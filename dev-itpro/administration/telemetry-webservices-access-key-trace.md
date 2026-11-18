---
title: Analyzing Web Service Access Key Telemetry
description: Analyze web service access key telemetry in Business Central to monitor authentication attempts, identify failures, and plan migration away from access keys.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Analyzing web service access key telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2, version 17.3, and later

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data about the success or failure of authenticating web service access keys on web service requests. 

[!INCLUDE[webservice_key_deprecated](../includes/web-service-key-deprecated.md)]

As a partner or customer, this data lets you monitor the use of web service access keys on your environments in preparation for the deprecation of the feature.

Learn more in [How to use an Access Key for SOAP and OData Web Service Authentication](../webservices/web-services-authentication.md#accesskey).

## <a name="succeeded"></a>Authentication with web service key succeeded

Occurs when a web service access key was authenticated successfully.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|
|message|**Authentication with Web Service Key succeeded: {endpoint}**|
|severityLevel|**1**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object in the current context, if available. The authentication event occurs before the requested object runs.|
|authenticationStatus|**Succeeded**|
|authenticationType|Specifies whether the service uses NavUserPassword or AccessControl  authentication.|
|category|Specifies the service type. Values include: **Api**, **ODataV4**, **ODataV3**, and **SOAP**.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that you update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request. Private and sensitive information is omitted from the endpoint.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**RT0020**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"17.0.19123.0","componentVersion":"17.0.19123.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","AadTenantId":"common","aadTenantId":"common","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"RT0020","AL Object Id":"0","alObjectId":"0","endpoint":"BC170/ODataV4/Company()/Chart_of_Accounts","category":"Api","authenticationStatus":"Succeeded","authenticationType":"NavUserPassword"}

-->

## <a name="failed"></a>Authentication with web service key failed

Occurs when a web service access key request reaches the authentication check but the user isn't authenticated. Requests rejected earlier, such as requests that use a disabled authentication method, don't emit this event.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|
|message|**Authentication with Web Service Key failed: {endpoint}**|
|severityLevel|**1**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.


|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object in the current context, if available. The authentication event occurs before the requested object runs.|
|authenticationStatus|**Failed**|
|authenticationType|Specifies whether the service uses NavUserPassword or AccessControl  authentication.|
|category|Specifies the service type. Values include: **Api**, **ODataV4**, **ODataV3**, and **SOAP**.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that you update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request. Private and sensitive information is omitted from the endpoint.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**RT0021**|
|failureReason|Specifies why authentication failed. For a request whose user isn't authenticated, the value is `Not authorized.`.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

### Example trace

The following code snippet is a CustomDimensions example:

```json
{"component":"Dynamics 365 Business Central Server","category":"Api","AadTenantId":"common","environmentType":"Production","Component":"Dynamics 365 Business Central Server","AL Object Id":"0","alObjectId":"0","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","authenticationType":"NavUserPassword","componentVersion":"17.0.15855.0","Component version":"17.0.15855.0","eventId":"RT0021","endpoint":"BC170/ODataV4/Company()/purchaseDocumentLines","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","Environment type":"Production","authenticationStatus":"Failed","failureReason":"Not authorized."}
```
 
## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
