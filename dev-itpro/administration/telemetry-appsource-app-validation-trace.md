---
title: Analyzing Marketplace app breaking changes validation telemetry
description: Learn about the telemetry for breaking changes validation of Marketplace apps in Business Central.
author: IhorHandziuk
ms.author: ihhandzi
ms.reviewer: ihhandzi
ms.topic: concept-article
ms.date: 03/11/2026
ms.custom: bap-template

---

# Analyzing Marketplace app breaking changes validation telemetry

[!INCLUDE[component](../developer/includes/online_only.md)]

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service periodically validates existing Marketplace apps against upcoming releases to detect breaking changes. This breaking changes validation ensures that Marketplace apps continue to compile and meet technical requirements across upcoming [!INCLUDE[prod_short](../developer/includes/prod_short.md)] versions. If an app fails validation, telemetry traces are emitted to the partner's Application Insights resource.

With this telemetry, partners can monitor their Marketplace apps and set up alerts so that they know up front which apps need attention prior to the next major version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. This process is separate from the [Marketplace submission validation](telemetry-appsource-submission-validation-trace.md), which occurs when an app is submitted through Partner Center.

Failed operations result in a trace log entry that includes a reason for the failure.

The validation flow is as follows:

```text
First, Marketplace app breaking changes validation started (LC0230).
For each extension
        Extension validation started (LC0234)
        Either
                Extension validation completed successfully (LC0235)
        or
                Validation diagnostic reported (LC0236)
                Extension validation completed with failures (LC0237)
Finally,
either
        Marketplace app breaking changes validation completed successfully (LC0232)
or
        Marketplace app breaking changes validation completed with failures (LC0233)
        Diagnostic reported on validation (LC0231)
```

## <a name="marketplaceappvalidationstarted"></a>Marketplace app breaking changes validation started (LC0230)

Occurs when a new breaking changes validation attempt is started for a Marketplace app extension.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Marketplace app breaking changes validation started: extension {extensionInfo} for countries/regions {countryCodeList}, and target build version {targetVersion}** <br /><br /> `{extensionInfo}` indicates information about the extension being validated.<br /><br /> `{countryCodeList}` indicates the list of countries/regions the app is being validated for.<br /><br /> `{targetVersion}` indicates the new version that the app is validated against.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0230**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|countryCodeList|Specifies the comma-separated list of countries/regions that the app is being validated for.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all Marketplace app breaking changes validation traces.

|Dimension|Description or value|
|---------|-----|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="marketplaceappvalidationdiagnosticreported"></a>Diagnostic reported on Marketplace app breaking changes validation (LC0231)

