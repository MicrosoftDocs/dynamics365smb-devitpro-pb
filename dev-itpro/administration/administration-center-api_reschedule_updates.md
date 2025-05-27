---
title: Business Central Admin Center API - Reschedule Updates
description: Learn about the Business Central administration center API for rescheduling updates.
author: jswymer
ms.topic: article
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 03/31/2025
---

# Business Central Admin Center API - Reschedule Updates

Allows for the management of scheduled updates such as rescheduling the update to a run on or after a specific date within a provided range.

## Flexible Update Management

The endpoints documented below ship when flexible update management becomes generally available and apply only to environments on version 25.5 or higher. Prepare any integrations using the Admin Center API to use these endpoints to use the new scheduling features once flexible update management features are available on your environments.



### Get Updates

Get information about update target versions and their status for a specific environment.

```
GET /admin/v2.26/applications/{applicationFamily}/environments/{environmentName}/updates
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response

Returns information about updates available for the specified environment.

```
{
  "value": [
    {
      // Example for a target version that has been released and has been selected as next update for the specified environment
      "targetVersion": "26.1",
      "available": true, // Indicates whether the target version has been released
      "selected": true, // Indicates whether the next selected update is for this target version
      "scheduleDetails":
      {
        "latestSelectableDate": "YYYY-MM-DDTHH:MM:SSZ", // Indicates the last date for which the update to this target version can be scheduled
        "selectedDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Indicates the datetime for which the update to this target version has been scheduled
        "ignoreUpdateWindow": false, // Indicates whether the update window for the environment may be ignored when running this update
        "rolloutStatus": "Active" // Indicates the rollout status of updates to this target version, e.g. "Active", "UnderMaintenance", or "Postponed"
      }      
    },
    { 
      // Example for a target version that has been released but has not been selected as next update for the specified environment
      "targetVersion": "26.2",
      "available": true,
      "selected": false,  
      "scheduleDetails":
      {        
        "latestSelectableDate": "YYYY-MM-DDTHH:MM:SSZ",
        "selectedDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Specifies the date for which this update will be scheduled if Microsoft services select this as next update for the environment, null if no date has been specified by an environment administrator
        "ignoreUpdateWindow": false,
        "rolloutStatus": "Active"
      } 
    },
    {     
      // Example for a target version that has not yet been released but has been selected as next update for the specified environment
      "targetVersion": "26.3", 
      "available": false,
      "selected": true,
      "expectedAvailablity":
        "month": 8, // Indicates the number of the month in which the target version is expected to be released
        "year": 2025 // Indicates the year in which the target version is expected to be released
      }
    },
    {
      // Example for a target version that has not yet been released and has not been selected as next update for the specified environment
      "targetVersion": "26.4",
      "available": false,
      "selected": false,
      "expectedAvailablity": {
        "month": 9,
        "year": 2025
      }
    }
  ]
}
```

### Select target version for next environment update

Select a target version and update date for the next update on an environment. Only one target version can be selected per environment at a time; selecting a new target version for the next environment updates automatically unselects the previous target version.

```
PATCH /admin/v2.26/applications/{applicationFamily}/environments/{environmentName}/updates/{targetVersion}
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

`targetVersion` - Version number of the target version to be selected as next update, must match the value returned by the `GET /admin/vX.XX/applications/{applicationFamily}/environments/{environmentName}/updates` request.


#### Body

Example for selecting a target version that is available.

```
{
  "selected": true, // Optional. Must be true to select target version; setting this to false returns an error. Omitting it from the body changes scheduleDetails properties for the targetVersion without selecting it or for a targetVersion that is already selected
  "scheduleDetails": {
    "selectedDateTime": datetime // Specifies the datetime at which the environment update should start. If selected time is outside the environment update window, the update will start during the next update window
    "ignoreUpdateWindow": boolean // Specifies whether the update window set for the environment may be ignored for this update
  }
}
```

Example for selecting a target version that is not yet available.

```
{
  "selected": true, // Required. Must be true to select target version. Setting this to false returns an error
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

## Legacy
The legacy endpoints documented below are backwards compatible with the new endpoints introduced as part of flexible update management, but do not offer all scheduling options the new endpoints offer. It is recommended to update your integrations to use the flexible update management endpoints documented above for environments on version 25.5 or higher.

### Get Scheduled Update

Get information about the next update that is scheduled for a specific environment.

```
GET /admin/v2.24/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response

Returns information about the scheduled update for the specified environment.

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
  "ignoreUpgradeWindow": boolean, // Indicates if the environment's update window will be ignored
  "isActive": boolean, // Indicates if the update is activated and is scheduled to occur.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

## Reschedule Update

Reschedule the next update on the environment. It is not possible to specify a target version using this legacy endpoint.

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
