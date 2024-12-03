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

This KQL code can help you get started analyzing validation failures for an extension/app:

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
