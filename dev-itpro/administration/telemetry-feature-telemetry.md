---
title: Feature telemetry
description: Learn about the telemetry that you can emit from features in Business Central.
author: bholtorf
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, data, sensitive
ms.date: 07/13/2023
ms.author: bholtorf
---

# Feature telemetry

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

The Telemetry AL module simplifies the way you monitor the health of your app and the uptake of application features. There are multiple benefits of using the module compared to sending telemetry via `Session.LogMessage`. For example:

* Different features can be compared across the same metrics.
* Common information is sent together with every feature telemetry message, which allows for advanced filtering capabilities.

## Register the feature telemetry module in an app
If you want to get feature telemetry to the app/extension telemetry pipeline, you must add a codeunit that implements the "Telemetry Logger" interface. Below is a simple example on such a codeunit.

```AL
/// Adds support for the extension to use the "Telemetry" and "Feature Telemetry" codeunits.
/// </summary>
codeunit 50101 "Sample Telemetry Logger" implements "Telemetry Logger"
{
    Access = Internal;

    procedure LogMessage(EventId: Text; Message: Text; Verbosity: Verbosity; DataClassification: DataClassification; TelemetryScope: TelemetryScope; CustomDimensions: Dictionary of [Text, Text])
    begin
        Session.LogMessage(EventId, Message, Verbosity, DataClassification, TelemetryScope, CustomDimensions);
    end;

    // For the functionality to behave as expected, there must be exactly one implementation of the "Telemetry Logger" interface registered per app publisher
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Telemetry Loggers", 'OnRegisterTelemetryLogger', '', true, true)]
    local procedure OnRegisterTelemetryLogger(var Sender: Codeunit "Telemetry Loggers")
    var
        SampleTelemetryLogger: Codeunit "Sample Telemetry Logger";
    begin
        Sender.Register(SampleTelemetryLogger);
    end;
}
```

## Log the use of a feature (usage or errors)

It's easy to use the Feature Telemetry codeunit. For example, to register the usage of a feature, you can just use the `FeatureTelemetry.LogUsage(<tag>, <feature name>, <event name>);` method. After the telemetry is emitted, you can aggregate and display the data. For example, you can use the **Feature Usage** Power BI report. The report is available on our [BCTech](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/AL/FeatureTelemetry/Feature%20Usage.pbix) GitHub repository.

:::image type="content" source="../media/FeatureUsageReport.png" alt-text="The FeatureUsage Power BI report":::

There are three kinds of events that a feature can log through the Feature Telemetry codeunit.

`FeatureTelemetry.<LogUsage|LogError|LogUptake>(...)`

* `LogUsage` should be called when the feature is successfully used by a user.
* `LogError` should be called when an error must be explicitly sent to telemetry. For example, after a call to a try function, when `Codeunit.Run` returned false, when sending an http response error message, and so on.
* `LogUptake` should be called when a user changes the uptake state of a feature. There are four uptake states for features:
  * `Undiscovered`
  * `Discovered`
  * `Set up`
  * `Used`

> [!NOTE]
> Tracking the uptake status of a feature may make database transactions. If `LogUptake` is called from within a try function, the `PerformWriteTransactionsInASeparateSession` parameter should be set to `True`.

Calling `LogUptake` when the uptake state is `Undiscovered` resets the uptake state of the feature. The telemetry from this call will be used to calculate the values in the uptake funnel of the feature.

## Log uptake

If a feature logs uptake, there should be calls to register the `Discovered`, `Set up`, and `Used` states. The following list describes the current convention for registering uptake states:

* `Discovered` should be registered when pages related to the given feature are opened (or when a user looks for information about a feature).
* `Set up` should be registered when the user performed a set up for the feature (usually right after a record in a table related to the feature is added or updated).
* `Used` should be registered when a user attempts to use the feature (note the difference with LogUsage, which should be called only if the feature is used successfully).

If `LogUptake` is called from a try function, the `PerformWriteTransactionsInASeparateSession` parameter should be set to `true`.

## Feature and event names

Feature names should be short and easy to identify. For example, *Retention policies*, *Configuration packages*, and *Emailing*. Event names should specify the scenario being executed. If `LogUsage` is called, the event name should use the past tense because the event has already happened. For example, `Email sent` or `Retention policy applied`. If `LogError` is called, the event name should use the present tense. For example, `Sending email`, `Loading template`).

## General dimensions

|Dimension  | Description or value  |
|---------|---------|
|message     | Depends on the event.        |
|severityLevel     |**1**         |
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

