---
title: Analyzing AppSource Submission Validation Trace Telemetry
description: Learn about the telemetry for publishing apps to AppSource from Partner Center.  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, AppSource, validation
ms.date: 08/01/2021
ms.author: jswymer
---

# Analyzing AppSource Submission Validation Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 1, version 18.4, and later

When you submit an app to AppSource using Partner Center, it starts an automated validation process. This technical validation process ensures the extensions in the app meet the technical requirements for going live. It goes through many of the same checks described in [technical validation](https://aka.ms/CheckBeforeYouSubmit).

If an app's set up for it, telemetry traces are emitted to and recorded in Application Insights. The data provides details about the success or failure of different phases of the validation. For more information about setting up telemetry for an app, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## Validation process overview

The validation process starts when you publish the app. The validation runs against each extension in the app, for each country (market) specified for the offer in Partner Center, and for each Business Central version that the submissions targets. For more information versions, see [Against which releases of Business Central is your submission validated?](../developer/devenv-checklist-submission.md#versions).

Extensions are validated using the [AppSourceCop code analyzer](../developer/devenv-using-code-analysis-tool.md) and its rules. Traces are emitted at different phases during the process. Each submission is assigned a unique identifier (ID). This ID is included in each trace for a submission, allowing you to query all trace related to the submission. The general flow for the validation process is illustrated below:

1. AppSource submission validation request started
2. Version (X), country-region (X) validation started
3. Extension (X) validation started
4. Validation diagnostic reported for each error that occurs.
5. Extension (X) validation completed (successfully or with failures)
6. *Repeat 3-5 for each extension in the submission*
7. Version (X), country-region (X) validation completed (successfully or with failures)
8. *Repeat 2-7 for other country-regions for the Business Central release (X)*
9. *Repeat 2-8 for other Business Central releases targeted by the submission*
10. AppSource submission validation request completed (successfully or with failures)

To reduce the risk of failing the AppSource validation process, review the [technical validation](https://aka.ms/CheckBeforeYouSubmit) checklist before you submit an app.

## <a name="validationrequeststarted"></a>AppSource submission validation request started

Occurs when an app is published from Partner Center. For more information about publishing from Partner Center, see [Review and publish a Dynamics 365 offer - Validation and publishing steps](/azure/marketplace/dynamics-365-review-publish#validation-and-publishing-steps).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**AppSource submission validation request started: {validationRequestId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0028**|
|countryRegions|Lists the localized versions (markets) of the app that will be validated, like **US** or **DK**. |
|extensions|Specifies information about the extensions that are part of the submission, which will be validated.|
|severity|**Information**|
|versions|Lists the [Business Central release versions](../developer/devenv-checklist-submission.md#versions) that the app will be validated against, like **19.0** or **18.4** |

<!--
{"telemetrySchemaVersion":"0.1","eventId":"LC0028","validationRequestId":"0f5978be-00ff-48a6-970c-339a036e7877","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","severity":"Information","countryRegions":"DK, US","versions":"19.0"}
-->

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all AppSource submission validation traces. 

|Dimension|Description or value|
|---------|-----|
|validationRequestId|Specifies the unique identifier assigned to the app submission validation process. All traces for the submission validation will include this ID.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="versioncountrystarted"></a>(Version, country-region) validation started

Occurs when the validation has started for a specific version and country.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**(Version, country-region) validation started: version {version}, country/region {countryRegion}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0030**|
|allExtensions|Specifies information about the extensions that are part of the submission and extensions that the submission extensions depend on. Select the arrow to expand the dimension to see the details about each extension.|
|baselineExtensions|Specifies the previous versions of the extensions in the app and the extensions they're dependent on. These extensions form the baseline for validation if publishing a newer version of an app that's already published.|
|extensions|Specifies the extensions that are part of the submission and will be validated. Select the arrow to expand the dimension to see the details about each extension.|
|severity|**Information**|
|version|Specifies the [Business Central release versions](../developer/devenv-checklist-submission.md#versions) that the app will be validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||

<!--
{"telemetrySchemaVersion":"0.1","version":"19.0","eventId":"LC0030","validationRequestId":"eae270f4-5686-460c-99ec-73f9ece08fe5","baselineExtensions":"{\r\n \"Extensions\": []\r\n}","allExtensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n },\r\n {\r\n \"Id\": \"c1335042-3002-4257-bf8a-75c898ccb1b8\",\r\n \"Name\": \"Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26075.0\"\r\n },\r\n {\r\n \"Id\": \"8874ed3a-0643-4247-9ced-7a7002f7135d\",\r\n \"Name\": \"System\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"18.0.26014.0\"\r\n },\r\n {\r\n \"Id\": \"63ca2fa4-4f03-4f2b-a480-172fef340d3f\",\r\n \"Name\": \"System Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26075.0\"\r\n },\r\n {\r\n \"Id\": \"437dbf0e-84ff-417a-965d-ed2bb9650972\",\r\n \"Name\": \"Base Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26075.0\"\r\n }\r\n ]\r\n}","countryRegion":"US","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","severity":"Information"}
-->



## <a name="extensionvalidationstarted"></a>Extension validation started

Occurs when the validation for a specific extension the submission has started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation started: version {version}, country/region {countryRegion} for extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0032**|
|countryRegion|Specifies the localized version of the app that will be validated. |
| extensionId|Specifies the ID of the extension in the submission that will be validated.|
| extensionName|Specifies the name of the extension in the submission that will be validated.|
| extensionPublisher|Specifies the publisher of the extension in the submission that will be validated.|
| extensionVersion|Specifies the version of the extension in the submission that will be validated.|
|severity|**Information**|
|version|Specifies the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the extension will be validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||
<!--
{"version":"18.0","telemetrySchemaVersion":"0.1","validationRequestId":"c388ec8f-9b4a-40c3-a572-51af0722574a","extensionPublisher":"AppSource Publisher","extensionVersion":"1.0.0.0","countryRegion":"DK","extensionName":"AppSource Extension","eventId":"LC0032","extensionId":"1b8f9e14-dfc1-48c7-a8cb-d2223aa3c122","severity":"Information"}
-->


## <a name="validationdiagnosticreported"></a>Validation diagnostic reported

Occurs when an error occurs during the validation of an extension. The errors are the same as the [AppSourceCop Analyzer Rules](../developer/analyzers/appsourcecop.md).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Validation diagnostic reported: version {version}, country/region {countryRegion} for extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0034**|
|countryRegion|Specifies the localized version of the app that was validated. |
|diagnosticCode|Specifies the AppSourceCop rule ID of the error, like AS0001.|
|diagnosticMessage|Specifies AppSourceCop rule error message. |
|diagnosticSeverity|**Error**|
| extensionId|Specifies the ID of the extension in the submission that will be validated.|
| extensionName|Specifies the name of the extension in the submission that was validated.|
| extensionPublisher|Specifies the publisher of the extension in the submission that was validated.|
| extensionVersion|Specifies the version of the extension in the submission that was validated.|
|severity|**Error**|
|version|Specifies the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the extension was validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||

<!--
{"version":"19.0","telemetrySchemaVersion":"0.1","extensionPublisher":"AppSource Publisher","extensionVersion":"1.0.0.0","extensionName":"AppSource Simple","extensionId":"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3","eventId":"LC0034","validationRequestId":"e31b8fb1-f790-457f-8a07-f3ae9bc411b2","countryRegion":"DK","severity":"Error","diagnosticSeverity":"Error","diagnosticMessage":"Only use AssertError in Test Codeunits.","diagnosticCode":"AS0058"}
-->

## <a name="extensionvalidationcompleted"></a>Extension validation completed successfully

Occurs when the validation for a specific extension the submission has completed, and no errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed successfully: version {version}, country/region {countryRegion} for extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0033**|
|countryRegion|Specifies the localized version of the app that was validated. |
| extensionId|Specifies the ID of the extension in the submission that will be validated.|
| extensionName|Specifies the name of the extension in the submission that was validated.|
| extensionPublisher|Specifies the publisher of the extension in the submission that was validated.|
| extensionVersion|Specifies the version of the extension in the submission that was validated.|
|severity|**Information**|
|version|Specifies the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the extension was validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||
<!--
{"telemetrySchemaVersion":"0.1","version":"19.0","extensionPublisher":"AppSource Publisher","extensionVersion":"1.0.0.0","extensionName":"AppSource Simple","extensionId":"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3","eventId":"LC0033","result":"Failure","validationRequestId":"0f5978be-00ff-48a6-970c-339a036e7877","baselineExtensions":"{\r\n \"Extensions\": []\r\n}","allExtensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n },\r\n {\r\n \"Id\": \"c1335042-3002-4257-bf8a-75c898ccb1b8\",\r\n \"Name\": \"Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26037.0\"\r\n },\r\n {\r\n \"Id\": \"8874ed3a-0643-4247-9ced-7a7002f7135d\",\r\n \"Name\": \"System\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"18.0.26014.0\"\r\n },\r\n {\r\n \"Id\": \"63ca2fa4-4f03-4f2b-a480-172fef340d3f\",\r\n \"Name\": \"System Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26037.0\"\r\n },\r\n {\r\n \"Id\": \"437dbf0e-84ff-417a-965d-ed2bb9650972\",\r\n \"Name\": \"Base Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26037.0\"\r\n }\r\n ]\r\n}","countryRegion":"DK","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","severity":"Error","failureReason":"One  more extension validation tasks have failed."}


{"telemetrySchemaVersion":"0.1","extensionPublisher":"AppSource Publisher","version":"18.1","extensionVersion":"1.0.0.0","extensionName":"AppSource Library","extensionId":"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3","eventId":"LC0033","validationRequestId":"e1e07164-f630-4b72-bd78-5807311e23ad","countryRegion":"DK","severity":"Information"}

-->

## <a name="extensionvalidationcompletedwithfailures"></a>Extension validation completed with failures

Occurs when the validation for a specific extension the submission has completed, but errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension validation completed with failures: version {version}, country-region {countryRegion} for extension {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0037**|
|countryRegion|Specifies the localized version of the app that was validated. |
| extensionId|Specifies the ID of the extension in the submission that will be validated.|
| extensionName|Specifies the name of the extension in the submission that was validated.|
| extensionPublisher|Specifies the publisher of the extension in the submission that was validated.|
| extensionVersion|Specifies the version of the extension in the submission that was validated.|
|failureReason|**One or more extension validation tasks have failed**|
|severity|**Error**|
|version|Specifies the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the extension was validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||
<!--
{"version":"19.0","telemetrySchemaVersion":"0.1","extensionPublisher":"AppSource Publisher","extensionVersion":"1.0.0.0","extensionName":"AppSource Simple","extensionId":"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3","eventId":"LC0037","validationRequestId":"e31b8fb1-f790-457f-8a07-f3ae9bc411b2","countryRegion":"DK","severity":"Error","failureReason":"One  more extension validation tasks have failed."}
-->

## <a name="versioncountrycompleted"></a>(Version, country-region) validation completed successfully

Occurs when the validation has completed for a specific version and country, and no errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**(Version, country-region) validation completed successfully: version {version}, country/region {countryRegion}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0031**|
|allExtensions|Specifies information about the extensions that were part of the submission and extensions that the submission extensions depend on. Select the arrow to expand the dimension to see the details about each extension.|
|baselineExtensions|Specifies the previous versions of the extensions in the app and the extensions they're dependent on. These extensions form the baseline for validation if publishing a newer version of an app that's already published.|
|countryRegion|Specifies the localized version of the app that was validated. |
|extensions|Specifies the extensions that were part of the submission and were validated. Select the arrow to expand the dimension to see the details about each extension.|
|severity|**Information**|
|version|Specifies the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the app was validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||
<!--
{"telemetrySchemaVersion":"0.1","version":"19.0","eventId":"LC0031","result":"Failure","validationRequestId":"0f5978be-00ff-48a6-970c-339a036e7877","baselineExtensions":"{\r\n \"Extensions\": []\r\n}","allExtensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n },\r\n {\r\n \"Id\": \"c1335042-3002-4257-bf8a-75c898ccb1b8\",\r\n \"Name\": \"Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26037.0\"\r\n },\r\n {\r\n \"Id\": \"8874ed3a-0643-4247-9ced-7a7002f7135d\",\r\n \"Name\": \"System\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"18.0.26014.0\"\r\n },\r\n {\r\n \"Id\": \"63ca2fa4-4f03-4f2b-a480-172fef340d3f\",\r\n \"Name\": \"System Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26037.0\"\r\n },\r\n {\r\n \"Id\": \"437dbf0e-84ff-417a-965d-ed2bb9650972\",\r\n \"Name\": \"Base Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26037.0\"\r\n }\r\n ]\r\n}","countryRegion":"DK","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","severity":"Error","failureReason":"One  more error diagnostics were reported."}
-->

## <a name="versioncountryvalidationcompletedwithfailures"></a>(Version, country-region) validation completed with failures

Occurs when the validation has completed for a specific version and country, and errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**(Version, country-region) validation completed with failures: version {version}, country-region {countryRegion}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0036**|
|allExtensions|Specifies information about the extensions that were part of the submission and extensions that the submission extensions depend on. Select the arrow to expand the dimension to see the details about each extension.|
|baselineExtensions|Specifies the previous versions of the extensions in the app and the extensions they're dependent on. These extensions form the baseline for validation if publishing a newer version of an app that's already published.|
|countryRegion|Specifies the localized version of the app that was validated. |
|extensions|Specifies the extensions that were part of the submission and were validated. Select the arrow to expand the dimension to see the details about each extension.|
|failureReason|**One  more extension validation tasks have failed.**|
|severity|**Error**|
|version|Specifies the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the app was validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||
<!--
{"version":"19.0","telemetrySchemaVersion":"0.1","eventId":"LC0036","validationRequestId":"24995dae-01f2-4523-b3dc-b4e54cb25c7e","countryRegion":"DK","severity":"Error","baselineExtensions":"{\r\n \"Extensions\": []\r\n}","failureReason":"One  more error diagnostics were reported.","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","allExtensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n },\r\n {\r\n \"Id\": \"c1335042-3002-4257-bf8a-75c898ccb1b8\",\r\n \"Name\": \"Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26290.3402\"\r\n },\r\n {\r\n \"Id\": \"8874ed3a-0643-4247-9ced-7a7002f7135d\",\r\n \"Name\": \"System\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"18.0.26244.0\"\r\n },\r\n {\r\n \"Id\": \"63ca2fa4-4f03-4f2b-a480-172fef340d3f\",\r\n \"Name\": \"System Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26290.3402\"\r\n },\r\n {\r\n \"Id\": \"437dbf0e-84ff-417a-965d-ed2bb9650972\",\r\n \"Name\": \"Base Application\",\r\n \"Publisher\": \"Microsoft\",\r\n \"Version\": \"19.0.26290.3402\"\r\n }\r\n ]\r\n}"}
-->

## <a name="validationrequestcompleted"></a>AppSource submission validation request completed successfully

Occurs when the submission validation process has fully completed, and no errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**AppSource submission validation request completed successfully: {validationRequestId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0029**|
|countryRegions|Lists the localized versions (markets) of the app that were validated, like **US** or **DK**.|
|extensions|Specifies information about the extensions that were part of the submission and validated.|
|severity|**Information**|
|versions|Lists the [Business Central release](../developer/devenv-checklist-submission.md#versions) that the app was validated against, like **19.0** or **18.4**. |
|[See common custom dimensions](#other)||
<!--
{"telemetrySchemaVersion":"0.1","eventId":"LC0029","result":"Failure","validationRequestId":"eae270f4-5686-460c-99ec-73f9ece08fe5","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","severity":"Error","countriesRegions":"US, CA","versions":"19.0"}
-->

## <a name="submissionrequestcompletedwithfailures"></a>AppSource submission validation request completed with failures

Occurs when the submission validation process has fully completed, but errors occurred.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**AppSource submission validation request completed with failures: {validationRequestId}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0035**|
|countryRegions|Lists the localized versions (markets) of the app that were validated, like **US** or **DK**.|
|extensions|Specifies the extensions that were part of the submission and validated.|
|failureReason|**One  more extension validation tasks have failed.**|
|severity|**Error**|
|versions|Lists the [Business Central releases](../developer/devenv-checklist-submission.md#versions) that the app was validated against, like **19.0** or **18.4**.|
|[See common custom dimensions](#other)||
<!--
{"telemetrySchemaVersion":"0.1","eventId":"LC0035","validationRequestId":"e31b8fb1-f790-457f-8a07-f3ae9bc411b2","severity":"Error","failureReason":"One  more extension validation tasks have failed.","extensions":"{\r\n \"Extensions\": [\r\n {\r\n \"Id\": \"a3fe8b08-c1ce-4194-aedf-a677bf5b7eb3\",\r\n \"Name\": \"AppSource Simple\",\r\n \"Publisher\": \"AppSource Publisher\",\r\n \"Version\": \"1.0.0.0\"\r\n }\r\n ]\r\n}","countryRegions":"[\r\n \"DK\",\r\n \"US\"\r\n]","versions":"[\r\n \"19.0\"\r\n]"}
-->
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Prepare a Configuration Package](/dynamics365/business-central/admin-how-to-prepare-a-configuration-package) in the [!INCLUDE[prod_short](../includes/prod_short.md)]  
