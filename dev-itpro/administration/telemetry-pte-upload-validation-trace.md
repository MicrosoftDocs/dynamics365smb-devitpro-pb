---
title:  Analyzing Extension Upload Validation Telemetry 
description: Learn about the extension upload validation telemetry in Business Central.
author: KennieNP
ms.author: kepontop
ms.reviewer: jswymer
ms.topic: concept-article
ms.date: 11/03/2023
ms.custom: bap-template

---
# Analyzing Extension Upload Validation Telemetry 

[!INCLUDE[component](../developer/includes/online_only.md)]

In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service, when a user/administrator uploads a per-tenant extension to an environment from the Extension Management page, we proactively validate it against the environment.

With this telemetry, partners can monitor these attempts for customers and set up alerts on failures so that they know up-front which customers will need help.

Failed operations result in a trace log entry that includes a reason for the failure.

The validation flow is as follows:

```text
The PTE submission validation flow is as follows:

PTE submission validation request started (LC0200). This includes the main extension to be validated and a list of extensions it depends on.
For each extension (main + dependent extensions)
        For the main extension:
                Extension validation started (LC0204)
                Either 
                        Extension validation completed successfully (LC0205)
                or
                        Validation diagnostic reported (LC0210)
                        Extension validation completed with failures (LC0206)
        For each dependent extension:
                Dependent extension validation started (LC0207)
                Either
                        Dependent extension validation completed successfully (LC0208)
                or
                        Validation diagnostic reported (LC0210)
                        Dependent extension validation completed with failures (LC0209)

Then either 
        PTE submission validation request completed successfully (LC0202)
or
        PTE submission diagnostic reported (LC0201)
        PTE submission validation request completed with failures (LC0203)
```

## <a name="pte-validation-started"></a>Per-tenant extension (PTE) validation started (LC0200)

Occurs when a new per-tenant extension (PTE) validation attempt is started on the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**PTE validation started: request {submissionId}** <br /><br /> `{submissionId}` indicates the identifier for the validation attempt.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0200**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|mainExtension|A JSON structure that contains information about the extension that is being uploaded.|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |


## <a name="pte-submission-diagnostic-reported"></a>PTE submission diagnostic reported (LC0201)

Occurs during the PTE submission validation request to report diagnostics related to the submission itself. For example, it could be that a submission has duplicate object IDs. This signal isn't necessarily an error, but can also be a warning or information.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Diagnostic reported on PTE submission validation request: {submissionId}**|
|severityLevel|**1** for information, **2** for warning, **3** for error|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0201**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|mainExtension|A JSON structure that contains information about the extension that is being uploaded.|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |
|dependentExtensions|A JSON structure that contains information about the dependent extensions.|
|diagnosticCode|[!INCLUDE[diagnosticCode](../includes/include-telemetry-dimension-diagnostics-code.md)]|
|diagnosticMessage|[!INCLUDE[diagnosticMessage](../includes/include-telemetry-dimension-diagnostics-message.md)]|
|diagnosticSeverity|[!INCLUDE[diagnosticSeverity](../includes/include-telemetry-dimension-diagnostics-severity.md)]|


## <a name="extension-validation-started"></a>Extension validation started (LC0204)

Occurs for each extension in the upload. This event is emitted for the main extension being uploaded.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation started: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0204**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |


## <a name="extension-validation-completed-successfully"></a>Extension validation completed successfully (LC0205)

Occurs if the extension can compile against the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed successfully: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0205**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |



## <a name="extension-validation-reported"></a>Extension Validation diagnostic reported (LC0210)
Occurs if something was not right when validating the extension on the environment.

[!INCLUDE[LC0210](../includes/telemetry-LC0210.md)]


## <a name="extension-validation-completed-with-failures"></a>Extension validation completed with failures (LC0206)

Occurs if the extension could not compile against the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed with failures: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0206**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |
|failureReason|The overall reason that the extension failed to validate.|


## <a name="dependent-extension-validation-started"></a>Dependent extension validation started (LC0207)

Occurs for each dependent extension in the upload. This event is emitted for extensions that the main extension depends on, not the main extension itself.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation started: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0207**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the dependent extension that was to be validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |


## <a name="dependent-extension-validation-completed-successfully"></a>Dependent extension validation completed successfully (LC0208)

Occurs if the dependent extension can compile against the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed successfully: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0208**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the dependent extension that was validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |


## <a name="dependent-extension-validation-completed-with-failures"></a>Dependent extension validation completed with failures (LC0209)

Occurs if the dependent extension could not compile against the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed with failures: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0209**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|extensionName|Specifies the name of the dependent extension that was validated.|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-version.md)]|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |
|failureReason|The overall reason that the dependent extension failed to validate.|


## <a name="pte-validation-completed-successfully"></a>Per-tenant extension (PTE) validation completed successfully (LC0202)

Occurs when a per-tenant extension (PTE) validation attempt is completed successfully on the environment (so that the extension was uploaded).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**PTE submission validation request completed successfully: request {submissionId}** <br /><br /> `{submissionId}` indicates the identifier for the validation attempt.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0202**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|mainExtension|A JSON structure that contains information about the extension that was uploaded.|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |



## <a name="pte-validation-completed-with-failures"></a>Per-tenant extension (PTE) validation completed with failures (LC0203)

Occurs when a new per-tenant extension (PTE) validation attempt completed with failures on the environment (so that the extension was not uploaded).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**PTE validation completed with failures: request {submissionId}** <br /><br /> `{submissionId}` indicates the identifier for the validation attempt.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0203**|
|environmentId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|mainExtension|A JSON structure that contains information about the extension that is being uploaded.|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |
|failureReason|The overall reason that the extension failed to upload.|


### Sample KQL code (Per-tenant extension (PTE) validation completed with failures)

This KQL code can help you get started analyzing validation failures for uploading an extension to the environment:

```kql
// PTE submission validation request completed with failures: request <submission id>	
traces 
| where customDimensions has "LC0203"
| where customDimensions.eventId == "LC0203"
| where timestamp > ago(30d) // adjust as needed
| extend mainExtension = parse_json(tostring( customDimensions.mainExtension ))
| project timestamp
// in which environment is the extension being validated
, aadTenantId = case(
  isnotempty(customDimensions.aadTenantId), customDimensions.aadTenantId  
, isnotempty(customDimensions.environmentId), customDimensions.environmentId
, 'Unknown'
)
, environmentName = customDimensions.environmentName
// which extension/app is being validated
, mainExtensionId = mainExtension.Id
, mainExtensionPublisher = mainExtension.Publisher
, mainExtensionVersion = mainExtension.Version 
, mainExtensionName = mainExtension.Name 
, dependentExtensions = customDimensions.dependentExtensions
// validation info
, submissionOperationId = customDimensions.submissionOperationId  
, failureReason = customDimensions.failureReason
```

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
