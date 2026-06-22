---
title: Analyzing metadata embeddings telemetry
description: Learn about the metadata embeddings telemetry in Business Central.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual
ms.date: 06/22/2026
ms.custom: bap-template
ai-usage: ai-assisted 
---

# Analyzing metadata embeddings telemetry

[!INCLUDE[online_only](../developer/includes/online_only.md)]

Metadata embeddings telemetry tracks the lifecycle of embedding generation for extensions. Metadata embeddings are vector representations of extension metadata (such as pages, tables, and fields) that power AI-based features like Copilot search and suggestions.

This telemetry helps you monitor whether embedding generation completes successfully for your extensions and troubleshoot failures that might affect AI feature functionality.

## <a name="LC0059"></a>Metadata embedding generation succeeded

Occurs when metadata embedding generation for an extension completes successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation succeeded for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0059**|
|extensionId|Specifies the GUID of the extension for which embeddings were generated.|
|extensionVersion|Specifies the version of the extension for which embeddings were generated.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0059'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## <a name="LC0060"></a>Metadata embedding generation failed

Occurs when metadata embedding generation for an extension fails.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation failed for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0060**|
|extensionId|Specifies the GUID of the extension for which embeddings generation failed.|
|extensionVersion|Specifies the version of the extension.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0060'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## <a name="LC0061"></a>Metadata embedding generation scheduled

Occurs when metadata embedding generation for an extension is scheduled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation scheduled for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0061**|
|extensionId|Specifies the GUID of the extension for which embeddings generation was scheduled.|
|extensionVersion|Specifies the version of the extension.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0061'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## <a name="LC0062"></a>Metadata embedding generation started

Occurs when metadata embedding generation for an extension starts processing.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Metadata embedding generation started for extension {extensionId} version {extensionVersion}**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0062**|
|extensionId|Specifies the GUID of the extension for which embeddings generation started.|
|extensionVersion|Specifies the version of the extension.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'LC0062'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, extensionId = customDimensions.extensionId
, extensionVersion = customDimensions.extensionVersion
```

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on Telemetry](telemetry-alert.md)
