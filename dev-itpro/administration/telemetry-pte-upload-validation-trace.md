---
title:  Analyzing Extension Upload Validation Telemetry 
description: Learn about the extension upload validation telemetry in Business Central.
author: KennieNP
ms.author: kepontop
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 11/03/2023
ms.custom: bap-template
ms.service: dynamics365-business-central
---
# Analyzing Extension Upload Validation Telemetry 

[!INCLUDE[component](../developer/includes/online_only.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service, when a user/administrator uploads a per-tenant extension to an environment from the Extension Management page, we proactively validate it against the environment.

With this telemetry, partners can monitor these attempts for customers and setup alerts on failures so that they know up-front which customers will need help.

Failed operations result in a trace log entry that includes a reason for the failure.

The validation flow is as follows:

```text
The PTE submission validation flow is as follows:

PTE submission validation request started (LC0200). This includes the main extension to be validated and a list of extensions it depends on.
For each extension (main + dependent extensions)
        Extension validation started (LC0204)

        Either 
                Extension validation completed successfully (LC0205)
        or
                Validation diagnostic reported (LC0210)
                Extension validation completed with failures (LC0206)

Then either 
        PTE submission validation request completed successfully (LC0202)
or
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
|mainExtension|A json structure that contains information about the extension that is being uploaded.|
|submissionOperationId|[!INCLUDE[submissionOperationId](../includes/include-telemetry-dimension-submission-operation-id.md)] |


## <a name="extension-validation-started"></a>Extension validation started (LC0204)

Occurs for each extension in the upload.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation started: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

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
|message|**Extension validation completed successfully: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

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


## <a name="extension-validation-completed-with-failures"></a>Extension validation completed completed with failures (LC0206)

Occurs if the extension could not compile against the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed with failures: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the id of the extension.|

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



## <a name="pte-validation-completed-successfully"></a>Per-tenant extension (PTE) validation completed successfully (LC0202)

Occurs when a per-tenant extension (PTE) validation attempt is completed successfully on the environment (so that the extension was uploaded).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**PTE submission validation request completed successfully: request {submission id}** <br /><br /> `{submissionId}` indicates the identifier for the validation attempt.|

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
|mainExtension|A json structure that contains information about the extension that is being uploaded.|
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

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
