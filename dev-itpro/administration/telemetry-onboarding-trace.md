---
title: Analyzing onboarding telemetry 
description: Learn about the onboarding telemetry in Business Central  
author: brentholtorf
ms.topic: conceptual
ms.search.keywords: telemetry, onboarding
ms.date: 12/21/2023
ms.author: kepontop
ms.service: dynamics365-business-central
ms.reviewer: brentholtorf
ms.custom: bap-template
---

# Analyzing onboarding telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2023 release wave 1, update 22.1, and later

Onboarding telemetry gathers data about the following operations: 

- Onboarding started by a user in a company
- Onboarding criteria completed by a user in a company

## <a name="started"></a>Onboarding Started

Occurs when a user initiates onboarding in a company.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Onboarding Started**|
|user_Id|[!INCLUDE [include-telemetry-dimension-user-id](../includes/include-telemetry-dimension-user-id.md)]|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alCountryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|alUserRole|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-user-role.md)]|
|alIsAdmin|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-is-admin.md)]|
|alIsEvaluationCompany|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-is-evaluation-company.md)]|
|alTenantLicenseState|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-tenant-license-state.md)]|
|companyName|[!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**AL0000EIW**|

## <a name="CriteriaCompleted"></a>Onboarding Criteria completed

Occurs when a user completes onboarding criteria in a company.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Onboarding completed for criteria: {Criteria}**|
|user_Id|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alCountryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|alCriteria| The onboarding criteria that the user completes. |
|alUserRole|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-user-role.md)]|
|alIsAdmin|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-is-admin.md)]|
|alIsEvaluationCompany|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-is-evaluation-company.md)]|
|alTenantLicenseState|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-tenant-license-state.md)]|
|companyName|[!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**AL0000EIV**|

## See also

[Measure onboarding progress using telemetry](onboarding-telemetry.md)
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  