Occurs during the breaking changes validation request to report diagnostics related to the validation itself. For example, it could be that a validation has duplicate object IDs. This signal isn't necessarily an error, but can also be a warning or information.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Diagnostic reported on validation of extension {extensionInfo} and target build version {targetVersion}**|
|severityLevel|**1** for information, **2** for warning, **3** for error|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0231**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionVersion|[!INCLUDE[extensionVersion](../includes/include-telemetry-dimension-extension-version.md)]|
|diagnosticCode|[!INCLUDE[diagnosticCode](../includes/include-telemetry-dimension-diagnostics-code.md)]|
|diagnosticMessage|[!INCLUDE[diagnosticMessage](../includes/include-telemetry-dimension-diagnostics-message.md)]|
|diagnosticSeverity|[!INCLUDE[diagnosticSeverity](../includes/include-telemetry-dimension-diagnostics-severity.md)]|
|[See common custom dimensions](#other)||


## <a name="marketplaceappvalidationcompleted"></a>Marketplace app breaking changes validation completed successfully (LC0232)

Occurs when the breaking changes validation of a Marketplace app has completed successfully and no errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Marketplace app breaking changes validation completed successfully: extension {extensionInfo}, country {countryCodeList}, and target build version {targetVersion}** <br /><br /> `{extensionInfo}` indicates information about the extension that was validated.<br /><br /> `{countryCodeList}` indicates the list of countries/regions the app was validated for.<br /><br /> `{targetVersion}` indicates the version that the app was validated against.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0232**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|countryCodeList|Specifies the comma-separated list of countries/regions that the app was validated for.|
|[See common custom dimensions](#other)||


## <a name="marketplaceappvalidationcompletedwithfailure"></a>Marketplace app breaking changes validation completed with failures (LC0233)

Occurs when the breaking changes validation of a Marketplace app has completed, but errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Marketplace app breaking changes validation completed with failures: extension {extensionInfo} and target build version {targetVersion}** <br /><br /> `{extensionInfo}` indicates information about the extension that was validated.<br /><br /> `{targetVersion}` indicates the version that the app was validated against.|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0233**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|countryCodeList|Specifies the comma-separated list of countries/regions that the app was validated for.|
|failureReason|**One or more extension validation tasks have failed.**|
|[See common custom dimensions](#other)||


### Sample KQL code (Marketplace app breaking changes validation completed with failures)

This KQL code can help you get started analyzing breaking changes validation failures for a Marketplace app:

```kql
// Marketplace app breaking changes validation completed with failures (LC0233)
traces
| where customDimensions has "LC0233"
| where customDimensions.eventId == "LC0233"
| where timestamp > ago(30d) // adjust as needed
| project timestamp
// which extension/app is being validated
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
// validation info
, countryCodeList = customDimensions.countryCodeList
, failureReason = customDimensions.failureReason
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]


## <a name="extensionvalidationstarted"></a>Extension validation started (LC0234)

Occurs when the validation for a specific extension has started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation started: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0234**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionVersion](../includes/include-telemetry-dimension-extension-version.md)]|
|countryRegion|Specifies the country/region that the extension is being validated for.|
|[See common custom dimensions](#other)||


## <a name="extensionvalidationcompleted"></a>Extension validation completed successfully (LC0235)

Occurs when the validation for a specific extension has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed successfully: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0235**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionVersion](../includes/include-telemetry-dimension-extension-version.md)]|
|countryRegion|Specifies the country/region that the extension was validated for.|
|[See common custom dimensions](#other)||


## <a name="diagnosticreported"></a>Validation diagnostic reported (LC0236)

Occurs when a diagnostic error is reported during the validation of an extension. The errors are reported by the AL compiler or by the [AppSourceCop](../developer/analyzers/appsourcecop.md) analyzer.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Validation diagnostic reported: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId}) for country {countryRegion}.** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.<br /><br /> `{countryRegion}` indicates the country/region that the extension was validated for.|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0236**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionVersion](../includes/include-telemetry-dimension-extension-version.md)]|
|countryRegion|Specifies the country/region that the extension was validated for.|
|diagnosticCode|[!INCLUDE[diagnosticCode](../includes/include-telemetry-dimension-diagnostics-code.md)]|
|diagnosticMessage|[!INCLUDE[diagnosticMessage](../includes/include-telemetry-dimension-diagnostics-message.md)]|
|diagnosticSeverity|[!INCLUDE[diagnosticSeverity](../includes/include-telemetry-dimension-diagnostics-severity.md)]|
|diagnosticSourceLocation|[!INCLUDE[diagnosticSourceLocation](../includes/include-telemetry-dimension-diagnostics-location.md)]|
|diagnosticSourcePath|[!INCLUDE[diagnosticSourcePath](../includes/include-telemetry-dimension-diagnostics-sourcepath.md)]|
|[See common custom dimensions](#other)||


### Sample KQL code (Validation diagnostic reported)

This KQL code can help you get started analyzing breaking changes validation diagnostics for a Marketplace app:

```kql
// Validation diagnostic reported (LC0236)
traces
| where customDimensions has "LC0236"
| where customDimensions.eventId == "LC0236"
| where timestamp > ago(30d) // adjust as needed
| project timestamp
// which extension/app is being validated
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
// validation info
, countryRegion = customDimensions.countryRegion
, diagnosticCode = customDimensions.diagnosticCode
, diagnosticMessage = customDimensions.diagnosticMessage
, diagnosticSeverity = customDimensions.diagnosticSeverity
, diagnosticSourceLocation = customDimensions.diagnosticSourceLocation
, diagnosticSourcePath = customDimensions.diagnosticSourcePath
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]


## <a name="extensionvalidationcompletedwithfailures"></a>Extension validation completed with failures (LC0237)

Occurs when the validation for a specific extension has completed, but errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed with failures: extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})** <br /><br /> `{extensionName}` indicates the name of the extension.<br /><br /> `{extensionVersion}` indicates the version of the extension.<br /><br /> `{extensionPublisher}` indicates the publisher of the extension.<br /><br /> `{extensionId}` indicates the ID of the extension.|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0237**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionVersion|[!INCLUDE[extensionVersion](../includes/include-telemetry-dimension-extension-version.md)]|
|countryRegion|Specifies the country/region that the extension was validated for.|
|failureReason|**One or more error diagnostics were reported. For more information about the diagnostics, see traces with eventId LC0236.**|
|[See common custom dimensions](#other)||


### Sample KQL code (Extension validation completed with failures)

This KQL code can help you get started analyzing breaking changes validation failures for a Marketplace app:

```kql
// Extension validation completed with failures (LC0237)
traces
| where customDimensions has "LC0237"
| where customDimensions.eventId == "LC0237"
| where timestamp > ago(30d) // adjust as needed
| project timestamp
// which extension/app is being validated
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
// validation info
, countryRegion = customDimensions.countryRegion
, failureReason = customDimensions.failureReason
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]


## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Marketplace submission validation telemetry](telemetry-appsource-submission-validation-trace.md)  
[Environment validation telemetry](telemetry-environment-validation-trace.md)  