## Custom dimensions (for all subcategories)

|Dimension  | Description or value  |
|---------|---------|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**.|
|alCategory     | **FeatureTelemetry**.  |
|alFeatureName  | The name of the feature being tracked.  |
|alSubCategory     | Holds one of the values **Uptake**, **Usage**, or **Error**.  |
|alFeatureUptakeStatus| If alSubCategory holds the value **Uptake**, then the update status can hold one of the following values: **Discovered**, **Set up**, **Undiscovered**, or **Used**.
|alCallerAppId       | The id of the extension that emitted telemetry.      |
|alCallerAppName     | The name of the extension that emitted telemetry.      |
|alCallerPublisher   | The publisher of the extension that emitted telemetry.      |
|alCallerAppVersion  | The version of the extension that emitted telemetry.      |
|alCallerAppVersionMajor     | The major version of the extension that emitted telemetry. |
|alCallerAppVersionMinor     | The minor version of the extension that emitted telemetry.        |
|alClientType     | The client type of the session.        |
|alCompany     | The current company name.       |
|alIsEvaluationCompany | [!INCLUDE[environmentType](../includes/include-telemetry-dimension-is-evaluation-company.md)] |
|alTenantLicenseState     | [!INCLUDE[environmentType](../includes/include-telemetry-dimension-tenant-license-state.md)] |
|alIsAdmin     | [!INCLUDE[environmentType](../includes/include-telemetry-dimension-is-tenant-admin.md)]|
|alCountryCode     | [!INCLUDE[environmentType](../includes/include-telemetry-dimension-country-code.md)] |
|alDataClassification|**SystemMetadata**. Fixed and set by the Feature Telemetry codeunit.|
|alObjectId     | **8713**. The object ID of the Feature Telemetry codeunit.        |
|alObjectName     | **System Telemetry Logger**. The name of the codeunit used by the Feature Telemetry codeunit. |
|alUserRole| The profile ID associated with the user in the User Personalization table.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the **component** dimension).|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments). This dimension isn't included for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments).|
|telemetrySchemaVersion|Specifies the version of the Business Central telemetry schema.|
|eventId     | Unique event ID for different feature telemetry events.        |

## Custom dimensions (for the Error subcategory)
For error telemetry emitted using LogError, two extra dimensions are added to custom dimensions.

|Dimension  | Description or value  |
|---------|---------|
|alErrorCallStack| The AL stacktrace when the error happened. Typically, this is the stacktrace generated by the GetLastErrorCallStack method. |
|alErrorText| A text that describes what the error is about. Typically, this is the error text generated by the GetLastErrorText method. |


## Sample KQL code for usage, errors, and uptake

This KQL code can help you get started analyzing uptake telemetry

```kql
// Uptake telemetry - logged from FeatureTelemetry.LogUptake
traces
| where timestamp > ago(5d) // adjust as needed
| where customDimensions.alCategory == 'FeatureTelemetry'
| where customDimensions.alSubCategory == 'Uptake'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.alClientType
, featureName = customDimensions.alFeatureName
, eventId = customDimensions.eventId
, eventName = customDimensions.alEventName
, category = customDimensions.alCategory
, appName = customDimensions.alCallerAppName // added in 20.0
, appId = customDimensions.alCallerAppId     // added in 22.0
, appPublisher = customDimensions.alCallerPublisher // added in 20.0
, appVersion = customDimensions.alCallerAppVersion // added in 20.0
, usertelemetryId = case(
  // user telemetry id was introduced in the platform in version 20.0
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id
, 'N/A'
)
```

This KQL code can help you get started analyzing error telemetry

```kql
// Errors - logged from FeatureTelemetry.LogError
traces
| where timestamp > ago(5d)
| where customDimensions.alCategory == 'FeatureTelemetry'
| where customDimensions.alSubCategory == 'Error'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.alClientType
, eventId = customDimensions.eventId
, featureName = customDimensions.alFeatureName
, eventName = customDimensions.alEventName
, category = customDimensions.alCategory
, appName = customDimensions.alCallerAppName // added in 20.0
, appId = customDimensions.alCallerAppId     // added in 22.0
, appPublisher = customDimensions.alCallerPublisher // added in 20.0
, appVersion = customDimensions.alCallerAppVersion // added in 20.0
, errorCallStack = customDimensions.alErroCallStack
, errorText = customDimensions.alErrorText
, usertelemetryId = case(
  // user telemetry id was introduced in the platform in version 20.0
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id
, 'N/A'
)
```

