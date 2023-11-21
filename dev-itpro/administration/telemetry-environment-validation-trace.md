---
title:  Analyzing environment validation telemetry 
description: Learn about the environment validation telemetry in Business Central.
author: KennieNP
ms.author: kepontop
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 10/27/2023
ms.custom: bap-template
ms.service: dynamics365-business-central
---

# Analyzing environment validation telemetry

[!INCLUDE[component](../developer/includes/online_only.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Non-compatible, partner apps (per-tenant extensions) can block upgrades to next major version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] if they can't compile on that version. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service proactively validates all environments regularly against the next release. If an environment isn't ready to be updated, then the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service sends an email to the administrator and, starting from September 2023, emits telemetry on these validations. 

With this telemetry, partners can monitor environments for the customers and setup alerts so that they know up front which customers need help prior to updating to the next major version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Failed operations result in a tracelog entry that includes a reason for the failure.

The validation flow is as follows:

```text
First, environment validation started (LC0220). 
For each extension (main + dependent extensions)
        Extension validation started (LC0204)
        Either 
                Extension validation completed successfully (LC0225)
        or
                Extension Validation diagnostic reported (LC0210)
                Extension validation completed with failures (LC0226)
Finally, 
either 
        Environment validation completed successfully (LC0222)
or
        Environment validation completed with failures (LC0223)
        Environment diagnostic reported (LC0227)
```

## <a name="environment-validation-started"></a>Environment validation started (LC0220)

Occurs when a new validation attempt is started for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment validation started: environment {environmentName} target build version {targetVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{targetVersion}` indicates the new version that the environment is validated against.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0220**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|targetVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-validation-target-version.md)]|


## <a name="extension-validation-started"></a>Extension validation started (LC0224)

Occurs for each extension in the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation started: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0224**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|


## <a name="extension-validation-completed-successfully"></a>Extension validation completed successfully (LC0225)

Occurs if the extension validated successfully on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed successfully: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0225**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|targetVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-validation-target-version.md)]|


## <a name="extension-validation-diagnostic-reported"></a>Extension Validation diagnostic reported (LC0210)

Occurs if something wasn't right when validating the extension on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Validation diagnostic reported: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0210**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|diagnosticCode|[!INCLUDE[diagnosticCode](../includes/include-telemetry-dimension-diagnostics-code.md)]|
|diagnosticMessage|[!INCLUDE[diagnosticMessage](../includes/include-telemetry-dimension-diagnostics-message.md)]|
|diagnosticSeverity|[!INCLUDE[diagnosticSeverity](../includes/include-telemetry-dimension-diagnostics-severity.md)]|
|diagnosticSourceLocation|[!INCLUDE[diagnosticSourceLocation](../includes/include-telemetry-dimension-diagnostics-location.md)]|
|diagnosticSourcePath|[!INCLUDE[diagnosticSourcePath](../includes/include-telemetry-dimension-diagnostics-sourcepath.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-diagnostics-submission-operation-id.md)]|



### Sample KQL code (Extension Validation diagnostic reported)

This KQL code can help you get started analyzing validation failures for an app on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

```kql
// Extension Validation diagnostic reported (LC0210)
traces 
| where customDimensions has "LC0210"
| where customDimensions.eventId == "LC0210"
| where timestamp > ago(30d) // adjust as needed
| project timestamp
// which environment is being validated
, aadTenantId = customDimensions.environmentId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType 
// which extension/app is being validated
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, extensionName = customDimensions.extensionName
, mainExtension = customDimensions.mainExtension 
// validation info
, diagnosticSourceLocation = customDimensions.diagnosticSourceLocation
, diagnosticMessage = customDimensions.diagnosticMessage
, diagnosticSourcePath = customDimensions.diagnosticSourcePath
, diagnosticCode = customDimensions.diagnosticCode
, diagnosticSeverity = customDimensions.diagnosticSeverity
, submissionOperationId = customDimensions.submissionOperationId
```



## <a name="extension-validation-completed-with-failures"></a>Extension validation completed with failures (LC0226)

Occurs if the extension validated with one or more failures on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed with failures: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0226**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|targetVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-validation-target-version.md)]|
|failureReason|The overall reason that the extension failed to validate on the new major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|


### Sample KQL code (Extension validation completed with failures)

This KQL code can help you get started analyzing validation failures for an app on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

```kql
// Extension validation completed with failures (LC0226)
traces 
| where customDimensions has "LC0226"
| where customDimensions.eventId == "LC0226"
| where timestamp > ago(30d) // adjust as needed
| project timestamp
// which environment is being validated
, aadTenantId = customDimensions.environmentTenantAAD
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// which extension/app is being validated
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
// validation info
, targetVersion = customDimensions.targetVersion
, failureReason = customDimensions.failureReason
```


## <a name="environment-validation-request-completed-successfully"></a>Environment validation request completed successfully (LC0222)

Occurs if all extensions in the environment validated successfully on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment validation request completed successfully for {environmentName} target build version  {targetVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{targetVersion}` indicates the new version that the environment is validated against.|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0222**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|targetVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-validation-target-version.md)]|



## <a name="environment-validation-request-completed-with-failures"></a>Environment validation completed with failures (LC0223)

Occurs if one or more extensions in the environment failed to validate on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment validation request completed with failures for environment {environmentName} target build version {targetVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{targetVersion}` indicates the new version that the environment is validated against.|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0223**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|failureReason|The overall reason that the environment failed to validate on the new major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|
|targetVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-validation-target-version.md)]|



## <a name="environment-diagnostic-reported"></a>Environment diagnostic reported (LC0227)

Occurs if an extension validated with a diagnostic on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Validation diagnostic reported: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0227**|
|environmentTenantAAD|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|mainExtension|Specifies the name of an extension that the validated extension has taken a dependency n.|
|diagnosticCode|[!INCLUDE[diagnosticCode](../includes/include-telemetry-dimension-diagnostics-code.md)]|
|diagnosticMessage|[!INCLUDE[diagnosticMessage](../includes/include-telemetry-dimension-diagnostics-message.md)]|
|diagnosticSeverity|[!INCLUDE[diagnosticSeverity](../includes/include-telemetry-dimension-diagnostics-severity.md)]|
|diagnosticSourceLocation|[!INCLUDE[diagnosticSourceLocation](../includes/include-telemetry-dimension-diagnostics-location.md)]|
|diagnosticSourcePath|[!INCLUDE[diagnosticSourcePath](../includes/include-telemetry-dimension-diagnostics-sourcepath.md)]|
|targetVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-validation-target-version.md)]|


### Sample KQL code (Environment diagnostic reported)

This KQL code can help you get started analyzing validation failures for an app on the next major of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

```kql
traces 
| where customDimensions has "LC0227"
| where customDimensions.eventId == "LC0227"
| where timestamp > ago(30d) // adjust as needed
| project timestamp
// which environment is being validated
, aadTenantId = customDimensions.environmentTenantAAD
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType // need this dimension
// which extension/app is being validated
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, extensionName = customDimensions.extensionName
, mainExtension = customDimensions.mainExtension 
// validation info
, targetVersion = customDimensions.targetVersion
, diagnosticSeverity = customDimensions.diagnosticSeverity
, diagnosticMessage = customDimensions.diagnosticMessage
, diagnosticSourcePath = customDimensions.diagnosticSourcePath
, diagnosticSourceLocation = customDimensions.diagnosticSourceLocation
, diagnosticCode = customDimensions.diagnosticCode
```

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
