---
title: Feature Telemetry
description: Learn about the telemetry that you can emit from features in Business Central.  
author: bholtorf
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, data, sensitive
ms.date: 05/01/2021
ms.author: bholtorf
---

# Feature Telemetry
The Telemetry AL module simplifies the way you monitor the health of your solution and the uptake of application features. There are multiple benefits of using the module compared to sending telemetry via Session.LogMessage. For example:

* Different features can be compared across the same metrics.
* Common information is sent together with every feature telemetry message, which allows for advanced filtering capabilities.

## Example: Register the use of a feature
It's easy to use the Feature Telemetry codeunit. For example, to register the usage of a feature it's enough to use the `FeatureTelemetry.LogUsage(<tag>, <feature name>, <event name>);` method. After the telemetry is emitted, you can aggregate and display the data. For example, by using the Feature Usage Power BI report. The report is available on our [BCTech](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/AL/FeatureTelemetry/Feature%20Usage.pbix) GitHub repository.

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

Calling `LogUptake` when the uptake state is Undiscovered resets the uptake state of the feature. The telemetry from this call will be used to calculate the values in the uptake funnel of the feature.

## Logging uptake
If a feature logs uptake, there should be calls to register the `Discovered`, `Set up`, and `Used` states.

The current convention for registering uptake states is the following:

* `Discovered` should be registered when pages related to the given feature are opened (or otherwise when a user intentionally seeks information about a feature).
* `Set up` should be registered when the user performed a set up for the feature (usually right after a record in a table related to the feature is added or updated).
* `Used` should be registered when a user attempts to use the feature (note the difference with LogUsage, which should be called only if the feature is used successfully).

If LogUptake is called from within a try function, the `PerformWriteTransactionsInASeparateSession` parameter should be set to `true`.

## Feature and event names
The feature names should be short and easy to identify. For example, Retention policies, Configuration packages, and Emailing.
The event names should specify the scenario being executed. If `LogUsage` is called, the event name should use the past tense because the event has already happened. For example, `Email sent` or `Retention policy applied`. If `LogError` is called, the event name should use the present tense. For example, `Sending email`, `Loading template`).

## General dimensions

|Dimension  | Description or value  |
|---------|---------|
|message     | Depends on the event.        |
|severityLevel     |**1**         |

## Custom dimensions
|Dimension  | Description or value  |
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**.|
|alCategory     | **FeatureTelemetry**        |
|alCallerAppName     | The name of the extension that emitted telemetry.      |
|alCallerAppVersionMajor     | The major version of the extension that emitted telemetry. |
|alCallerAppVersionMinor     | The minor version of the extension that emitted telemetry.        |
|alClientType     | The client type of the session.        |
|alCompany     | The current company name.       |
|alIsEvaluationCompany     | Whether the current company is an evaluation company.        |
|alTenantLicenseState     | The license state of the tenant.        |
|alIsAdmin     | Whether the current user is a tenant admin or delegated admin.        |
|alCountryCode     | The country code of Business Central localization.        |
|alDataClassification|**SystemMetadata**|
|alObjectId     | **8713**        |
|alObjectName     | **System Telemetry Logger**        |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the **component** dimension).|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments). This dimension isn't included for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments).|
|telemetrySchemaVersion|Specifies the version of the Business Central telemetry schema.|
|eventId     | Unique event ID for different feature telemetry events.        |

## See Also
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md) 