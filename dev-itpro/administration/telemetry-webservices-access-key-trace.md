---
title: Analyzing Web Service Access Key Telemetry | Microsoft Docs
description: Learn about the web service access key telemetry in Business Central  
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

# Analyzing Web Service Access Key Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2, version 17.3, and later

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data about the success or failure of authenticating web service access keys on web service requests.

In a future release, web service access key feature will be deprecated. As a partner or customer, this data lets you monitor the use of web service access keys on your environments in preparation for this change.

For information about web service access keys, see [How to use an Access Key for SOAP and OData Web Service Authentication](../webservices/web-services-authentication.md#accesskey).

## <a name="succeeded"></a>Authentication with web service key succeeded

Occurs when a web service access key was authenticated successfully.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|-----------|
|message|**Authentication with Web Service Key succeeded: {endpoint}**|
|severityLevel|**1**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|authenticationStatus|**Succeeded**|
|authenticationType|Specifies whether the service uses NavUserPassword or AccessControl (Azure AD) authentication.|
|category|Specifies the service type. Values include: **Api**, **ODataV4**, **ODataV3**, and **SOAP**.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request. Private and sensitive information is omitted from the endpoint.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0020**<br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.1.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"17.0.19123.0","componentVersion":"17.0.19123.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","AadTenantId":"common","aadTenantId":"common","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"RT0020","AL Object Id":"0","alObjectId":"0","endpoint":"BC170/ODataV4/Company()/Chart_of_Accounts","category":"Api","authenticationStatus":"Succeeded","authenticationType":"NavUserPassword"}

-->

## <a name="failed"></a>Authentication with web service key failed

Occurs when a web service access key failed to authenticate.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|-----------|
|message|**Authentication with Web Service Key failed: {endpoint}**|
|severityLevel|**3**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.


|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|authenticationStatus|**Failed**|
|authenticationType|Specifies whether the service uses NavUserPassword or AccessControl (Azure AD) authentication.|
|category|Specifies the service type. Values include: **Api**, **ODataV4**, **ODataV3**, and **SOAP**.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|endpoint|Specifies the endpoint for the request. Private and sensitive information is omitted from the endpoint.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0021**|
|failureReason|Specifies the exception that was thrown by the server. Some exception messages can contain customer data. As a precaution, Business Central only emits information that's classified as [SystemMetadata](../developer/devenv-classifying-data.md). Exception messages that contain other data classifications, like customer data, are not shown. Instead, the following message is shown: "Message not shown because the NavBaseException(string, Exception, bool) constructor was used."|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

### Example trace

The following code snippet is a CustomDimensions example:

`
{"component":"Dynamics 365 Business Central Server","category":"Api","AadTenantId":"common","environmentType":"Production","Component":"Dynamics 365 Business Central Server","AL Object Id":"0","alObjectId":"0","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","authenticationType":"NavUserPassword","componentVersion":"17.0.15855.0","Component version":"17.0.15855.0","eventId":"RT0020","endpoint":"BC170/ODataV4/Company()/purchaseDocumentLines","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","Environment type":"Production","authenticationStatus":"Succeeded"}
`
 
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
