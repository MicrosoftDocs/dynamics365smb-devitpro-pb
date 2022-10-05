---
title:  Environment Lifecycle Trace Telemetry | Microsoft Docs
description: Learn about the environment lifecycle telemetry in Business Central  
author: KennieNP
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/08/2022
ms.author: kepontop
---
# Analyzing Environment Lifecycle Trace Telemetry

[!INCLUDE[component](../developer/includes/online_only.md)]

Environment lifecycle telemetry gathers data about the success or failure of the following environment-related operations:

- Update an environment
- Start/stop/restart an environment
- Copy an environment
- Point-in-time restore an environment
- Move an environment to a difference Azure Active Directory (AAD) tenant
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

The following dimensions are available in all events described below and is not included in the individual event documentation:

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

Occurs when the environment was scheduled to be updated, but it was not possible to start the update in the update window defined in the admin center.

<!-- 
EnvironmentUpdateMissed = "LC0102";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentUpdateInfo
PartnerDiagnosticsBlockEnvironmentUpdateWindow
Message => Environment update missed: {this.EnvironmentInfo.EnvironmentName} to version {this.UpdateInfo.DestinationVersion} -->

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

<!-- 
EnvironmentUpdatePostponed = "LC0103";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentUpdateInfo
[PartnerTelemetryIgnoredKey("updatePeriodStartDateUtc")]
[PartnerTelemetryIgnoredKey("updatePeriodEndDateUtc")]
[PartnerTelemetryIgnoredKey("registeredForUpdateOnOrAfterDateUtc")]
Message => Environment update postponed: {this.EnvironmentInfo.EnvironmentName} to version {this.UpdateInfo.DestinationVersion} 
-->

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

<!-- 
EnvironmentUpdateResumed = "LC0104";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentUpdateInfo
PartnerDiagnosticsBlockEnvironmentUpdateWindow
Message => Environment update resumed: {this.EnvironmentInfo.EnvironmentName} to version {this.UpdateInfo.DestinationVersion}
-->

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

<!-- 
EnvironmentUpdateStarted = "LC0105";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentUpdateInfo
PartnerDiagnosticsBlockEnvironmentUpdateWindow
PartnerDiagnosticsBlockEnvironmentOperation
[PartnerTelemetryKey("remainingTimeInUpdateWindow")]
Message => Environment update started: {this.EnvironmentInfo.EnvironmentName} to version {this.UpdateInfo.DestinationVersion}
-->

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

<!-- 
EnvironmentUpdateSucceeded = "LC0106";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentUpdateInfo
PartnerDiagnosticsBlockEnvironmentUpdateWindow
PartnerDiagnosticsBlockEnvironmentOperation
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Environment updated successfully: {this.EnvironmentInfo.EnvironmentName} to version {this.UpdateInfo.DestinationVersion}
-->

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

<!-- 
EnvironmentUpdateFailed = "LC0107";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentUpdateInfo
PartnerDiagnosticsBlockEnvironmentUpdateWindow
PartnerDiagnosticsBlockEnvironmentOperation
PartnerDiagnosticsBlockOperationFailureInfo
[PartnerTelemetryKey("failureCode")]
[PartnerTelemetryKey("recovered", AllowEmpty = true)]
Message => Environment failed to update: {this.EnvironmentInfo.EnvironmentName} to version {this.UpdateInfo.DestinationVersion} 
-->

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

## Environment restart operation initiated

Occurs when a restart operation has been initiated from the admin center.

