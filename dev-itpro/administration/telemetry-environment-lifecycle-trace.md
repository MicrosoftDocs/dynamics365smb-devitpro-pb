---
title:  Analyzing Environment Lifecycle Trace Telemetry 
description: Learn about the environment lifecycle telemetry in Business Central.
author: KennieNP
ms.author: kepontop
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 02/21/2023
ms.custom: bap-template
ms.service: dynamics365-business-central
---
# Analyzing Environment Lifecycle Trace Telemetry

[!INCLUDE[component](../developer/includes/online_only.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Environment lifecycle telemetry gathers data about the success or failure of the following environment-related operations:

- Update an environment
- Start/stop/restart an environment
- Copy an environment
- Point-in-time restore an environment
- Move an environment to a difference Microsoft Entra tenant
- Cancel a session from the Business Central admin center
- Export the environment database
- Change the environment configuration 
- Delete an environment
- Rename an environment

Telemetry is also gathered on the following data update events:

- Data upgrade started
- Data upgrade succeeded
- Data upgrade failed
- Data upgrade recovery succeeded
- Data upgrade recovery failed

Failed operations result in a trace log entry that includes a reason for the failure.

### Custom dimensions available in all events

The following dimensions are available in all events described below and aren't included in the individual event documentation:

|Dimension|Description or value|
|---------|-----|
|component|[!INCLUDE[component](../includes/include-telemetry-dimension-component-control-plane.md)]|
|deprecatedKeys|[!INCLUDE[deprecatedKeys](../includes/include-telemetry-dimension-deprecated-keys.md)]|
|telemetrySchemaVersion|[!INCLUDE[telemetrySchemaVersion](../includes/include-telemetry-dimension-telemetry-schema-version.md)]|

## Environment update available for scheduling

Occurs when a new update is available for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update available for scheduling: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0100**|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|

## Environment update scheduled

Occurs when the environment is scheduled to be updated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update scheduled: {environmentName} to version {destinationVersion}, update on or after date: {registeredForUpdateOnOrAfterDateUtc}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. <br /><br /> `{registeredForUpdateOnOrAfterDateUtc}` indicates the date and time that is registered as the beginning of the update window in the admin center.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|canPartnerReschedule|A boolean value (true or false) that specifies whether a partner can reschedule the update in the Business Central admin center. Set to **true** if the partner can reschedule the update.|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0101**|
|ignoreUpdateWindow|[!INCLUDE[ignoreUpdateWindow](../includes/include-telemetry-dimension-ignore-update-window.md)]|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|updateDateSelectedByPartner|Boolean value (True or False). Set to True if the update date was chosen by the partner in the admin center.|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|
|updateWindowEndTimeUtc|[!INCLUDE[updateWindowEndDateUtc](../includes/include-telemetry-dimension-update-window-end-date.md)]|
|updateWindowStartTimeUtc|[!INCLUDE[updateWindowStartDateUtc](../includes/include-telemetry-dimension-update-window-start-date.md)]|

## Environment update missed

Occurs when the environment was scheduled to be updated, but it wasn't possible to start the update in the update window defined in the admin center.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update missed: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0102**|
|ignoreUpdateWindow|[!INCLUDE[ignoreUpdateWindow](../includes/include-telemetry-dimension-ignore-update-window.md)]|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|
|updateWindowEndTimeUtc|[!INCLUDE[updateWindowEndDateUtc](../includes/include-telemetry-dimension-update-window-end-date.md)]|
|updateWindowStartTimeUtc|[!INCLUDE[updateWindowStartDateUtc](../includes/include-telemetry-dimension-update-window-start-date.md)]|

## Environment update postponed

Occurs when updates for version that the environment is on has been set on hold.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update postponed: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0103**|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|


## Environment update resumed

Occurs when an update for a version that the environment is running on has been started again after being stopped.

### General dimensions
|Dimension|Description or value|
|---------|-----|
|message|**Environment update resumed: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. |

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0104**|
|ignoreUpdateWindow|[!INCLUDE[ignoreUpdateWindow](../includes/include-telemetry-dimension-ignore-update-window.md)]|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|
|updateWindowEndTimeUtc|[!INCLUDE[updateWindowEndDateUtc](../includes/include-telemetry-dimension-update-window-end-date.md)]|
|updateWindowStartTimeUtc|[!INCLUDE[updateWindowStartDateUtc](../includes/include-telemetry-dimension-update-window-start-date.md)]|


## Environment update started

Occurs when the update was started for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update started: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0105**|
|ignoreUpdateWindow|[!INCLUDE[ignoreUpdateWindow](../includes/include-telemetry-dimension-ignore-update-window.md)]|
|initiatedFrom|[!INCLUDE[initiatedFrom](../includes/include-telemetry-dimension-initiated-from.md)]|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|remainingTimeInUpdateWindow| The time from the start of the operation until the end of the registered update window.  |
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|
|updateWindowEndTimeUtc|[!INCLUDE[updateWindowEndDateUtc](../includes/include-telemetry-dimension-update-window-end-date.md)]|
|updateWindowStartTimeUtc|[!INCLUDE[updateWindowStartDateUtc](../includes/include-telemetry-dimension-update-window-start-date.md)]|

## Environment updated successfully

Occurs when the environment was successfully updated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment updated successfully: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0106**|
|ignoreUpdateWindow|[!INCLUDE[ignoreUpdateWindow](../includes/include-telemetry-dimension-ignore-update-window.md)]|
|initiatedFrom|[!INCLUDE[initiatedFrom](../includes/include-telemetry-dimension-initiated-from.md)]|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|
|updateWindowEndTimeUtc|[!INCLUDE[updateWindowEndDateUtc](../includes/include-telemetry-dimension-update-window-end-date.md)]|
|updateWindowStartTimeUtc|[!INCLUDE[updateWindowStartDateUtc](../includes/include-telemetry-dimension-update-window-start-date.md)]|


## Environment failed to update

Occurs when the update for the environment failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment failed to update: {environmentName} to version {destinationVersion}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{destinationVersion}` indicates the new version that is available. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationVersion|[!INCLUDE[destinationVersion](../includes/include-telemetry-dimension-update-destination-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0107**|
|failureCode| Specifies code that describes the type of error that blocks the update, such as **PteCompilation**. |
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|ignoreUpdateWindow|[!INCLUDE[ignoreUpdateWindow](../includes/include-telemetry-dimension-ignore-update-window.md)]|
|initiatedFrom|[!INCLUDE[initiatedFrom](../includes/include-telemetry-dimension-initiated-from.md)]|
|registeredForUpdateOnOrAfterDateUtc|[!INCLUDE[registeredForUpdateOnOrAfterDateUtc](../includes/include-telemetry-dimension-registered-for-update-on-or-after-date.md)]|
|recovered|A boolean value (true or false) that specifies whether the environment was recovered to its state before the upgrade attempt. Set to **true** if the environment was recovered.|
|sourceVersion|[!INCLUDE[sourceVersion](../includes/include-telemetry-dimension-update-source-version.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|updatePeriodEndDateUtc|[!INCLUDE[updatePeriodEndDateUtc](../includes/include-telemetry-dimension-update-period-end-date.md)]|
|updatePeriodStartDateUtc|[!INCLUDE[updatePeriodStartDateUtc](../includes/include-telemetry-dimension-update-period-start-date.md)]|
|updateWindowEndTimeUtc|[!INCLUDE[updateWindowEndDateUtc](../includes/include-telemetry-dimension-update-window-end-date.md)]|
|updateWindowStartTimeUtc|[!INCLUDE[updateWindowStartDateUtc](../includes/include-telemetry-dimension-update-window-start-date.md)]|

### Sample KQL code (failed environment updates)

This KQL code can help you get started analyzing environment update failures:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0107' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// information about the update
, sourceVersion = customDimensions.sourceVersion
, destinationVersion = customDimensions.destinationVersion
, updatePeriodStartDateUtc = customDimensions.updatePeriodStartDateUtc
, updatePeriodEndDateUtc = customDimensions.updatePeriodEndDateUtc
, registeredForUpdateOnOrAfterDateUtc = customDimensions.registeredForUpdateOnOrAfterDateUtc
, updateWindowStartTimeUtc = customDimensions.updateWindowStartTimeUtc
, updateWindowEndTimeUtc = customDimensions.updateWindowEndTimeUtc
, ignoreUpdateWindow = customDimensions.ignoreUpdateWindow
, initiatedFrom = customDimensions.initiatedFrom
, totalTime = customDimensions.totalTime
// what happened
, failureReason = customDimensions.failureReason
, failureCode = customDimensions.failureCode
, recovered = customDimensions.recovered
```

## Environment restart operation initiated

Occurs when a restart operation has been initiated from the admin center.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment restart operation initiated: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0110**|

## Environment restarted successfully

Occurs when a restart operation succeeded for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment restarted successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0111**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment restart operation failed

Occurs when a restart operation failed for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment restart operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0112**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed environment restart)

This KQL code can help you get started analyzing environment restart failures:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0112' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
```


## Environment start operation initiated

Occurs when a start operation has been initiated for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment start operation initiated: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0113**|

## Environment started successfully

Occurs when a restart operation succeeded for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment started successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0114**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment start operation failed

Occurs when a start operation failed for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment start operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0115**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed environment start operation)

This KQL code can help you get started analyzing environment start failures:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0115' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
```


## Environment stop operation initiated

Occurs when a stop operation has been initiated for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment stop operation initiated: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0116**|

## Environment stopped successfully

Occurs when a stop operation succeeded for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment stopped successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0117**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment stop operation failed

Occurs when a stop operation failed for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment stop operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0118**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed environment stop operation)

