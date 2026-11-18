---
title: Analyzing Onboarding Trace Telemetry
description: Analyze onboarding telemetry in Business Central to track registered onboarding signals, completed criteria, and the dates associated with each signal.
author: brentholtorf
ms.topic: reference
ai-usage: ai-assisted
ms.search.keywords: telemetry, onboarding
ms.date: 11/17/2026
ms.author: kepontop

ms.reviewer: jswymer
ms.custom: bap-template
---

# Analyzing onboarding telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2023 release wave 1, update 22.1, and later

Onboarding telemetry gathers data about the following operations: 

- An onboarding signal is registered for a company
- A registered onboarding signal meets its completion criteria

These events use normal verbosity (`severityLevel` **1**) and `TelemetryScope::All`.

## <a name="started"></a>Onboarding started

Occurs when a new onboarding signal is registered for a company and signal type. Registering an existing signal doesn't emit another event.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Onboarding Signal Started: {signal type}**|
|user_Id|[!INCLUDE [include-telemetry-dimension-user-id](../includes/include-telemetry-dimension-user-id.md)]|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alCountryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|alCriteriaName|The name of the registered onboarding signal type.|
|alCriteriaId|The numeric ID of the onboarding signal type.|
|alStartDate|The date when the signal was registered, in XML date format.|
|alCompleteDate|The completion date, which isn't set when the signal is registered.|
|alRegisterExtensionId|The ID of the extension that registered the signal.|
|alUserRole|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-user-role.md)]|
|alIsAdmin|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-is-admin.md)]|
|alIsEvaluationCompany|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-is-evaluation-company.md)]|
|alTenantLicenseState|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-tenant-license-state.md)]|
|companyName|[!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|componentVersion|The version of the Business Central Server component that emits telemetry.|
|eventId|**AL0000EIW**|

## <a name="CriteriaCompleted"></a>Onboarding criteria completed

Occurs when a registered onboarding signal's provider reports that its criteria are met. The completion check runs during daily telemetry collection. It skips evaluation companies and sandbox environments.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Onboarding Signal Completed: {signal type}**|
|user_Id|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alCountryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|alCriteriaName|The name of the completed onboarding signal type.|
|alCriteriaId|The numeric ID of the onboarding signal type.|
|alStartDate|The date when the signal was registered, in XML date format.|
|alCompleteDate|The date when the completion check detected that the criteria were met, in XML date format.|
|alRegisterExtensionId|The ID of the extension that registered the signal.|
|alUserRole|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-user-role.md)]|
|alIsAdmin|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-is-admin.md)]|
|alIsEvaluationCompany|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-is-evaluation-company.md)]|
|alTenantLicenseState|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-tenant-license-state.md)]|
|companyName|[!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|componentVersion|The version of the Business Central Server component that emits telemetry.|
|eventId|**AL0000EIV**|

## Related information

[Measure onboarding progress using telemetry](onboarding-telemetry.md)
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  