<!-- 
EnvironmentRestartInitiated = "LC0110";
PartnerDiagnosticsBlockEnvironmentInfo 
Message => Invariant($"Environment restart operation initiated: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentRestartSucceeded = "LC0111";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment restarted successfully: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentRestartFailed = "LC0112";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment restart operation failed: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment start operation initiated

Occurs when a start operation has been initiated for the environment.

<!-- 
EnvironmentStartInitiated = "LC0113";
PartnerDiagnosticsBlockEnvironmentInfo
Message => Invariant($"Environment start operation initiated: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentStartSucceeded = "LC0114";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment started successfully: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentStartFailed = "LC0115";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment start operation failed: {this.EnvironmentInfo.EnvironmentName}");
-->

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


## Environment stop operation initiated

Occurs when a stop operation has been initiated for the environment.

<!-- 
EnvironmentStopInitiated = "LC0116";
PartnerDiagnosticsBlockEnvironmentInfo
Message => Invariant($"Environment stop operation initiated: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentStopSucceeded = "LC0117";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment stopped successfully: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentStopFailed = "LC0118";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment stop operation failed: {this.EnvironmentInfo.EnvironmentName}"); 
-->

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

## Environment copy operation started on source

Occurs when a copy operation for the environment started on the source environment.

<!-- 
EnvironmentCopyToNewEnvironmentStarted = "LC0119";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockDestinationEnvironmentInfo
Message => Invariant($"Environment copy operation started on source: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

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

<!-- 
EnvironmentCopyToNewEnvironmentSucceeded = "LC0120";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment copied successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

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

<!-- 
EnvironmentCopyToNewEnvironmentFailed = "LC0121";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment copy operation failed on source: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}"); 
-->

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


## Environment copy operation started on destination

Occurs when a copy operation for the environment started on the destination environment.

<!-- 
EnvironmentCopyFromExistingEnvironmentStarted = "LC0122";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockSourceEnvironmentInfo
Message => Invariant($"Environment copy operation started on destination: {this.EnvironmentInfo.EnvironmentName} from {this.SourceEnvironmentInfo.SourceEnvironmentName}");
-->

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

<!-- 
EnvironmentCopyFromExistingEnvironmentSucceeded = "LC0123";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockSourceEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment copied successfully to destination: {this.EnvironmentInfo.EnvironmentName} from {this.SourceEnvironmentInfo.SourceEnvironmentName}");
-->

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

<!-- 
EnvironmentCopyFromExistingEnvironmentFailed = "LC0124";
PartnerDiagnosticsBlockEnvironmentInfo
PartnerDiagnosticsBlockSourceEnvironmentInfo
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment copy operation failed on destination: {this.EnvironmentInfo.EnvironmentName} from {this.SourceEnvironmentInfo.SourceEnvironmentName}"); 
-->

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

## Environment point-in-time restore operation started on source

Occurs when a point-in-time restore operation for the environment started on the environment.

<!-- 
EnvironmentRestoreToNewEnvironmentStarted = "LC0125";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
Message => Invariant($"Environment PIT restore operation started on source: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

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

<!-- 
EnvironmentRestoreToNewEnvironmentSucceeded = "LC0126";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

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

<!-- 
EnvironmentRestoreToNewEnvironmentFailed = "LC0127";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment PIT restore operation failed on source: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

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

## Environment point-in-time restore operation started on destination

Occurs when a point-in-time restore operation for the environment started on the destination environment.

<!-- 
EnvironmentRestoreFromExistingEnvironmentStarted = "LC0128";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockSourceEnvironmentInfo
Message => Invariant($"Environment PIT restore operation started on destination: {this.EnvironmentInfo.EnvironmentName} from {this.SourceEnvironmentInfo.SourceEnvironmentName}");
-->

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

<!-- 
EnvironmentRestoreFromExistingEnvironmentSucceeded = "LC0129";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockSourceEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully to destination: {this.EnvironmentInfo.EnvironmentName} from {this.SourceEnvironmentInfo.SourceEnvironmentName}");
-->

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

<!--
EnvironmentRestoreFromExistingEnvironmentFailed = "LC0130";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockSourceEnvironmentInfo
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment PIT restore operation failed on destination: {this.EnvironmentInfo.EnvironmentName} from {this.SourceEnvironmentInfo.SourceEnvironmentName}"); 
-->

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

## Environment move to different AAD tenant operation scheduled

Occurs when the environment is scheduled to be moved to a different Azure Active Directory (AAD) tenant.

<!-- 
EnvironmentMoveToAnotherAadTenantScheduled = "LC0131";
[PartnerTelemetryKey("registeredForMoveDateUtc")]
Message => Invariant($"Environment move to {this.DestinationAadTenantId} AAD tenant operation scheduled to run at {this.RegisteredForMoveDateUtc}: {this.SourceEnvironmentName}"); 
-->

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

Occurs when the operation to schedule a move of an environment to a different Azure Active Directory (AAD) tenant failed.

<!-- 
EnvironmentMoveToAnotherAadTenantSchedulingFailed = "LC0132";
PartnerDiagnosticsBlockSchedulingFailureInfo
[PartnerTelemetryKey("registeredForMoveDateUtc")]
Message => Invariant($"Environment move to {this.DestinationAadTenantId} AAD tenant operation scheduling failed: {this.SourceEnvironmentName}");
-->

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

## Environment move to different AAD tenant operation started

Occurs when the operation to move the environment to a different AAD tenant started.

<!-- 
EnvironmentMoveToAnotherAadTenantStarted = "LC0133";
Message => Invariant($"Environment move to {this.DestinationAadTenantId} AAD tenant operation started: {this.SourceEnvironmentName}");
-->

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

<!-- 
EnvironmentMoveToAnotherAadTenantSucceeded = "LC0134";
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment moved to {this.DestinationAadTenantId} AAD tenant successfully: {this.DestinationEnvironmentName}");
-->

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

<!-- 
EnvironmentMoveToAnotherAadTenantFailed = "LC0135";
PartnerDiagnosticsBlockOperationFailureInfo 
Message => Invariant($"Environment move to {this.DestinationAadTenantId} AAD tenant operation failed: {this.SourceEnvironmentName}");
-->

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

## Environment session cancellation started

Occurs when a session is requested to be cancelled from the admin center.

<!-- 
EnvironmentSessionCancelStarted = "LC0136";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("sessionId")]
Message => Invariant($"Environment session {this.SessionId} cancellation started: {this.EnvironmentInfo.EnvironmentName}"); -->

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

<!-- 
EnvironmentSessionCancelSucceeded = "LC0137";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("sessionId")]
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment session {this.SessionId} cancelled successfully: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentSessionCancelFailed = "LC0138";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("sessionId")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment session {this.SessionId} cancellation failed: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment database export operation started

