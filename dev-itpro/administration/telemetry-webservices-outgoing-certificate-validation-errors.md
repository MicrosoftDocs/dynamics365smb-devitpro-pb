---
title: Server certificate validation errors for outgoing web service requests
description: Learn about telemetry for server certificate validation errors for outgoing web service requests in Business Central  
author: kennienp
ms.topic: concept-article
ms.date: 03/20/2025
ms.author: kepontop
ms.reviewer: jswymer
ms-custom: bap-template
---

# Analyzing server certificate validation errors for outgoing web service requests telemetry

[!INCLUDE[introduced_in_2025rw1](../developer/includes/2025rw1_and_later.md)]

Server certificate validation error telemetry gathers data about errors in validating server certificates on the endpoint when doing outgoing web service requests using the AL HTTPClient module. Use the data to contact the owner of the endpoint and ask them to fix their certificate.

## General dimensions

The following table explains the general dimensions included in a **server certificate validation error** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|--------------|
|message|**HTTP server certificate validation failed when calling endpoint: {endpoint}**|

## Custom dimensions

The following table explains the custom dimensions included in a **server certificate validation error** trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alObjectId|Specifies the ID of the AL object that made the request.|
|alObjectName|Specifies the name of the AL object that made the request.|
|alObjectType|Specifies the type of the AL object that made the request.|
|certificateChain | Specifies an ordered list of certificates, including an SSL/TLS certificate and certificate authority (CA) certificates, which allows the receiver to verify the trustworthiness of the sender and all CAs.  |
|certificateIssuerName |Specifies the value of the issuer field in the certificate properties.|
|certificateSubject |  Specifies the value of the subject field in the certificate properties. This field typically includes the Common Name (CN) attribute.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|endpoint|Specifies the endpoint for the request. The endpoint is cleaned to include only the base URI. |
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0052**|
|extensionId|Specifies the appID of the extension that made the request.|
|extensionName|Specifies the name of the extension that made the request.|
|extensionPublisher|Specifies the publisher of the extension that made the request.|
|extensionVersion|Specifies the version of the extension that made the request.|
|failureReason | Specifies why the certificate didn't validate. |
|httpMethod| [!INCLUDE[httpMethod](../includes/include-telemetry-dimension-http-method.md)] |

## Sample KQL code

This KQL code can help you get started analyzing server certificate validation errors

```kql
// added in version 26.0
traces
| where timestamp > ago(60d) // change if your retention policy is different than the default
| where customDimensions has 'RT0052'
| where customDimensions.eventId == 'RT0052'
| project timestamp
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// certificate information
, certificateChain = customDimensions.certificateChain
, certificateIssuerName = customDimensions.certificateIssuerName
, certificateSubject = customDimensions.certificateSubject
// http request details
, endpoint = customDimensions.endpoint
, httpMethod = customDimensions.httpMethod
// why did it fail?
, failureReason = customDimensions.failureReason
```

## Related information

[HttpClient data type](../developer/methods-auto/httpclient/httpclient-data-type.md)  
[Telemetry overview](telemetry-overview.md)  
[Enable sending telemetry to Application Insights](telemetry-enable-application-insights.md)  
