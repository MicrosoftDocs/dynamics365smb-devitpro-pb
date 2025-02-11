---
title: Business Central Admin Center API - Reschedule Updates
description: Learn about the Business Central administration center API for rescheduling updates.
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 02/24/2023
---

# Business Central Admin Center API - Reschedule Updates

Allows for the management of scheduled updates such as rescheduling the update to a run on or after a specific date within a provided range.

## Get Scheduled Update

Get information about updates that have already been scheduled for a specific environment.

### Flexible Update Management

The endpoint documented below is planned as part of the Flexible Update Management features shipping as part of 2024 release wave 1. The version number in which this will be introduced will be determined later.

```
GET /admin/vX.XX/applications/{applicationFamily}/environments/{environmentName}/update
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response

Returns information about the scheduled update for that environment; the properties included in the response differ based on whether the scheduled update has been released.

```
// For scheduled update that has been released.

{
    "targetVersion": string, // Indicates the version to which the environment will be updated
    "scheduledUpdateDetails": {
        "canBeRescheduledByCustomer": boolean, // Indicates if a new update date can be selected
        "isRescheduledByCustomer": boolean,  // Indicates if the update has been scheduled by a tenant administrator or by Microsoft
        "earliestSelectableUpgradeDate": datetime, // Specifies the earliest date that can be chosen for the update.
        "latestSelectableUpgradeDate": datetime, // Specifies the latest date that can be chosen for the update.
        "upgradeDate": datetime, // The currently selected scheduled date of the update.
        "upgradeStatus": enum,  // Indicates the status of the update for this environment, i.e. "Scheduled" or "Running"
        "ignoreUpgradeWindow": boolean, // Indicates if the environment's update window will be ignored.
        "rolloutStatus": enum  // Indicates the rollout status of the update, i.e. "Available", "UnderMaintenance", or "Postponed"
    }
}

// For scheduled update that has not yet been released
{
    "targetVersion": string, // Indicates the version for which the next environment update will be scheduled
    "pendingReleaseUpdateDetails": {
        "releaseMonth": int, // Indicates the month in which the targetVersion is expected to be released
        "releaseYear": int // Indicates the year in which the targetVersion is expected to be released
    }
}
```


### Legacy

The endpoint documented below is backwards compatible and intended to be used for environments on which Flexible Update Management scheduling options are not yet available.

```
GET /admin/v2.24/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response

Returns information about the scheduled update for that environment.

```
{
  "environmentName": string, // The name of the targeted environment.
  "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
  "sourceVersion": string, // The current version of the environment's application.
  "targetVersion": string, // The version of the application that the environment will update to.
  "canTenantSelectDate": boolean, // Indicates if a new update date can be selected.
  "didTenantSelectDate": boolean, // Indicates if the tenant has selected the current date for the update.
  "earliestSelectableUpgradeDate": datetime, // Specifies the earliest date that can be chosen for the update.
  "latestSelectableUpgradeDate": datetime, // Specifies the latest date that can be chosen for the update.
  "upgradeDate": datetime, // The currently selected scheduled date of the update.
  "updateStatus": string, // The current status of the environment's update. (enum | "Scheduled" or "Running")
  "ignoreUpgradeWindow": boolean, // Indicates if the environment's update window will be ignored.
  "isActive": boolean, // Indicates if the update is activated and is scheduled to occur.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Get Available Updates

Get information on the versions for which an update can be scheduled. The endpoint documented below is planned as part of the Flexible Update Management features shipping as part of 2024 release wave 1. The version number in which this will be introduced will be determined later.

```
GET /admin/vX.XX/applications/{applicationType}/environments/{environmentName}/availableUpdates
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns details on the update versions for which an update can be scheduled.

```
{
   "value": [
      {
         "targetVersion": string, // The version of the application that the environment will update to.
         "earliestSelectableUpgradeDate": "datetime", // Specifies the earliest date that can be chosen for the update. Only included when status is "Scheduled" or "Released".
         "latestSelectableUpgradeDate": "datetime", // Specifies the latest date that can be chosen for the update. Only included when status is "Scheduled" or "Released".
         "status": enum // The current status of the environment's update, i.e. "Scheduled", "Released", or "PendingRelease".
      },
      {
         "targetVersion": string,
         "status": enum,
         "releaseMonth": int, // The month in which the targetVersion is expected to be released. Only included when status is "PendingRelease".
         "releaseYear": int // The year in which the targetVersion is expected to be released. Only included when status is "PendingRelease".
      }
   ]
}

```

## Reschedule Update

Reschedule an update, if able.

### Flexible Update Management

The endpoint documented below is planned as part of the Flexible Update Management features shipping as part of 2024 release wave 1. The version number in which this will be introduced will be determined later.

```
PUT /admin/vX.XX/applications/{applicationType}/environments/{environmentName}/update
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body

```
// For a target version with status "Scheduled" or "Released".
{
   "runAfter": "datetime",  // Indicates the datetime for which the update is scheduled.
   "ignoreUpdateWindow": boolean, // Indicates whether the update window set for the environment can be ignored for the scheduled update.
   "targetVersion": string // Target version for the update to be scheduled. Must match the exact same target version as returned by the /availableUpdates endpoint.
}

// For a target version with status "PendingRelease"
{
   "targetVersion": string // Target version for the update to be scheduled. Must match the exact same target version as returned by the /availableUpdates endpoint.
}
```

### Legacy

The endpoint documented below is backwards compatible and intended to be used for environments on which Flexible Update Management scheduling options are not yet available.

```
Content-Type: application/json
PUT /admin/v2.24/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body

```
{
  "runOn": datetime, // Sets the date that the upgrade should be run on.
  "ignoreUpgradeWindow": boolean // Specifies if the upgrade window for the environment should be respected.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - no upgrade is currently scheduled for the targeted environment

` entityValidationFailed` - some unhandled error occurred in the validation of the request

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