Occurs when a database export is requested from the admin center.

<!-- 
EnvironmentDatabaseExportStarted = "LC0139";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("blobUrl")]
Message => Invariant($"Environment database export operation started: {this.EnvironmentInfo.EnvironmentName}"); -->

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

<!-- 
EnvironmentDatabaseExportSucceeded = "LC0140";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("blobUrl")]
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment database exported successfully: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentDatabaseExportFailed = "LC0141";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("blobUrl")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment database export operation failed: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment configuration key updated

Occurs when a configuration key for the environment was successfully updated.

<!-- 
EnvironmentConfigurationChanged = "LC0142";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("environmentConfigurationKey")]
[PartnerTelemetryKey("oldValue")]
[PartnerTelemetryKey("newValue")]
Message => Invariant($"Environment configuration key {this.EnvironmentConfigurationKey} updated for environment {this.EnvironmentInfo.EnvironmentName} to value: {this.NewValue}");
-->

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

<!-- 
EnvironmentConfigurationChangeFailed = "LC0143";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("environmentConfigurationKey")]
[PartnerTelemetryKey("oldValue")]
[PartnerTelemetryKey("newValue")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment configuration key {this.EnvironmentConfigurationKey} failed to update for environment {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment configuration key deleted

Occurs when a configuration key for the environment was successfully deleted.

<!-- 
EnvironmentConfigurationDeleted = "LC0144";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("environmentConfigurationKey")]
[PartnerTelemetryKey("oldValue")]
Message => Invariant($"Environment configuration key {this.EnvironmentConfigurationKey} deleted for environment {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentConfigurationDeleteFailed = "LC0145";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("environmentConfigurationKey")]
[PartnerTelemetryKey("oldValue")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment configuration key {this.EnvironmentConfigurationKey} failed to delete for environment {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment update window modified

Occurs when the update window for the environment was successfully updated.

<!-- 
EnvironmentUpdateWindowChanged = "LC0146";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("oldUpdateWindowStartTimeUtc")]
[PartnerTelemetryKey("oldUpdateWindowEndTimeUtc")]
[PartnerTelemetryKey("newUpdateWindowStartTimeUtc")]
[PartnerTelemetryKey("newUpdateWindowEndTimeUtc")]
Message => Invariant($"Environment update window was modified for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentUpdateWindowChangeFailed = "LC0147";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("oldUpdateWindowStartTimeUtc")]
[PartnerTelemetryKey("oldUpdateWindowEndTimeUtc")]
[PartnerTelemetryKey("newUpdateWindowStartTimeUtc")]
[PartnerTelemetryKey("newUpdateWindowEndTimeUtc")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment update window modification failed for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment delete operation started

Occurs when a delete operation was started for the environment.

<!-- 
EnvironmentDeleteStarted = "LC0149";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("deletionReason")]
Message => Invariant($"Environment delete operation started: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment deleted

Occurs when the environment was successfully deleted.

<!-- 
EnvironmentDeleteSucceeded = "LC0150";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("deletionReason")]
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment deleted successfully: {this.EnvironmentInfo.EnvironmentName}");

-->

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

## Environment delete operation failed

Occurs when a delete operation for the environment failed.

<!-- 
EnvironmentDeleteFailed = "LC0151";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("deletionReason")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment delete operation failed: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment rename operation started

Occurs when a rename operation was started for the environment.

<!-- 
EnvironmentRenameStarted = "LC0152";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("newEnvironmentName")]
Message => Invariant($"Environment rename operation started: {this.EnvironmentInfo.EnvironmentName} to {this.NewEnvironmentName}");
-->

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

<!-- 
EnvironmentRenameSucceeded = "LC0153";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("newEnvironmentName")]
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment renamed successfully: {this.EnvironmentInfo.EnvironmentName} to {this.NewEnvironmentName}");
-->

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

<!-- 
EnvironmentRenameFailed = "LC0154";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("newEnvironmentName")]
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment rename operation failed: {this.EnvironmentInfo.EnvironmentName} to {this.NewEnvironmentName}");
-->

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

## Environment app hotfix scheduled by App Management API

Occurs when an app hotfix for the environment has been scheduled by the App Management API service.

<!-- 
EnvironmentAppHotfixScheduled = "LC0155";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentAppOperation
Message => Invariant($"Environment app '{this.AppOperation.GetAppDisplayName()}' hotfix to version {this.AppOperation.ExtensionDestinationVersion} scheduled for environment: {this.EnvironmentInfo.EnvironmentName}"); 
-->

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

## Environment app hotfix scheduling by App Management API failed

Occurs when an app hotfix for the environment could not be scheduled by the App Management API service.

<!-- 
EnvironmentAppHotfixSchedulingFailed = "LC0156";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentAppOperation
PartnerDiagnosticsBlockSchedulingFailureInfo
Message => Invariant($"Environment app '{this.AppOperation.GetAppDisplayName()}' hotfix to version {this.AppOperation.ExtensionDestinationVersion} scheduling failed for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment app hotfix cancelled by App Management API

Occurs when an app hotfix for the environment was cancelled by the App Management API service.

<!-- 
EnvironmentAppHotfixCanceled = "LC0157";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentAppOperation
Message => Invariant($"Environment app '{this.AppOperation.GetAppDisplayName()}' hotfix to version {this.AppOperation.ExtensionDestinationVersion} was canceled for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentAppHotfixStarted = "LC0158";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentAppOperation
Message => Invariant($"Environment app '{this.AppOperation.GetAppDisplayName()}' hotfix to version {this.AppOperation.ExtensionDestinationVersion} started for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

<!-- 
EnvironmentAppHotfixSucceeded = "LC0159";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentAppOperation
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment app '{this.AppOperation.GetAppDisplayName()}' hotfix to version {this.AppOperation.ExtensionDestinationVersion} applied successfully for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment app hotfix operation by App Management API failed

Occurs when an app hotfix for the environment was applied by the App Management API service and failed to be installed.

<!-- 
EnvironmentAppHotfixFailed = "LC0160";
PartnerDiagnosticsBlockEnvironmentInfo 
PartnerDiagnosticsBlockEnvironmentAppOperation
PartnerDiagnosticsBlockOperationFailureInfo
Message => Invariant($"Environment app '{this.AppOperation.GetAppDisplayName()}' hotfix to version {this.AppOperation.ExtensionDestinationVersion} failed for environment: {this.EnvironmentInfo.EnvironmentName}");
-->

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

## Environment data upgrade operation started

Occurs when a data upgrade operation on an environment is started.

<!-- 
EnvironmentRestoreToNewEnvironmentSucceeded = "LC0126";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment data upgrade operation started: {environmentName}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0175**|

## Environment data upgrade operation completed successfully

Occurs when a data upgrade operation on an environment has compeleted successfully.

<!-- 
EnvironmentRestoreToNewEnvironmentSucceeded = "LC0126";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment data upgrade operation completed successfully: {environmentName}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0176**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Environment data upgrade operation failed

Occurs when a data upgrade operation on an environment has failed.

<!-- 
EnvironmentRestoreToNewEnvironmentSucceeded = "LC0126";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment data upgrade operation failed: {environmentName}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0177**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Recovery from a failed data upgrade operation has completed successfully

Occurs when recovery operation that's run after a failed data upgrade operation has completed successfully.

<!-- 
EnvironmentRestoreToNewEnvironmentSucceeded = "LC0126";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Recovery from a failed data upgrade operation has completed successfully: {environmentName}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0178**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## Recovery from a failed data upgrade operation has failed

Occurs when recovery operation that's run after a failed data upgrade operation has also failed.

<!-- 
EnvironmentRestoreToNewEnvironmentSucceeded = "LC0126";
PartnerDiagnosticsBlockEnvironmentInfo
[PartnerTelemetryKey("pointInTimeUtc")]
PartnerDiagnosticsBlockDestinationEnvironmentInfo
PartnerDiagnosticsBlockOperationSuccessInfo
Message => Invariant($"Environment PIT restored successfully: {this.EnvironmentInfo.EnvironmentName} to {this.DestinationEnvironmentInfo.DestinationEnvironmentName}");
-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Recovery from a failed data upgrade operation has failed: {environmentName}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0179**|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
