---
title: Analyzing Changelog Configuration Changes Telemetry
description: Learn about the telemetry for monitoring changes to changelog configuration in Business Central  
author: kennienp
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, data, sensitive
ms.date: 10/23/2023
ms.author: kepontop
ms.reviewer: jswymer
---

# Analyzing changelog configuration changes telemetry

**INTRODUCED IN:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 2, version 23.0. 

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] changelog feature lets you track direct modifications a user makes to data in the database. You specify each table and field that you want the system to log, and then you activate the changelog. The changelog is based on changes that are made to data in the tables that you track. 

For more information about the changelog feature, see [Auditing changes in Business Central](/dynamics365/business-central/across-log-changes).

Telemetry is logged for the following changes to the configuration of the changelog:
- When a field is added to be tracked in the changelog.
- When changelog configuration for a field is changed.
- When a field is removed for being tracked in the changelog.

## <a name="added"></a>Field added to changelog configuration

Occurs when a field is added to be tracked in the changelog.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Field added to changelog configuration**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000LA2**|
|alTableNumber| Specifies the ID of the table where the changed field is included. |
|alTableCaption| Specifies the name of the table where the changed field is included. |
|alFieldNumber | Specifies the ID of the field to be logged. |
|alFieldCaption| Specifies the name of the field to be logged.|
|alLogInsertion| Are insertions logged? (**Yes** or **No**) |
|alLogModification| Are data modifications logged? (**Yes** or **No**) |
|alLogDeletion| Are deletions logged? (**Yes** or **No**)|


### Sample KQL code (field added)

This KQL code can help you get started analyzing change log telemetry for added fields or if you want to alert on these changes.

```kql
// Field added to change log configuration
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000LA2' // for performance
| where customDimensions.eventId == 'AL0000LA2'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// on which field in which table
, alTableNumber = customDimensions.alTableNumber
, alTableCaption = customDimensions.alTableCaption
, alFieldNumber = customDimensions.alFieldNumber
, alFieldCaption = customDimensions.alFieldCaption
// what was the configuration change
, alLogInsertion = customDimensions.alLogInsertion
, alLogModification = customDimensions.alLogModification
, alLogDeletion = customDimensions.alLogDeletion
// which user made the configuration change
, UsertelemetryId = user_Id
```


## <a name="changed"></a>Field logging changed in changelog configuration

Occurs when changelog configuration for a field is changed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Field logging changed in changelog configuration** |
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000LA1**|
|alTableNumber| Specifies the ID of the table where the changed field is included. |
|alTableCaption| Specifies the name of the table where the changed field is included. |
|alFieldNumber | Specifies the ID of the field to be logged. |
|alFieldCaption| Specifies the name of the field to be logged.|
|alLogInsertion| Are insertions logged? (**Yes** or **No**) |
|alLogInsertionOld| Were insertions logged before? (**Yes** or **No**) |
|alLogModification| Are data modifications logged? (**Yes** or **No**) |
|alLogModificationOld| Were data modifications logged before? (**Yes** or **No**) |
|alLogDeletion| Are deletions logged? (**Yes** or **No**)|
|alLogDeletionOld| Were deletions logged before? (**Yes** or **No**)|


### Sample KQL code (field logging changed)
This KQL code can help you get started analyzing change log telemetry for changed logging of fields or if you want to alert on these changes.

```kql
// Field logging changed in changelog configuration
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000LA1' // for performance
| where customDimensions.eventId == 'AL0000LA1'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// on which field in which table
, alTableNumber = customDimensions.alTableNumber
, alTableCaption = customDimensions.alTableCaption
, alFieldNumber = customDimensions.alFieldNumber
, alFieldCaption = customDimensions.alFieldCaption
// what was the configuration change
, alLogDeletion = customDimensions.alLogDeletion
, alLogInsertionOld = customDimensions.alLogInsertionOld
, alLogInsertion = customDimensions.alLogInsertion
, alLogDeletionOld = customDimensions.alLogDeletionOld
, alLogModification = customDimensions.alLogModification
, alLogModificationOld = customDimensions.alLogModificationOld
// which user made the configuration change
, UsertelemetryId = user_Id
```

## <a name="removed"></a>Field removed from changelog configuration

Occurs when a field is removed for being tracked in the changelog.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Field removed from changelog configuration**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000LA3**|
|alTableNumber| Specifies the ID of the table where the changed field is included. |
|alTableCaption| Specifies the name of the table where the changed field is included. |
|alFieldNumber | Specifies the ID of the field to no longer be logged. |
|alFieldCaption| Specifies the name of the field to no longer be logged.|


### Sample KQL code (field removed)
This KQL code can help you get started analyzing change log telemetry for removed fields or if you want to alert on these changes.

```kql
// Field removed from changelog configuration
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000LA3' // for performance
| where customDimensions.eventId == 'AL0000LA3'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// on which field in which table
, alTableNumber = customDimensions.alTableNumber
, alTableCaption = customDimensions.alTableCaption
, alFieldNumber = customDimensions.alFieldNumber
, alFieldCaption = customDimensions.alFieldCaption
// which user made the configuration change
, UsertelemetryId = user_Id
```

## Performance effect of enabling change logging on a table

[!INCLUDE[change_logging_performance](../includes/change_logging_performance.md)]

## See also
[Auditing Changes in Business Central](/dynamics365/business-central/across-log-changes)  
[Field monitoring telemetry](telemetry-field-monitoring-trace.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)   
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on telemetry](telemetry-alert.md)   
