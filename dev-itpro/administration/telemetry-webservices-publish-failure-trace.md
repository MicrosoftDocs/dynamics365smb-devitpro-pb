---
title: Web Service Publish Failure Trace
description: Learn about the web service publish failure telemetry in Business Central  
author: SVinchi
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 06/16/2023
ms.author: kepontop
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms-custom: bap-template
---

# Analyzing web service publish failure telemetry

[!INCLUDE[2023_releasewave1.md](../includes/2023_releasewave1.md)]

Web service publish failure telemetry gathers data when a web service could not be published or published web service is not working correctly due to an error in creating metadata for the web service. As a partner, the data gives you the ability to investigate & fix potential problems which are preventing web service from working correctly.

## General dimensions

The following table explains the general dimensions included in an outgoing **Web Service Publish Failure** trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata error/warning: {error details}**|
|severityLevel|**1**|

## Custom dimensions

The following table explains the custom dimensions included in a **Web Service Publish Failure** trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|errorDetails|Additional information about the error.|
|eventId|**RT0035** - **RT0039**|
|metadataStack|Specifies the entity where error has occured.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Sample KQL code 
This KQL code can help you get started analyzing outgoing web service calls. 

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId in ('RT0035','RT0036','RT0037','RT0038','RT0039')
| project timestamp 
, aadTenantId = customDimensions.aadTenantId
, component = customDimensions.component
, environmentType = customDimensions.environmentType
, metadataStack = customDimensions.metadataStack
, errorDetails = customDimensions.errorDetails
```

## See also

[Telemetry overview](telemetry-overview.md)  
[Enable sending telemetry to Application Insights](telemetry-enable-application-insights.md)  