This KQL code can help you get started analyzing environment stop failures:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0118' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
```

## Environment copy operation started on source

Occurs when a copy operation for the environment started on the source environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment copy operation started on source: {environmentName} to {destinationEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{destinationEnvironmentName}` indicates the name of the destination environment|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|destinationEnvironmentType|[!INCLUDE[destinationEnvironmentType](../includes/include-telemetry-dimension-destination-environment-type.md)]|
|destinationEnvironmentVersion|[!INCLUDE[destinationEnvironmentVersion](../includes/include-telemetry-dimension-destination-environment-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0119**|

## Environment copied successfully

Occurs when a copy operation for the environment succeeded.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment copied successfully: {environmentName} to {destinationEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{destinationEnvironmentName}` indicates the name of the destination environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|destinationEnvironmentType|[!INCLUDE[destinationEnvironmentType](../includes/include-telemetry-dimension-destination-environment-type.md)]|
|destinationEnvironmentVersion|[!INCLUDE[destinationEnvironmentVersion](../includes/include-telemetry-dimension-destination-environment-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0120**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment copy operation failed on source

Occurs when a copy operation for the environment failed on the source environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment copy operation failed on source: {environmentName} to {destinationEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{destinationEnvironmentName}` indicates the name of the destination environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|destinationEnvironmentType|[!INCLUDE[destinationEnvironmentType](../includes/include-telemetry-dimension-destination-environment-type.md)]|
|destinationEnvironmentVersion|[!INCLUDE[destinationEnvironmentVersion](../includes/include-telemetry-dimension-destination-environment-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0121**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed environment copy on source)

This KQL code can help you get started analyzing environment copy failures (that happened on the source):

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0121' 
| project timestamp
, message
// source environment
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
// destination environment
, destinationEnvironmentName = customDimensions.destinationEnvironmentName
, destinationEnvironmentType = customDimensions.destinationEnvironmentType
, destinationEnvironmentVersion = customDimensions.destinationEnvironmentVersion
// what happened
, totalTime = customDimensions.totalTime
, failureReason = customDimensions.failureReason
```


## Environment copy operation started on destination

Occurs when a copy operation for the environment started on the destination environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment copy operation started on destination: {environmentName} from {sourceEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment that was to be copied.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0122**|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceEnvironmentType|[!INCLUDE[sourceEnvironmentType](../includes/include-telemetry-dimension-source-environment-type.md)]|
|sourceEnvironmentVersion|[!INCLUDE[sourceEnvironmentVersion](../includes/include-telemetry-dimension-source-environment-version.md)]|

## Environment copied successfully to destination

Occurs when a copy operation for the environment succeeded on the destination environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment copied successfully to destination: {environmentName} from {sourceEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment that was to be copied.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0123**|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceEnvironmentType|[!INCLUDE[sourceEnvironmentType](../includes/include-telemetry-dimension-source-environment-type.md)]|
|sourceEnvironmentVersion|[!INCLUDE[sourceEnvironmentVersion](../includes/include-telemetry-dimension-source-environment-version.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment copy operation failed on destination

Occurs when a copy operation for the environment failed on the destination environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment copy operation failed on destination: {environmentName} from {sourceEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment that was to be copied.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0124**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceEnvironmentType|[!INCLUDE[sourceEnvironmentType](../includes/include-telemetry-dimension-source-environment-type.md)]|
|sourceEnvironmentVersion|[!INCLUDE[sourceEnvironmentVersion](../includes/include-telemetry-dimension-source-environment-version.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


### Sample KQL code (failed environment copy on destination)

This KQL code can help you get started analyzing environment copy failures (that happened on the destination):

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0124'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
// source environment
, sourceEnvironmentName = customDimensions.sourceEnvironmentName
, sourceEnvironmentType = customDimensions.sourceEnvironmentType
, sourceEnvironmentVersion = customDimensions.sourceEnvironmentVersion
// destination environment
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, totalTime = customDimensions.totalTime
, failureReason = customDimensions.failureReason
```


## Environment point-in-time restore operation started on source

Occurs when a point-in-time restore operation for the environment started on the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment point-in-time restore operation started on source: {environmentName} to {destinationEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{destinationEnvironmentName}` indicates the name of the destination environment for the operation.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|destinationEnvironmentType|[!INCLUDE[destinationEnvironmentType](../includes/include-telemetry-dimension-destination-environment-type.md)]|
|destinationEnvironmentVersion|[!INCLUDE[destinationEnvironmentVersion](../includes/include-telemetry-dimension-destination-environment-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0125**|
|pointInTimeUtc|[!INCLUDE[pointInTimeUtc](../includes/include-telemetry-dimension-point-in-time.md)]|

## Environment point-in-time restored successfully

Occurs when a point-in-time restore operation for the environment completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment point-in-time restored successfully: {environmentName} to {destinationEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{destinationEnvironmentName}` indicates the name of the destination environment for the operation.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|destinationEnvironmentType|[!INCLUDE[destinationEnvironmentType](../includes/include-telemetry-dimension-destination-environment-type.md)]|
|destinationEnvironmentVersion|[!INCLUDE[destinationEnvironmentVersion](../includes/include-telemetry-dimension-destination-environment-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0126**|
|pointInTimeUtc|[!INCLUDE[pointInTimeUtc](../includes/include-telemetry-dimension-point-in-time.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment point-in-time restore operation failed on source

Occurs when a point-in-time restore operation for the environment failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment point-in-time restore operation failed on source: {environmentName} to {destinationEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{destinationEnvironmentName}` indicates the name of the destination environment for the operation.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|destinationEnvironmentType|[!INCLUDE[destinationEnvironmentType](../includes/include-telemetry-dimension-destination-environment-type.md)]|
|destinationEnvironmentVersion|[!INCLUDE[destinationEnvironmentVersion](../includes/include-telemetry-dimension-destination-environment-version.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0127**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|pointInTimeUtc|[!INCLUDE[pointInTimeUtc](../includes/include-telemetry-dimension-point-in-time.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed environment point-in-time operation on source)

This KQL code can help you get started analyzing point-in-time failures (that happened on the source):

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0127'
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, destinationEnvironmentName = customDimensions.destinationEnvironmentName
, destinationEnvironmentType = customDimensions.destinationEnvironmentType
, destinationEnvironmentVersion = customDimensions.destinationEnvironmentVersion
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// operation details
, pointInTimeUtc = customDimensions.pointInTimeUtc
// what happened
, failureReason = customDimensions.failureReason
, totalTime = customDimensions.totalTime
```


## Environment point-in-time restore operation started on destination

Occurs when a point-in-time restore operation for the environment started on the destination environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment point-in-time restore operation started on destination: {environmentName} from {sourceEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{sourceEnvironmentName}` indicates the name of the source environment for the operation.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**LC0128**|
|pointInTimeUtc|[!INCLUDE[pointInTimeUtc](../includes/include-telemetry-dimension-point-in-time.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceEnvironmentType|[!INCLUDE[sourceEnvironmentType](../includes/include-telemetry-dimension-source-environment-type.md)]|
|sourceEnvironmentVersion|[!INCLUDE[sourceEnvironmentVersion](../includes/include-telemetry-dimension-source-environment-version.md)]|


## Environment point-in-time restored successfully to destination

Occurs when a point-in-time restore operation for the environment completed successfully on the destination environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment point-in-time restored successfully to destination: {environmentName} from {sourceEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{sourceEnvironmentName}` indicates the name of the source environment for the operation.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0129**|
|pointInTimeUtc|[!INCLUDE[pointInTimeUtc](../includes/include-telemetry-dimension-point-in-time.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceEnvironmentType|[!INCLUDE[sourceEnvironmentType](../includes/include-telemetry-dimension-source-environment-type.md)]|
|sourceEnvironmentVersion|[!INCLUDE[sourceEnvironmentVersion](../includes/include-telemetry-dimension-source-environment-version.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment point-in-time restore operation failed on destination

Occurs when a point-in-time restore operation for the environment failed in the destination environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment point-in-time restore operation failed on destination: {environmentName} to {sourceEnvironmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{sourceEnvironmentName}` indicates the name of the source environment for the operation.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0130**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|pointInTimeUtc|[!INCLUDE[pointInTimeUtc](../includes/include-telemetry-dimension-point-in-time.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceEnvironmentType|[!INCLUDE[sourceEnvironmentType](../includes/include-telemetry-dimension-source-environment-type.md)]|
|sourceEnvironmentVersion|[!INCLUDE[sourceEnvironmentVersion](../includes/include-telemetry-dimension-source-environment-version.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed environment point-in-time operation on destination)

This KQL code can help you get started analyzing point-in-time failures (that happened on the destination):

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0130'
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, sourceEnvironmentName = customDimensions.sourceEnvironmentName
, sourceEnvironmentType = customDimensions.sourceEnvironmentType
, sourceEnvironmentVersion = customDimensions.sourceEnvironmentVersion
// operation details
, pointInTimeUtc = customDimensions.pointInTimeUtc
// what happened
, failureReason = customDimensions.failureReason
, totalTime = customDimensions.totalTime
```


## Environment move to different AAD tenant operation scheduled

Occurs when the environment is scheduled to be moved to a different Microsoft Entra tenant.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment move to {destinationAadTenantId} AAD tenant operation scheduled to run at {registeredForMoveDateUtc}: {sourceEnvironmentName}** <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment to be moved.<br /><br /> `{destinationAadTenantId}` indicates the AAD tenant that the environment should be moved to. <br /><br /> `{registeredForMoveDateUtc}` indicates the date and time that have been registered for the move.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|destinationAadTenantId|[!INCLUDE[destinationAadTenantId](../includes/include-telemetry-dimension-destination-aadtenantid.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0131**|
|registeredForMoveDateUtc|[!INCLUDE[registeredForMoveDateUtc](../includes/include-telemetry-dimension-registered-for-move-date.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceAadTenantId|[!INCLUDE[sourceAadTenantId](../includes/include-telemetry-dimension-source-aadtenantid.md)]|

## Environment move to different AAD tenant operation scheduling failed

Occurs when the operation to schedule a move of an environment to a different Microsoft Entra) tenant failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment move to {destinationAadTenantId} AAD tenant operation scheduling failed: {sourceEnvironmentName}** <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment to be moved.<br /><br /> `{destinationAadTenantId}` indicates the AAD tenant that the environment should be moved to.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|destinationAadTenantId|[!INCLUDE[destinationAadTenantId](../includes/include-telemetry-dimension-destination-aadtenantid.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0132**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|registeredForMoveDateUtc|[!INCLUDE[registeredForMoveDateUtc](../includes/include-telemetry-dimension-registered-for-move-date.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceAadTenantId|[!INCLUDE[sourceAadTenantId](../includes/include-telemetry-dimension-source-aadtenantid.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (failed move of environment to different AAD tenant)

This KQL code can help you get started analyzing failures in moving an environment to a different AAD tenant:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0132'
| project timestamp
, message
// in which tenants did it happen
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, sourceAadTenantId = customDimensions.sourceAadTenantId
, destinationAadTenantId = customDimensions.destinationAadTenantId
, sourceEnvironmentName = customDimensions.sourceEnvironmentName
, destinationEnvironmentName = customDimensions.destinationEnvironmentName
, registeredForMoveDateUtc = customDimensions.registeredForMoveDateUtc
// what happened
, totalTime = customDimensions.totalTime
, failureReason = customDimensions.failureReason
```

## Environment move to different AAD tenant operation started

Occurs when the operation to move the environment to a different AAD tenant started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment move to {destinationAadTenantId} AAD tenant operation operation started: {sourceEnvironmentName}** <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment to be moved.<br /><br /> `{destinationAadTenantId}` indicates the AAD tenant that the environment should be moved to.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|destinationAadTenantId|[!INCLUDE[destinationAadTenantId](../includes/include-telemetry-dimension-destination-aadtenantid.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0133**|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceAadTenantId|[!INCLUDE[sourceAadTenantId](../includes/include-telemetry-dimension-source-aadtenantid.md)]|

## Environment moved successfully to different AAD tenant

Occurs when the operation to move the environment to a different AAD tenant completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment moved to {destinationAadTenantId} AAD tenant successfully: {sourceEnvironmentName}** <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment that was moved.<br /><br /> `{destinationAadTenantId}` indicates the AAD tenant that the environment was moved to.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|destinationAadTenantId|[!INCLUDE[destinationAadTenantId](../includes/include-telemetry-dimension-destination-aadtenantid.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0134**|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceAadTenantId|[!INCLUDE[sourceAadTenantId](../includes/include-telemetry-dimension-source-aadtenantid.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment move to different AAD tenant failed

Occurs when the operation to move the environment to a different AAD tenant failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment move to {destinationAadTenantId} AAD tenant operation failed: {sourceEnvironmentName}** <br /><br /> `{sourceEnvironmentName}` indicates the name of the environment that was to be moved.<br /><br /> `{destinationAadTenantId}` indicates the AAD tenant that the environment was to be moved to.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|destinationAadTenantId|[!INCLUDE[destinationAadTenantId](../includes/include-telemetry-dimension-destination-aadtenantid.md)]|
|destinationEnvironmentName|[!INCLUDE[destinationEnvironmentName](../includes/include-telemetry-dimension-destination-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0135**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|sourceEnvironmentName|[!INCLUDE[sourceEnvironmentName](../includes/include-telemetry-dimension-source-environment-name.md)]|
|sourceAadTenantId|[!INCLUDE[sourceAadTenantId](../includes/include-telemetry-dimension-source-aadtenantid.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


### Sample KQL code (failed move of environment to different AAD tenant)

This KQL code can help you get started analyzing failures in moving an environment to a different AAD tenant:

```kql
// Environment move to different AAD tenant failed
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0135'
| project timestamp
, message
// in which tenants did it happen
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, sourceAadTenantId = customDimensions.sourceAadTenantId
, destinationAadTenantId = customDimensions.destinationAadTenantId
, sourceEnvironmentName = customDimensions.sourceEnvironmentName
, destinationEnvironmentName = customDimensions.destinationEnvironmentName
// what happened
, totalTime = customDimensions.totalTime
, failureReason = customDimensions.failureReason
```


## Environment session cancellation started

Occurs when a session is requested to be cancelled from the admin center.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment session {sessionId} cancellation started: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{sessionId}` indicates the id of the session that is being cancelled.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0136**|
|sessionId|[!INCLUDE[sessionId](../includes/include-telemetry-dimension-session-id.md)]|

## Environment session cancelled successfully

Occurs when a session was successfully cancelled from the admin center.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment session {sessionId} cancelled successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{sessionId}` indicates the id of the session that is being cancelled.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0137**|
|sessionId|[!INCLUDE[sessionId](../includes/include-telemetry-dimension-session-id.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment session cancellation failed

Occurs when a session cancellation request from the admin center failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment session {sessionId} cancellation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.<br /><br /> `{sessionId}` indicates the id of the session that is being cancelled.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0138**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|sessionId|[!INCLUDE[sessionId](../includes/include-telemetry-dimension-session-id.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


### Sample KQL code (failed cancellation of session)

This KQL code can help you get started analyzing failures in cancelling sessions:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0138'
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, sessionId = customDimensions.sessionId
```


## Environment database export operation started

Occurs when a database export is requested from the admin center.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment database export operation started: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|blobUrl|[!INCLUDE[blobUrl](../includes/include-telemetry-dimension-blob-url.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0139**|

## Environment database exported successfully

Occurs when the environment database was successfully exported from the admin center.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment database exported successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|blobUrl|[!INCLUDE[blobUrl](../includes/include-telemetry-dimension-blob-url.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0140**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment database export operation failed

Occurs when a database export request from the admin center failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment database export operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|blobUrl|[!INCLUDE[blobUrl](../includes/include-telemetry-dimension-blob-url.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0141**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


### Sample KQL code (failed database export operation)

This KQL code can help you get started analyzing failures in export database operations:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0141' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, blobUrl = customDimensions.blobUrl
```


## Environment configuration key updated

Occurs when a configuration key for the environment was successfully updated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment configuration key {environmentConfigurationKey} updated for environment {environmentName} to value: {newValue}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{environmentConfigurationKey}` indicates the name of the configuration key to be updated. <br /><br /> `{newValue}` indicates the new value of the key.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentConfigurationKey|[!INCLUDE[environmentConfigurationKey](../includes/include-telemetry-dimension-environment-configuration-key.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0142**|
|newValue|[!INCLUDE[newValue](../includes/include-telemetry-dimension-new-value.md)]|
|oldValue|[!INCLUDE[oldValue](../includes/include-telemetry-dimension-old-value.md)]|

## Environment configuration key failed to update

Occurs when a configuration key for the environment failed to be updated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment configuration key {environmentConfigurationKey} failed to update for environment {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentConfigurationKey|[!INCLUDE[environmentConfigurationKey](../includes/include-telemetry-dimension-environment-configuration-key.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0143**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|newValue|[ The value that the operation was supposed to update to |
|oldValue|[!INCLUDE[oldValue](../includes/include-telemetry-dimension-old-value.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (environment configuration key failed to update)

This KQL code can help you get started analyzing failures when setting a environment configuration key:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0143' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, oldValue = customDimensions.oldValue
, newValue = customDimensions.newValue
```


## Environment configuration key deleted

Occurs when a configuration key for the environment was successfully deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment configuration key {environmentConfigurationKey} deleted for environment {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment. <br /><br /> `{environmentConfigurationKey}` indicates the name of the configuration key to be updated.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentConfigurationKey|[!INCLUDE[environmentConfigurationKey](../includes/include-telemetry-dimension-environment-configuration-key.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0144**|
|oldValue|[!INCLUDE[oldValue](../includes/include-telemetry-dimension-old-value.md)]|

## Environment configuration key failed to be deleted

Occurs when a configuration key for the environment failed to be deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment configuration key {environmentConfigurationKey} failed to delete for environment {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentConfigurationKey|[!INCLUDE[environmentConfigurationKey](../includes/include-telemetry-dimension-environment-configuration-key.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0145**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|oldValue|[!INCLUDE[oldValue](../includes/include-telemetry-dimension-old-value.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (environment configuration key failed to be deleted)

This KQL code can help you get started analyzing failures when deletin a environment configuration key:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0145' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, oldValue = customDimensions.oldValue
```


## Environment update window modified

Occurs when the update window for the environment was successfully updated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update window was modified for environment: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0146**|
|newUpdateWindowStartTimeUtc| The start time (in UTC) for the new update window. |
|newUpdateWindowEndTimeUtc| The end time (in UTC) for the new update window.|
|oldUpdateWindowStartTimeUtc| The start time (in UTC) for the old update window. |
|oldUpdateWindowEndTimeUtc| The end time (in UTC) for the old update window.|

## Environment update window modification failed

Occurs when a update window failed to be updated.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment update window modification failed for environment: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0147**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|newUpdateWindowStartTimeUtc| The start time (in UTC) for the new update window. |
|newUpdateWindowEndTimeUtc| The end time (in UTC) for the new update window.|
|oldUpdateWindowStartTimeUtc| The start time (in UTC) for the old update window. |
|oldUpdateWindowEndTimeUtc| The end time (in UTC) for the old update window.|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (environment update window modification failed)

This KQL code can help you get started analyzing failures for updating the environment window modification:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0145' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, newUpdateWindowStartTimeUtc = customDimension.newUpdateWindowStartTimeUtc
, newUpdateWindowEndTimeUtc = customDimension.newUpdateWindowEndTimeUtc
, oldUpdateWindowStartTimeUtc = customDimension.oldUpdateWindowStartTimeUtc
, oldUpdateWindowEndTimeUtc = customDimension.oldUpdateWindowEndTimeUtc
```


## Environment (soft) delete operation started

Occurs when a (soft) delete operation was started for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment soft delete operation started: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0180**|


## Environment (soft) deleted

Occurs when the environment was successfully (soft) deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment soft deleted successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0181**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment (soft) delete operation failed

Occurs when a (soft) delete operation for the environment failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment soft delete operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0182**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


### Sample KQL code (environment soft delete failed)

This KQL code can help you get started analyzing failures for (soft) deleting an environment:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0182' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, deletionReason = customDimensions.deletionReason
```


## Environment (hard) delete operation scheduled

Occurs when a (hard) delete operation was scheduled for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment delete operation scheduled: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0148**|


## Environment (hard) delete operation started

Occurs when a (hard) delete operation was started for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment delete operation started: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0149**|


## Environment (hard) deleted

Occurs when the environment was successfully (hard) deleted.


### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment deleted successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0150**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment (hard) delete operation failed

Occurs when a (hard) delete operation for the environment failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment delete operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0151**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (environment hard delete failed)

This KQL code can help you get started analyzing failures for (hard) deleting an environment:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0151' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, deletionReason = customDimensions.deletionReason
```


## Environment recovery (un-delete) operation started

Occurs when a recovery (un-delete) operation was started for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment recovery operation started: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0183**|


## Environment recovered

Occurs when the environment was successfully recovered (un-deleted).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment recovered successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0184**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment recovery (un-delete) operation failed

Occurs when a recovery (un-delete) operation for the environment failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment recovery operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deletionReason|[!INCLUDE[deletionReason](../includes/include-telemetry-dimension-delete-reason.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0185**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


### Sample KQL code (environment un-delete failed)

This KQL code can help you get started analyzing failures for un-deleting an environment:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0185' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
// what happened
, failureReason = customDimensions.failureReason
, deletionReason = customDimensions.deletionReason
```

## Environment rename operation started

Occurs when a rename operation was started for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment rename operation started: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0152**|
|newEnvironmentName|[!INCLUDE[newEnvironmentName](../includes/include-telemetry-dimension-new-environment-name.md)]|


## Environment renamed

Occurs when the environment was successfully renamed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment renamed successfully: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0153**|
|newEnvironmentName|[!INCLUDE[newEnvironmentName](../includes/include-telemetry-dimension-new-environment-name.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment rename operation failed
Occurs when a rename operation for the environment failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment rename operation failed: {environmentName}** <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0154**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|newEnvironmentName|[!INCLUDE[newEnvironmentName](../includes/include-telemetry-dimension-new-environment-name.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

### Sample KQL code (environment rename operation failed)

This KQL code can help you get started analyzing failures for renaming an environment:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0154' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, newEnvironmentName = customDimensions.newEnvironmentName
// what happened
, failureReason = customDimensions.failureReason
```


## Environment app hotfix scheduled by App Management API
Occurs when an app hotfix for the environment has been scheduled by the App Management API service.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app '{extensionName}' hotfix to version {extensionDestinationVersion} scheduled for environment: {environmentName}** <br /><br />`{extensionName}` indicates the name of the extension/app to be hotfixed.<br /><br /> `{extensionDestinationVersion}` indicates the new version for the app that is available. |

### Custom dimensions
|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0155**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|


## Environment app hotfix scheduling by App Management API failed to be scheduled
Occurs when an app hotfix for the environment could not be scheduled by the App Management API service.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app '{extensionName}' hotfix to version {extensionDestinationVersion} scheduling failed for environment: {environmentName}** <br /><br /> `{extensionName}` indicates the name of the extension/app to be hotfixed.<br /><br /> `{extensionDestinationVersion}` indicates the version of the app that the hotfix should update it to. <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0156**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]


### Sample KQL code (environment app hotfix scheduling by App Management API failed to be scheduled)

This KQL code can help you get started analyzing failures for scheduling an app hotfix by using the App Management API:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0156' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, environmentVersion = customDimensions.environmentVersion
// which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionScope = customDimensions.extensionScope
, extensionDestinationVersion = customDimensions.extensionDestinationVersion
, extensionSourceVersion = customDimensions.extensionSourceVersion
// when should the operation run
, runAfterDateUtc = customDimensions.runAfterDateUtc
, useEnvironmentUpdateWindow = customDimensions.useEnvironmentUpdateWindow
// what happened
, failureReason = customDimensions.failureReason
```


## Environment app hotfix cancelled by App Management API
Occurs when an app hotfix for the environment was cancelled by the App Management API service.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app '{extensionName}' hotfix to version {extensionDestinationVersion} was cancelled for environment: {environmentName}**<br /><br /> `{extensionName}` indicates the name of the extension/app to be hotfixed.<br /><br /> `{extensionDestinationVersion}` indicates the new version for the app that is available. <br /><br /> `{environmentName}` indicates the name of the environment.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0157**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|


## Environment app hotfix started by App Management API
Occurs when an app hotfix for the environment was started by the App Management API service.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app '{extensionName}' hotfix to version {extensionDestinationVersion} started for environment: {environmentName}** <br /><br /> `{extensionName}` indicates the name of the extension/app to be hotfixed.<br /><br /> `{extensionDestinationVersion}` indicates the new version for the app that is available.<br /><br /> `{environmentName}` indicates the name of the environment. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0158**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|


## Environment app hotfix applied successfully by App Management API
Occurs when an app hotfix for the environment applied successfully by the App Management API service.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app '{extensionName}' hotfix to version {extensionDestinationVersion} applied successfully for environment: {environmentName}**<br /><br /> `{extensionName}` indicates the name of the extension/app to be hotfixed. <br /><br /> `{extensionDestinationVersion}` indicates the new version for the app that is available.<br /><br /> `{environmentName}` indicates the name of the environment. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0159**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|


## Environment app hotfix operation by App Management API failed to be installed

Occurs when an app hotfix for the environment was applied by the App Management API service and failed to be installed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app '{extensionName}' hotfix to version {extensionDestinationVersion} failed for environment: {environmentName}**<br /><br /> `{extensionName}` indicates the name of the extension/app to be hotfixed. <br /><br /> `{extensionDestinationVersion}` indicates the new version for the app that is available. <br /><br /> `{environmentName}` indicates the name of the environment. |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0160**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|


### Sample KQL code (environment app hotfix scheduling by App Management API failed to be installed)

This KQL code can help you get started analyzing failures for installing an app hotfix by using the App Management API:

```kql
traces
| where timestamp > ago(30d) // adjust as needed
| where customDimensions.eventId == 'LC0160' 
| project timestamp
, message
// in which environment did it happen
, aadTenantId = customDimensions.aadTenantId
, applicationFamily = customDimensions.applicationFamily
, countryCode = customDimensions.countryCode
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, environmentVersion = customDimensions.environmentVersion
// which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionScope = customDimensions.extensionScope
, extensionDestinationVersion = customDimensions.extensionDestinationVersion
, extensionSourceVersion = customDimensions.extensionSourceVersion
// when should the operation run
, runAfterDateUtc = customDimensions.runAfterDateUtc
, useEnvironmentUpdateWindow = customDimensions.useEnvironmentUpdateWindow
// what happened
, failureReason = customDimensions.failureReason
```


## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
