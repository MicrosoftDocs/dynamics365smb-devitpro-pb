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
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
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
