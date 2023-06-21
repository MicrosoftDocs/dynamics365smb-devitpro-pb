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

Web service publish failure telemetry gathers data when a web service couldn't be published or a published web service isn't working correctly due to an error in creating metadata for the web service. As a partner, the data gives you the ability to investigate & fix potential problems that are preventing web service from working correctly.

The following sections explain the different events included in an outgoing **Web Service Publish Failure** trace, along with their dimensions. The tables list the dimensions that are specific to Business Central.

## <a name="rt0033"></a>Web service metadata error: Name for subpage of parent page '{parentPageName}' is missing. Subpage is skipped.

### General dimensions

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata error: Name for subpage of parent page '{parentPageName}' is missing. Subpage is skipped.**<!--Web service metadata error/warning: {error details}**-->|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0033**|
|metadataStack|[!INCLUDE[include-telemetry-dimension-telemetry-metadatastack](../includes/include-telemetry-dimension-telemetry-metadatastack.md)]|
|parentPageId|The ID of the parent entity object. |
|parentPageName|The name of the parent entity object.|
|subPageEntityId|The ID of the sub page entity.|
|telemetrySchemaVersion|[!INCLUDE[include-telemetry-dimension-telemetry-schema-version](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|

## <a name="rt0034"></a>Web service metadata error: Control element with id '{metadataObjectName}' has a missing name. The page with the control was skipped.

### General dimensions

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata error: Control element with id {metadataObjectName} has a missing name. The page with the control was skipped.**<!--Web service metadata error/warning: {error details}**-->|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0034**|
|metadataObjectId|The ID of the metadata entity|
|metadataObjectName|The name of the metadata entity object.|
|metadataStack|[!INCLUDE[include-telemetry-dimension-telemetry-metadatastack](../includes/include-telemetry-dimension-telemetry-metadatastack.md)]|
|telemetrySchemaVersion|[!INCLUDE[include-telemetry-dimension-telemetry-schema-version](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|

## <a name="rt0035"></a>Web service metadata error: The record with name '{webserviceRecordName}' was skipped.

### General dimensions

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata error: The record with name '{webserviceRecordName}' was skipped.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0035**|
|metadataStack|[!INCLUDE[include-telemetry-dimension-telemetry-metadatastack](../includes/include-telemetry-dimension-telemetry-metadatastack.md)]|
|telemetrySchemaVersion|[!INCLUDE[include-telemetry-dimension-telemetry-schema-version](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|
|webserviceRecordId|The ID of the webservice Record.|
|webserviceRecordName|The name of the webservice Record.|

## <a name="rt0036"></a>Web service metadata error: Table field name error, the page containing the field with caption '{metaFieldCaption}' was skipped.

### General dimensions

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata error: Table field name error, the page contains the field with caption '{metaFieldCaption}' was skipped.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0036**|
|metaFieldCaption|The caption of the metafield.|
|metaFieldId|The ID of the metafield.|
|metadataStack|[!INCLUDE[include-telemetry-dimension-telemetry-metadatastack](../includes/include-telemetry-dimension-telemetry-metadatastack.md)]|
|telemetrySchemaVersion|[!INCLUDE[include-telemetry-dimension-telemetry-schema-version](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|

## <a name="rt0038"></a>Web service metadata warning: Multiple options while generation navigation property for tablerelation.

### General dimensions

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata warning: Multiple options while generation navigation property for tablerelation.**|
|severityLevel|**2**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0038**|
|metadataStack|[!INCLUDE[include-telemetry-dimension-telemetry-metadatastack](../includes/include-telemetry-dimension-telemetry-metadatastack.md)]|
|otherNavigationProperties|The list of all possible navigation properties.|
|pickedNavigationPropertyType|The final navigation property type.|
|telemetrySchemaVersion|[!INCLUDE[include-telemetry-dimension-telemetry-schema-version](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|

## <a name="rt0039"></a>Web service metadata error: The record with name '{entityName}' was skipped.

### General dimensions

|Dimension|Description or value|
|---------|--------------|
|message|**Web service metadata error: The record with name '{entityName}' was skipped.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[include-telemetry-dimension-aadtenantid](../includes/include-telemetry-dimension-aadtenantid.md)] |
|component|[!INCLUDE[include-telemetry-dimension-component-server](../includes/include-telemetry-dimension-component-server.md)]|
|componentVersion|[!INCLUDE[include-telemetry-dimension-component-version](../includes/include-telemetry-dimension-component-version.md)]|
|errorDetails|Details about the error.|
|entityName|The name of the entity.|
|environmentType|[!INCLUDE[include-telemetry-dimension-environment-type](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**RT0039**|
|metadataStack|[!INCLUDE[include-telemetry-dimension-telemetry-metadatastack](../includes/include-telemetry-dimension-telemetry-metadatastack.md)]|
|telemetrySchemaVersion|[!INCLUDE[include-telemetry-dimension-telemetry-schema-version](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|

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