This KQL code can help you get started analyzing usage telemetry

```kql
// Usage - logged from FeatureTelemetry.LogUsage
traces
| where timestamp > ago(5d)
| where customDimensions.alCategory == 'FeatureTelemetry'
| where customDimensions.alSubCategory == 'Usage'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.alClientType
, eventId = customDimensions.eventId
, featureName = customDimensions.alFeatureName
, eventName = customDimensions.alEventName
, category = customDimensions.alCategory
, appName = customDimensions.alCallerAppName // added in 20.0
, appId = customDimensions.alCallerAppId     // added in 22.0
, appPublisher = customDimensions.alCallerPublisher // added in 20.0
, appVersion = customDimensions.alCallerAppVersion // added in 20.0
, usertelemetryId = case(
  // user telemetry id was introduced in the platform in version 20.0
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id
, 'N/A'
)
```


## Error telemetry for the app publisher
When you use the feature telemetry module in your app, it's important to register exactly one telemetry logger. If you fail to do so, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server logs an event to your telemetry.

## <a name="multipleloggers"></a>More than one telemetry logger has been registered for publisher {publisher}
This event is logged if more than one telemetry logger has been registered for publisher.

### General dimensions

|Dimension  | Description or value  |
|---------|---------|
|message     | More than one telemetry logger has been registered for publisher {publisher} |


### Custom dimensions

|Dimension  | Description or value  |
|---------|---------|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises solutions that do not use Microsoft Entra authentication, this value is **common**.|
|alCallerAppName     | The name of the extension that emitted telemetry.      |
|alCallerAppPublisher     | The name of the extension that emitted telemetry.      |
|alCallerAppVersion     | The name of the extension that emitted telemetry.      |
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments). This dimension isn't included for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments).|
|eventId     | **AL0000G7J**        |

### Sample KQL code
This KQL code can help you get started analyzing if an app has registered more than one telemetry logger.

```kql
// More than one telemetry logger has been registered for publisher <publisher>
// The owner of the app needs to fix this if they want telemetry from the Feature Telemetry system module
traces
| where timestamp > ago(7d) // change as needed
| where customDimensions has 'AL0000G7J'
| where customDimensions.eventId == 'AL0000G7J'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, appId = customDimensions.alCallerAppId
, appPublisher = customDimensions.alCallerPublisher
, appName = customDimensions.alCallerAppName
, appVersion = customDimensions.alCallerAppVersion
```


## <a name="nologger"></a>No telemetry logger has been registered for publisher {publisher}
This event is logged if no telemetry logger has been registered for publisher.

### General dimensions

|Dimension  | Description or value  |
|---------|---------|
|message     | An app from publisher {publisher} is sending telemetry, but there's no registered telemetry logger for this publisher |

### Custom dimensions

|Dimension  | Description or value  |
|---------|---------|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**.|
|alCallerAppName     | The name of the extension that emitted telemetry.      |
|alCallerAppPublisher     | The name of the extension that emitted telemetry.      |
|alCallerAppVersion     | The name of the extension that emitted telemetry.      |
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments). This dimension isn't included for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments).|
|eventId     | **AL0000G7K**        |

### Sample KQL code
This KQL code can help you get started analyzing if no telemetry logger has been registered for an app.

```kql
// An app from the publisher <publisher> sends telemetry, but there is no registered telemetry logger for this publisher.
// The owner of the app must fix this if they want telemetry from the Feature Telemetry system module
traces
| where timestamp > ago(7d) // change as needed
| where customDimensions has 'AL0000G7K'
| where customDimensions.eventId == 'AL0000G7K'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, appId = customDimensions.alCallerAppId
, appPublisher = customDimensions.alCallerPublisher
, appName = customDimensions.alCallerAppName
, appVersion = customDimensions.alCallerAppVersion
```


## See also

[Telemetry Overview](telemetry-overview.md)
[Enable Telemetry in Business Central](telemetry-enable-application-insights.md)
[Feature Telemetry sample code](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/AL/FeatureTelemetry)
[System Application Overview](../developer/devenv-system-application-overview.md)
[Feature Telemetry System Application Documentation](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Telemetry)
[Feature Telemetry Codeunit Reference Documentation](/dynamics365/business-central/application/reference/system%20application/codeunit/system_application_codeunit_feature_telemetry)
[Feature Management Telemetry](telemetry-feature-management-trace.md)
